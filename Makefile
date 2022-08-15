OBO = http://purl.obolibrary.org/obo
RUN = poetry run
VERSION = $(shell git tag | tail -1)
SRC_DIR = src/semsql/linkml
BUILDER_DIR = src/semsql/builder
DDL_DIR = $(BUILDER_DIR)/sql_schema
YAML_DIR = src/semsql/linkml
SQLA_DIR = src/semsql/sqla

PREFIX_DIR = $(BUILDER_DIR)/prefixes


ALL_OBO_ONTS := $(shell cat reports/obo.tsv)
SELECTED_ONTS = obi mondo go envo ro hp mp zfa wbphenotype ecto upheno uberon_cm doid chebi pr wbphenotype fbbt dron

TEST_ONTOLOGIES = go-nucleus robot-example

all: build_all stage_all
build_all: $(patsubst %,all-%,$(ALL_OBO_ONTS))
stage_all: $(patsubst %,stage/%.db.gz,$(ALL_OBO_ONTS))

selected: $(patsubst %,all-%,$(SELECTED_ONTS))

all-%: db/%.db
	sqlite3 $< "SELECT COUNT(*) FROM statements"
stage/%.db.gz: db/%.db
	gzip -c $< > $@.tmp && mv $@.tmp $@

# INSTALL
include install.Makefile

# ---
# tests
# ---
#test: test_build unittest
test: unittest
unittest:
	$(RUN) python -s -m unittest tests/test_*/test_*.py

cp-%: tests/inputs/%.owl
	cp $< owl/

test_build: setup_tests $(patsubst %, test-build-%,$(TEST_ONTOLOGIES))

test-build-%: inferences/%-inf.tsv
	./utils/create-semsql-db.sh -v -f -r -d db/$*.db owl/$*.owl && cp db/$*.db tests/inputs/

# copy from tests/input to staging area
setup_tests: $(patsubst %, cp-%,$(TEST_ONTOLOGIES))

realclean-%:
	rm target/$*.* ;
	rm db/$*.db

# ---
# Prefixes
# ---
# TODO: sync with bioregistry
# NOTE: move this to build folder

build_prefixes: $(PREFIX_DIR)/prefixes.csv

$(PREFIX_DIR)/obo_prefixes.owl:
	robot convert -I http://purl.obolibrary.org/meta/obo_prefixes.ttl -o $@

$(PREFIX_DIR)/obo_prefixes.db: $(PREFIX_DIR)/obo_prefixes.owl
	sqlite3 $@ < $(PREFIX_DIR)/prefix_ddl.sql && ./bin/rdftab $@ < $<

$(PREFIX_DIR)/obo_prefixes.csv: $(PREFIX_DIR)/obo_prefixes.db
	sqlite3 $< -cmd ".separator ','" "SELECT p.value AS prefix, ns.value AS base FROM statements AS p JOIN statements AS ns ON (p.subject=ns.subject) WHERE p.predicate='<http://www.w3.org/ns/shacl#prefix>' AND ns.predicate='<http://www.w3.org/ns/shacl#namespace>'" > $@

$(PREFIX_DIR)/prefixes.csv: $(PREFIX_DIR)/prefixes_curated.csv $(PREFIX_DIR)/obo_prefixes.csv
	cat $^ > $@


# ---
# sqlite db creation and loading
# ---
db/%.db: db/%.owl
	$(RUN) semsql make $@
.PRECIOUS: db/%.db


# ---
# OBO Registry
# ---
# fetch list of ontologies from OBO registry


# first fetch ontology list in rdf/owl;
owl/obo-ontologies.owl:
	robot convert -I http://purl.obolibrary.org/meta/ontologies.ttl -o $@

# depends on .db build of rdf/owl - then export to TSV
# NOTE: currently there is a checked in copy of obo.tsv; use this, as we have pre-filtered ontologies that do not load
reports/obo.tsv: db/obo-ontologies.db
	sqlite3 $< "SELECT subject FROM ontology_status_statement WHERE value = 'active'" | perl -npe 's@^obo:@@' > $@

# to test
list-onts:
	echo $(ALL_OBO_ONTS)




# ---
# Reports
# ---
reports/%.problems.tsv: db/%.db target/%.views
	sqlite3 $<  "SELECT * FROM problems" > $@



# ---
# Downloads
# ---

STAMP:
	touch $@

# download OWL, ensuring converted to RDF/XML
db/%.owl: STAMP
	robot merge -I http://purl.obolibrary.org/obo/$*.owl -o $@
.PRECIOUS: db/%.owl 

db/foodon.owl: STAMP
	robot merge -I $(OBO)/foodon.owl relax reduce -c true -o $@

db/go.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-plus.owl > $@

db/monarch.owl:
	robot merge -I http://purl.obolibrary.org/obo/upheno/monarch.owl -o $@

db/phenio.owl:
	curl -L -s https://github.com/monarch-initiative/phenio/releases/download/latest/phenio.owl > $@.tmp && mv $@.tmp $@

