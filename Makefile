ALL_OBO_ONTS := $(shell cat reports/obo.tsv)
SELECTED_ONTS = obi mondo go envo ro hp mp zfa wbphenotype ecto upheno uberon_cm doid chebi pr wbphenotype fbbt dron

TEST_ONTOLOGIES = go-nucleus robot-example

all: $(patsubst %,all-%,$(ALL_OBO_ONTS))
selected: $(patsubst %,all-%,$(SELECTED_ONTS))

all-%: db/%.db
	echo $*


# ---
# tests
# ---
test: test_build unittest
unittest:
	python -s -m unittest tests/test_*.py

cp-%: tests/inputs/%.owl
	cp $< owl/

test_build: setup_tests $(patsubst %, test-build-%,$(TEST_ONTOLOGIES))

test-build-%: inferences/%-inf.tsv
	./utils/create-semsql-db.sh -v -f -r -d db/$*.db owl/$*.owl && cp db/$*.db tests/inputs/

setup_tests: $(patsubst %, cp-%,$(TEST_ONTOLOGIES))

realclean-%:
	rm target/$*.* ;
	rm db/$*.db


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
# sqlite db creation and loading
# ---
db/%.db: owl/%.owl inferences/%-inf.tsv bin/rdftab
	./utils/create-semsql-db.sh -v -f -d $@ $<
.PRECIOUS: db/%.db

# ---
# Inferences
# ---
# We use relation-graph
inferences/%-inf.ttl: owl/%.owl
	relation-graph --ontology-file $< --redundant-output-file $@ --non-redundant-output-file inferences/$*-nr.ttl --property http://purl.obolibrary.org/obo/BFO_0000050 
.PRECIOUS: inferences/%-inf.ttl

# currently tedious to get this back into a TSV that can be loaded into sqlite...
inferences/%-inf.owl: inferences/%-inf.ttl
	robot merge -i $< -i inferences/%-nr.ttl -o $@
.PRECIOUS: inferences/%-inf.owl
inferences/%-inf.tsv: inferences/%-inf.owl
	sqlite3 $@.db < prefixes/prefix.sql && ./bin/rdftab $@.db < $< && sqlite3 $@.db -cmd '.separator "\t"' -cmd '.header on' "SELECT subject,predicate,object FROM statements " > $@.tmp && mv $@.db $@.db.old && mv $@.tmp $@
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
# Downloads
# ---

owl/%.owl:
	curl -L -s http://purl.obolibrary.org/obo/$*.owl > $@.tmp && mv $@.tmp $@
.PRECIOUS: owl/%.owl 

owl/go.owl:
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-plus.owl > $@

owl/monarch.owl:
	robot merge -I http://purl.obolibrary.org/obo/upheno/monarch.owl -o $@


# ---
# GO Demo
# ---
demo/gaf/%.gaf.tsv:
	curl -L -s http://current.geneontology.org/annotations/$*.gaf.gz | gzip -dc | ./utils/gaf2tsv > $@
demo/gaf/%.gpi.tsv:
	curl -L -s http://current.geneontology.org/annotations/$*.gpi.gz | gzip -dc | ./utils/gpi2tsv > $@
demo/gaf/wb.gpi.tsv:
	curl -L -s ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/PRJNA13758/annotation/gene_product_info/c_elegans.PRJNA13758.current.gene_product_info.gpi.gz | gzip -dc | ./utils/gpi2tsv > $@
loadgaf-%: demo/gaf/%.gaf.tsv
	sqlite3 db/go.db -cmd '.separator "\t"' '.import $< gaf' && touch $@
loadgpi-%: demo/gaf/%.gpi.tsv
	sqlite3 db/go.db -cmd '.separator "\t"' '.import $< gpi' && touch $@

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

MODULES = rdf owl obo omo relation_graph semsql

# TODO: markdown gen should make modular output
markdown-%: src/schema/%.yaml
	gen-markdown --no-mergeimports -d docs $< && mv docs/index.md docs/$*_index.md
markdown: $(patsubst %, markdown-%, $(MODULES))
	gen-markdown --no-mergeimports -d docs src/schema/semsql.yaml

gen-ddl: $(patsubst %, ddl/%.sql, $(MODULES))
ddl/%.sql: src/schema/%.yaml
	gen-sqlddl --dialect sqlite --no-use-foreign-keys $< > $@.tmp && \
	python semsql/sqlutils/viewgen.py $< >> $@.tmp && \
	mv $@.tmp $@

reports/query-%.sql: src/schema/%.yaml
	python semsql/sqlutils/reportgen.py $< > $@


gen-sqla: $(patsubst %, semsql/sqla/%.py, $(MODULES))

# make SQL Alchemy models
semsql/sqla/%.py: src/schema/%.yaml
	gen-sqlddl --no-use-foreign-keys --sqla-file $@ $< 
