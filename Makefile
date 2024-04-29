OBO = http://purl.obolibrary.org/obo
RUN = poetry run
VERSION = $(shell git tag | tail -1)
SRC_DIR = src/semsql/linkml
BUILDER_DIR = src/semsql/builder
DDL_DIR = $(BUILDER_DIR)/sql_schema
YAML_DIR = src/semsql/linkml
SQLA_DIR = src/semsql/sqla
ONT_REGISTRY = src/semsql/builder/registry/ontologies.yaml 

PREFIX_DIR = $(BUILDER_DIR)/prefixes


ALL_OBO_ONTS := $(shell cat reports/obo.tsv)
SELECTED_ONTS = obi mondo go envo ro hp mp zfa wbphenotype ecto upheno uberon_cm doid chebi pr wbphenotype fbbt dron

# EXTRA_ONTOLOGIES is defined in ontologies.Makefile
ALL_ONTS = $(ALL_OBO_ONTS) $(EXTRA_ONTOLOGIES)

STAGED_ONTOLOGIES = $(patsubst %, stage/%.db.gz, $(ALL_ONTS))

TEST_ONTOLOGIES = go-nucleus robot-example

# environment variables
include config.env

GEN_PARGS =
ifdef LINKML_GENERATORS_PROJECT_ARGS
GEN_PARGS = ${LINKML_GENERATORS_PROJECT_ARGS}
endif

GEN_DARGS =
ifdef LINKML_GENERATORS_MARKDOWN_ARGS
GEN_DARGS = ${LINKML_GENERATORS_MARKDOWN_ARGS}
endif


include ontologies.Makefile

all: build_all stage_all
build_all: $(patsubst %, all-%, $(ALL_ONTS))
	echo building $(ALL_ONTS)
stats_all: $(patsubst %, statistics/%.statistics.yaml, $(ALL_ONTS))
	echo building $(ALL_ONTS)
validate_all: $(patsubst %, validation/%.validate.tsv, $(ALL_ONTS))
	echo building $(ALL_ONTS)
stage_all: $(STAGED_ONTOLOGIES)
	echo done $(STAGED_ONTOLOGIES)

selected: $(patsubst %,all-%,$(SELECTED_ONTS))

all-%: db/%.db
	sqlite3 $< "SELECT COUNT(*) FROM statements"
stage/%.db.gz: STAMP
	gzip -c db/$*.db > $@.tmp && mv $@.tmp $@
#stage/%.db.gz: 
#	gzip -c db/$*.db > $@.tmp && mv $@.tmp $@
.PRECIOUS: stage/%.db.gz

list-onts:
	echo $(ALL_ONTS)
list-extra:
	echo $(EXTRA_ONTOLOGIES)
list-staged:
	ls -alt $(STAGED_ONTOLOGIES)

# INSTALL
include install.Makefile
#include ontologies.Makefile

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

build_prefixes: $(PREFIX_DIR)/prefixes.csv $(PREFIX_DIR)/prefixes.yaml

$(PREFIX_DIR)/obo_prefixes.owl: $(STAMP)
	robot convert -I http://purl.obolibrary.org/meta/obo_prefixes.ttl -o $@

$(PREFIX_DIR)/obo_prefixes.db: $(PREFIX_DIR)/obo_prefixes.owl
	sqlite3 $@ < $(PREFIX_DIR)/prefix_ddl.sql && rdftab $@ < $<

$(PREFIX_DIR)/obo_prefixes.csv: $(PREFIX_DIR)/obo_prefixes.db
	sqlite3 $< -cmd ".separator ','" "SELECT p.value AS prefix, ns.value AS base FROM statements AS p JOIN statements AS ns ON (p.subject=ns.subject) WHERE p.predicate='<http://www.w3.org/ns/shacl#prefix>' AND ns.predicate='<http://www.w3.org/ns/shacl#namespace>'" > $@

$(PREFIX_DIR)/prefixes.csv: $(PREFIX_DIR)/prefixes_curated.csv $(PREFIX_DIR)/prefixes_local.csv $(PREFIX_DIR)/obo_prefixes.csv
	cat $^ > $@

# see https://github.com/INCATools/relation-graph/issues/168
$(PREFIX_YAML_PATH): $(PREFIX_CSV_PATH)
	grep -v ^prefix, $< | grep -v ^obo, | perl -npe 's@,(.*)@: "$$1"@'  > $@.tmp && mv $@.tmp $@



# ---
# sqlite db creation and loading
# ---
db/%.db: db/%.owl
	$(RUN) semsql make $@
.PRECIOUS: db/%.db

statistics/%.statistics.yaml: db/%.db
	runoak -i $< statistics --group-by-prefix -o $@

validation/%.validate.tsv: db/%.db
	runoak -i $< validate -o $@

# ---
# OBO Registry
# ---
# fetch list of ontologies from OBO registry


# first fetch ontology list in rdf/owl;
db/obo-ontologies.owl:
	robot convert -I http://purl.obolibrary.org/meta/ontologies.ttl -o $@

# depends on .db build of rdf/owl - then export to TSV
# NOTE: currently there is a checked in copy of obo.tsv; use this, as we have pre-filtered ontologies that do not load
reports/obo.tsv: db/obo-ontologies.db
	sqlite3 $< "SELECT subject FROM ontology_status_statement WHERE value = 'active'" | perl -npe 's@^obo:@@' > $@




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

## Additional ontologies

src/semsql/builder/registry/registry_schema.py: src/semsql/builder/registry/registry_schema.yaml
	$(RUN) gen-python $< > $@

ontologies.Makefile: $(ONT_REGISTRY)
	$(RUN) semsql generate-makefile -P src/semsql/builder/prefixes/prefixes_local.csv $< > $@.tmp && mv $@.tmp $@

include ontologies.Makefile



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

GENDOC_ARGS = -d docs --template-directory docgen-templates

# TODO: markdown gen should make modular output
markdown-%: $(YAML_DIR)/%.yaml
	$(RUN) gen-doc $(GENDOC_ARGS) $< && mv docs/index.md docs/$*_index.md
markdown: $(patsubst %, markdown-%, $(MODULES))
	$(RUN) gen-doc $(GENDOC_ARGS) $(YAML_DIR)/semsql.yaml

gendoc: markdown

gen-project: $(YAML_DIR)/semsql.yaml
	$(RUN) gen-project  ${GEN_PARGS} $< -d project

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
	aws s3 sync stage s3://bbop-sqlite --acl public-read

s3-version:
	aws s3 sync stage s3://bbop-sqlite/releases/$(DATE) --acl public-read

s3-deploy-%: stage/%.db.gz
	aws s3 cp $< s3://bbop-sqlite/$*.db.gz --acl public-read


# Test documentation locally
serve: mkd-serve

# Python datamodel
$(PYMODEL):
	mkdir -p $@


$(DOCDIR):
	mkdir -p $@

testdoc: gendoc serve

MKDOCS = $(RUN) mkdocs
mkd-%:
	$(MKDOCS) $*

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