db/bero.owl:
	curl -L -s https://github.com/berkeleybop/bero/releases/download/2022-05-26/bero.owl > $@.tmp && mv $@.tmp $@

db/reacto.owl:
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/reacto.owl > $@.tmp && mv $@.tmp $@

db/go-lego.owl:
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-lego.owl > $@.tmp && mv $@.tmp $@

db/bao.owl:
	robot merge -I http://www.bioassayontology.org/bao/bao_complete.owl -o $@

# https://github.com/ontodev/rdftab.rs/issues/21
db/biopax.owl:
	robot convert -I http://www.biopax.org/release/biopax-level3.owl -o $@

# https://github.com/enanomapper/ontologies/issues/323
db/enanomapper.owl:
	robot merge -I https://raw.githubusercontent.com/enanomapper/ontologies/master/enanomapper.owl -o $@

db/efo.owl: STAMP
	robot merge -I http://www.ebi.ac.uk/efo/efo.owl -o $@

db/edam.owl:
	curl -L -s http://edamontology.org/EDAM.owl > $@

db/sweetAll.owl:
	robot merge -I http://sweetontology.net/sweetAll -o $@

db/reactome-Homo-sapiens.owl: download/reactome-biopax.zip db/biopax.owl
	unzip -p $< Homo_sapiens.owl > $@.tmp &&\
	robot merge -i $@.tmp  -i db/biopax.owl -o $@

download/reactome-biopax.zip:
	curl -L -s https://reactome.org/download/current/biopax.zip > $@

#fma.owl:#
#	http://purl.org/sig/ont/fma.owl 


# ---
# Schema
# ---
# the section below here is only required for when changes to the schema is made;
# changing the yaml triggers changes in
#  - derived SQL DDL
#  - SQL Alchemy objects
#  - Docs

MODULES = rdf owl obo omo relation_graph semsql

GENDOC_ARGS = --no-mergeimports -d docs --template-directory docgen-templates

# TODO: markdown gen should make modular output
markdown-%: $(YAML_DIR)/%.yaml
	$(RUN) gen-doc $(GENDOC_ARGS) $< && mv docs/index.md docs/$*_index.md
markdown: $(patsubst %, markdown-%, $(MODULES))
	$(RUN) gen-doc $(GENDOC_ARGS) $(YAML_DIR)/semsql.yaml

gen-project: $(YAML_DIR)/semsql.yaml
	$(RUN) gen-project $< -d project

# Create SQL Create Table statements from linkml
# 1. first use generic ddl generation
# 2. Add views
GENDDL = $(RUN) gen-sqlddl --dialect sqlite --no-use-foreign-keys
gen-ddl: $(patsubst %, $(DDL_DIR)/%.sql, $(MODULES))
$(DDL_DIR)/%.sql: $(YAML_DIR)/%.yaml
	$(GENDDL)  $< > $@.tmp && \
	$(RUN) gen-semsql-views $< >> $@.tmp && \
	mv $@.tmp $@

reports/query-%.sql: $(YAML_DIR)/%.yaml
	$(RUN) python src/semsql/sqlutils/reportgen.py $< > $@

# Generate SQL Alchemy
gen-sqla: $(patsubst %, $(SQLA_DIR)/%.py, $(MODULES))

# make SQL Alchemy models
# requires linkml 1.2.5
$(SQLA_DIR)/%.py: $(YAML_DIR)/%.yaml
	$(RUN) gen-sqla --no-use-foreign-keys  $< >  $@

# -- makes bin/semsql --
# this is useful for core developers of semsql -
# this will create a one line bash script that
# can be added to your $PATH that will execute the
# version of semsql used in github
bin/%:
	echo `poetry run which $*` '$$*' > $@ && chmod +x $@


### DEPLOY

DATE = $(shell date -u +"%Y-%m-%d")

s3-deploy:
	aws s3 sync stage s3://bbop-sqlite --acl public-read && \
	aws s3 sync stage s3://bbop-sqlite/releases/$(DATE) --acl public-read

################################################
#### Commands for building the Docker image ####
################################################

IM=linkml/semantic-sql

docker-build-no-cache:
	@docker build --no-cache -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest

docker-build:
	@docker build -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest

docker-build-use-cache-dev:
	@docker build -t $(DEV):$(VERSION) . \
	&& docker tag $(DEV):$(VERSION) $(DEV):latest

docker-clean:
	docker kill $(IM) || echo not running ;
	docker rm $(IM) || echo not made 

docker-publish-no-build:
	@docker push $(IM):$(VERSION) \
	&& docker push $(IM):latest

docker-publish-dev-no-build:
	@docker push $(DEV):$(VERSION) \
	&& docker push $(DEV):latest

docker-publish: docker-build
	@docker push $(IM):$(VERSION) \
	&& docker push $(IM):latest

docker-run:
	@docker run  -v $(PWD):/work -w /work -ti $(IM):$(VERSION) 

test-docker-run:
	cd docker-test && docker run  -v `pwd`/db:/semsql/db -w /semsql -ti $(IM):$(VERSION) make -k all RUN=
