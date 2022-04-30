RUN = poetry run

ALL_OBO_ONTS := $(shell cat reports/obo.tsv)
SELECTED_ONTS = obi mondo go envo ro hp mp zfa wbphenotype ecto upheno uberon_cm doid chebi pr wbphenotype fbbt dron

TEST_ONTOLOGIES = go-nucleus robot-example

all: $(patsubst %,all-%,$(ALL_OBO_ONTS))
selected: $(patsubst %,all-%,$(SELECTED_ONTS))

all-%: db/%.db
	sqlite3 $< "SELECT COUNT(*) FROM statements"


# ---
# tests
# ---
test: test_build unittest
unittest:
	$(RUN) python -s -m unittest 

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
# sqlite db creation and loading
# ---
db/%.db: owl/%.owl inferences/%-inf.tsv bin/rdftab
	./utils/create-semsql-db.sh -v -f -d $@ $<
.PRECIOUS: db/%.db

#foo/%.db: owl/%.owl inferences/%-inf.tsv bin/rdftab
#	./utils/create-semsql-db.sh -v -f -d $@ $<

# ---
### RDFTab
# ---
# from https://github.com/obi-ontology/obi/blob/master/Makefile#L49
#
# Use RDFTab to create SQLite databases from OWL files.
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
	RDFTAB_URL := https://github.com/ontodev/rdftab.rs/releases/download/v0.1.1/rdftab-x86_64-apple-darwin
	SED = sed -i.bak
else
	RDFTAB_URL := https://github.com/ontodev/rdftab.rs/releases/download/v0.1.1/rdftab-x86_64-unknown-linux-musl
	SED = sed -i
endif

bin/rdftab:
	curl -L -o $@ $(RDFTAB_URL)
	chmod +x $@

RG_VERSION=2.2.0
bin/relation-graph:
	curl -L -s https://github.com/balhoff/relation-graph/releases/download/v$(RG_VERSION)/relation-graph-cli-$(RG_VERSION).tgz | tar -zxv  && mv relation-graph-cli-$(RG_VERSION) relation-graph && (cd bin && ln -s ../relation-graph/bin/relation-graph)

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
# Inferences
# ---
# We use relation-graph

#RG_PROPS = --property http://purl.obolibrary.org/obo/BFO_0000050
RG_PROPS =

# we still want to do graph walking even when ontology is incoherent
inferences/%-no-disjoint.owl: owl/%.owl
	robot remove -i $< --axioms disjoint -o $@
.PRECIOUS: inferences/%-no-disjoint.owl

inferences/%-inf.ttl: inferences/%-no-disjoint.owl
	relation-graph  --disable-owl-nothing true --ontology-file $< --output-file $@.tmp --equivalence-as-subclass true --output-subclasses true --reflexive-subclasses true $(RG_PROPS) && mv $@.tmp $@
.PRECIOUS: inferences/%-inf.ttl

# currently tedious to get this back into a TSV that can be loaded into sqlite...
# https://github.com/balhoff/relation-graph/issues/123
# https://github.com/balhoff/relation-graph/issues/25
inferences/%-inf.owl: inferences/%-inf.ttl
	riot --out RDFXML $< > $@.tmp && mv $@.tmp $@
.PRECIOUS: inferences/%-inf.owl
inferences/%-inf.tsv: inferences/%-inf.owl
	sqlite3 $@.db -cmd ".mode csv" ".import prefixes/prefixes.csv prefix" && \
	./bin/rdftab $@.db < $< && \
	sqlite3 $@.db -cmd '.separator "\t"' -cmd '.header on' "SELECT subject,predicate,object FROM statements " > $@.tmp && mv $@.db $@.db.old && mv $@.tmp $@
.PRECIOUS: inferences/%-inf.tsv

#inferences/%.load: db/%.db inferences/%-inf.tsv
#	sqlite3 $< -cmd '.separator "\t"' '.import inferences/$*-inf.tsv entailed_edge' && touch $@
#.PRECIOUS: inferences/%.load


# ---
# Reports
# ---
reports/%.problems.tsv: db/%.db target/%.views
	sqlite3 $<  "SELECT * FROM problems" > $@


# ---
# Prefixes
# ---

prefixes/obo_prefixes.owl:
	robot convert -I http://purl.obolibrary.org/meta/obo_prefixes.ttl -o $@

prefixes/obo_prefixes.db: prefixes/obo_prefixes.owl
	sqlite3 $@ < prefixes/prefix_ddl.sql && ./bin/rdftab $@ < $<

prefixes/obo_prefixes.csv: prefixes/obo_prefixes.db
	sqlite3 $< -cmd ".separator ','" "SELECT p.value AS prefix, ns.value AS base FROM statements AS p JOIN statements AS ns ON (p.subject=ns.subject) WHERE p.predicate='<http://www.w3.org/ns/shacl#prefix>' AND ns.predicate='<http://www.w3.org/ns/shacl#namespace>'" > $@

prefixes/prefixes.csv: prefixes/prefixes_curated.csv prefixes/obo_prefixes.csv
	cat $^ > $@

# ---
# Downloads
# ---

# download OWL, ensuring converted to RDF/XML
owl/%.owl:
#	curl -L -s http://purl.obolibrary.org/obo/$*.owl > $@.tmp && mv $@.tmp $@
	robot merge -I http://purl.obolibrary.org/obo/$*.owl -o $@
