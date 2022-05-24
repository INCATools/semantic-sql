# ----------------
# -- PARAMETERS --
# ----------------

# Directory containing this Makefile
# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

# Template sqlite database
TEMPLATE = .template.db

# intermediate RG files
RGSUFFIX = relation-graph

# path to relation-graph
# (this is in the current path in odk docker)
RG = relation-graph

# ----------------
# -- TOP LEVEL  --
# ----------------
all: help

help:
	@echo "Type 'make /path/to/FOO.db' where FOO.owl exists in the same folder"

# ----------------
# -- MAIN BUILD --
# ----------------

# -- TEMPLATE --
# All dbs are made from an initial template containing
# (1) prefixes
# (2) SQL Schema (primarily views)
$(TEMPLATE): $(THIS_DIR)/sql_schema/semsql.sql
	cat $< | sqlite3 $@.tmp && \
	sqlite3 -echo $@.tmp -cmd ".mode csv" -cmd ".import $(THIS_DIR)/prefixes/prefixes.csv prefix" -cmd ".exit" && \
	mv $@.tmp $@
.PRECIOUS: $(TEMPLATE)

%-min.owl: %.owl
	robot remove -i $< --axioms "equivalent disjoint annotation" -o $@

# -- MAIN TARGET --
# A db is constructed from
# (1) triples loaded using rdftab
# (2) A relation-graph TSV
%.db: %.owl %-$(RGSUFFIX).tsv $(TEMPLATE)
	cp $(TEMPLATE) $@.tmp && \
	rdftab $@.tmp < $< && \
	sqlite3 $@.tmp -cmd '.separator "\t"' ".import $*-$(RGSUFFIX).tsv entailed_edge" && \
	gzip $*-$(RGSUFFIX).tsv && \
	cat $(THIS_DIR)/indexes/*.sql | sqlite3 $@.tmp && \
	mv $@.tmp $@
.PRECIOUS: %.db

# -- ENTAILED EDGES --
# relation-graph is used to compute entailed edges.
#
# this currently requires a few different steps, because
#  - RG currently outputs TTL
#  - We need a TSV using correct prefixes/CURIEs to load into our db
#
# will be simplified in future. See:
#  - https://github.com/balhoff/relation-graph/issues/123
#  - https://github.com/balhoff/relation-graph/issues/25
%-$(RGSUFFIX).tsv: %-min.owl
	$(RG) --disable-owl-nothing true \
                       --ontology-file $<\
                       --output-file $@.ttl.tmp \
                       --equivalence-as-subclass true \
	               --output-subclasses true \
                       --reflexive-subclasses true && \
	riot --out RDFXML $@.ttl.tmp > $@.owl.tmp && \
	sqlite3 $@.db.tmp -cmd ".mode csv" ".import $(THIS_DIR)/prefixes/prefixes.csv prefix" && \
	rdftab $@.db.tmp < $@.owl.tmp && \
	sqlite3 $@.db.tmp -cmd '.separator "\t"' -cmd '.header on' "SELECT subject,predicate,object FROM statements " > $@.tmp && \
	mv $@.tmp $@ && \
	rm $@.*.tmp
.PRECIOUS: %-$(RGSUFFIX).tsv
