
OWL_SQL = rdf owl 
OBO_SQL = $(OWL_SQL) obo-checks
RG_SQL = $(OWL_SQL) relation-graph
ALL_SQL = $(OWL_SQL) relation-graph obo-checks

ALL_SQL_FILES = $(patsubst %,sql/%.sql,$(ALL_SQL))
sql/all.sql: $(ALL_SQL_FILES)
	cat $^ > $@

schemaload-%: db/%.db sql/all.sql
	sqlite3 -cmd ".echo on" $< < sql/all.sql && touch $@

problems-%: db/%.db schemaload-%
	sqlite3 $< -cmd "SELECT * FROM problems"

db/%.db: prefixes/prefix.sql
	sqlite3 $@ < $<
.PRECIOUS: db/%.db

load-%: db/%.db owl/%.owl
	./bin/rdftab $< < owl/$*.owl && touch $@