.PRECIOUS: owl/%.owl 

owl/go.owl:
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-plus.owl > $@

owl/monarch.owl:
	robot merge -I http://purl.obolibrary.org/obo/upheno/monarch.owl -o $@

#fma.owl:#
#	http://purl.org/sig/ont/fma.owl 

# ---
# GO Demo
# ---
# TODO: move this
demo/gaf/%.gaf.tsv:
	curl -L -s http://current.geneontology.org/annotations/$*.gaf.gz | gzip -dc | ./utils/gaf2tsv > $@
demo/gaf/%.gpi.tsv:
	curl -L -s http://current.geneontology.org/annotations/$*.gpi.gz | gzip -dc | ./utils/gpi2tsv > $@
demo/gaf/wb.gpi.tsv:
	curl -L -s ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/PRJNA13758/annotation/gene_product_info/c_elegans.PRJNA13758.current.gene_product_info.gpi.gz | gzip -dc | ./utils/gpi2tsv > $@
demo/gaf/goa_uniprot_gcrp.gaf.gz:
	curl -L -s ftp://ftp.ebi.ac.uk/pub/databases/GO/goa/UNIPROT/goa_uniprot_gcrp.gaf.gz > $@
loadgaf-%: demo/gaf/%.gaf.tsv
	sqlite3 db/go.db -cmd '.separator "\t"' '.import $< gaf' && touch $@
loadgpi-%: demo/gaf/%.gpi.tsv
	sqlite3 db/go.db -cmd '.separator "\t"' '.import $< gpi' && touch $@

# faster loading, no need to create intermediate file
loadgafgz-%: demo/gaf/%.gaf.gz
	gzip -dc $< | ./utils/gaf2tsv | sqlite3 db/$*.db -cmd '.separator "\t"' -cmd ".import /dev/stdin gaf" 


download/idmapping.dat.gz:
	wget https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/idmapping/idmapping.dat.gz -O $@

CAMDIR = ../noctua-models/models/
trcams:
	find $(CAMDIR)/ -name "*.ttl" -exec sh -c "riot --out rdfxml {} > {}.rdfxml" \;
loadcams:
	 find $(CAMDIR) -name "*.ttl.rdfxml" -exec sh -c "./bin/rdftab db/go.db < {}" \;


# ---
# Schema
# ---
# the section below here is only required for when changes to the schema is made;
# changing the yaml triggers changes in
#  - derived SQL DDL
#  - SQL Alchemy objects
#  - Docs

MODULES = rdf owl obo omo relation_graph semsql

# TODO: markdown gen should make modular output
markdown-%: src/schema/%.yaml
	$(RUN) gen-markdown --no-mergeimports -d docs $< && mv docs/index.md docs/$*_index.md
markdown: $(patsubst %, markdown-%, $(MODULES))
	$(RUN) gen-markdown --no-mergeimports -d docs src/schema/semsql.yaml

gen-project: src/schema/semsql.yaml
	$(RUN) gen-project $< -d project

# Create SQL Create Table statements from linkml
GENDDL = $(RUN) gen-sqlddl --dialect sqlite --no-use-foreign-keys
gen-ddl: $(patsubst %, ddl/%.sql, $(MODULES))
ddl/%.sql: src/schema/%.yaml
	$(GENDDL)  $< > $@.tmp && \
	$(RUN) python semsql/sqlutils/viewgen.py $< >> $@.tmp && \
	mv $@.tmp $@

reports/query-%.sql: src/schema/%.yaml
	$(RUN) python semsql/sqlutils/reportgen.py $< > $@

# Generate SQL Alchemy
gen-sqla: $(patsubst %, semsql/sqla/%.py, $(MODULES))

# make SQL Alchemy models
# requires linkml 1.2.5
semsql/sqla/%.py: src/schema/%.yaml
	$(RUN) gen-sqla --no-use-foreign-keys  $< >  $@

# DOCKER

# Building docker image
VERSION = "v0.0.1"
IM=cmungall/semantic-sql

docker-build-no-cache:
	@docker build  --build-arg SEMSQL_VERSION=$(VERSION) $(ROBOT_JAR_ARGS) --no-cache -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest && docker tag $(IM):$(VERSION) $(DEV):latest && \
	docker build -f docker/odklite/Dockerfile -t $(IMLITE):$(VERSION) . \
	&& docker tag $(IMLITE):$(VERSION) $(IMLITE):latest && cd docker/robot/ && make docker-build

docker-build:
	@docker build --build-arg SEMSQL_VERSION=$(VERSION)  $(ROBOT_JAR_ARGS)  -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM) && docker tag $(IM):$(VERSION) $(DEV):latest && \
	docker build -f docker/odklite/Dockerfile -t $(IMLITE):$(VERSION) . \
	&& docker tag $(IMLITE):$(VERSION) $(IMLITE):latest && cd docker/robot/ && make docker-build

docker-build-dev:
	@docker build --build-arg SEMSQL_VERSION=$(VERSION) -t $(DEV):$(VERSION) . \
	&& docker tag $(DEV):$(VERSION) $(DEV):latest

docker-clean:
	docker kill $(IM) || echo not running ;
	docker rm $(IM) || echo not made 

### DEPLOY

s3-deploy:
	aws s3 sync db s3://bbop-sqlite --acl public-read
