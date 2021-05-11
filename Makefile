ONTS = obi mondo go envo ro hp mp zfa wbphenotype ecto upheno uberon_cm doid chebi pr wbphenotype fbbt dron

OWL_SQL = rdf owl 
OBO_SQL = $(OWL_SQL) obo-checks
RG_SQL = $(OWL_SQL) relation-graph
ALL_SQL = $(OWL_SQL) relation-graph obo-checks


all: $(patsubst %,all-%,$(ONTS))

all-%: target/%.load target/%.views inferences/%.load reports/%.problems.tsv
	echo $*

realclean-%:
	rm target/$*.* ;
	rm db/$*.db

ALL_SQL_FILES = $(patsubst %,sql/%.sql,$(ALL_SQL))
sql/all.sql: $(ALL_SQL_FILES)
	cat $^ > $@

# ---
# sqlite db creation and loading
# ---
target/%.created: db/$*.db
	touch $@
db/%.db: prefixes/prefix.sql sql/rdftab.sql
	cat $^ | sqlite3 $@ && echo OK || echo ALREADY LOADED
.PRECIOUS: db/%.db

target/%.load: target/%.created owl/%.owl
	./bin/rdftab db/$*.db < owl/$*.owl && touch $@
.PRECIOUS: target/%.load

target/%.views: db/%.db sql/all.sql
	sqlite3 -cmd ".echo on" $< < sql/all.sql ; touch $@
.PRECIOUS: target/%.load


# ---
# Inferences
# ---
# We use relation-graph
inferences/%-inf.ttl: owl/%.owl
	relation-graph --ontology-file $< --redundant-output-file $@ --non-redundant-output-file inferences/$*-nr.ttl --property http://purl.obolibrary.org/obo/BFO_0000050 
.PRECIOUS: inferences/%-inf.ttl

inferences/%-inf.owl: inferences/%-inf.ttl
	robot convert -i $< -o $@
.PRECIOUS: inferences/%-inf.owl
inferences/%-inf.tsv: inferences/%-inf.owl
	sqlite3 $@.db < prefixes/prefix.sql && ./bin/rdftab $@.db < $< && sqlite3 $@.db -cmd '.separator "\t"' -cmd '.header on' "SELECT subject,predicate,object FROM statements " > $@.tmp && mv $@.db $@.db.old && mv $@.tmp $@
.PRECIOUS: inferences/%-inf.tsv

inferences/%.load: db/%.db inferences/%-inf.tsv
	sqlite3 $< -cmd '.separator "\t"' '.import inferences/$*-inf.tsv entailed_edge' && touch $@
.PRECIOUS: inferences/%.load


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

# ---
# GO Demo
# ---
demo/gaf/%.gaf.tsv:
	curl -L -s http://current.geneontology.org/annotations/$*.gaf.gz | gzip -dc | ./utils/gaf2tsv > $@
loadgaf-%: demo/gaf/%.gaf.tsv
	sqlite3 db/go.db -cmd '.separator "\t"' '.import $< gaf' && touch $@

download/idmapping.dat.gz:
	wget https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/idmapping/idmapping.dat.gz -O $@

CAMDIR = ../noctua-models/models/
loadcams:
	 find $(CAMDIR) -name "*.ttl" -exec sh -c "riot --out rdfxml {} | ./bin/rdftab db/go.db" \;


# ---
# Schema
# ---

MODULES = rdf owl obo

# TODO: markdown gen should make modular output
markdown-%: src/schema/%.yaml
	gen-markdown --no-mergeimports -d docs $< && mv docs/index.md docs/$*_index.md
markdown: $(patsubst %, markdown-%, $(MODULES))
	gen-markdown --no-mergeimports -d docs src/schema/semsql.yaml

gen-ddl: $(patsubst %, ddl/%.sql, $(MODULES))
ddl/%.sql: src/schema/%.yaml
	gen-sqlddl --no-use-foreign-keys $< > $@.tmp && \
	python semsql/sqlutils.py $< >> $@.tmp && \
	mv $@.tmp $@

gen-sqla: $(patsubst %, semsql/sqla/%.py, $(MODULES))
semsql/sqla/%.py: src/schema/%.yaml
	gen-sqlddl --no-use-foreign-keys --sqla-file $@ $< 
