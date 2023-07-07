# ----------------
# -- PARAMETERS --
# ----------------

# Directory containing this Makefile
# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
PREFIX_DIR = $(THIS_DIR)prefixes

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
#$(TEMPLATE): $(THIS_DIR)/sql_schema/semsql.sql build_prefixes
#	cat $< | sqlite3 $@.tmp && \
#	echo .exit | sqlite3 -echo $@.tmp -cmd ".mode csv" -cmd ".import $(THIS_DIR)/prefixes/prefixes.csv prefix" && \
#	mv $@.tmp $@
#.PRECIOUS: $(TEMPLATE)

%-min.owl: %.owl
	robot \
	  remove -i $< --axioms "equivalent disjoint annotation abox type" \
	  filter --exclude-terms $(THIS_DIR)/exclude-terms.txt \
	  -o $@

PREFIX_CSV_PATH = $(PREFIX_DIR)/prefixes.csv
PREFIX_YAML_PATH = $(PREFIX_DIR)/prefixes.yaml

# -- MAIN TARGET --
# A db is constructed from
# (1) triples loaded using rdftab
# (2) A relation-graph TSV
%.db: %.owl %-$(RGSUFFIX).tsv $(PREFIX_CSV_PATH)
	rm -f $@.tmp && \
	cat $(THIS_DIR)/sql_schema/semsql.sql | sqlite3 $@.tmp && \
	echo .exit | sqlite3 -echo $@.tmp -cmd ".mode csv" -cmd ".import $(PREFIX_CSV_PATH) prefix" && \
	rdftab $@.tmp < $< && \
	sqlite3 $@.tmp -cmd '.separator "\t"' ".import $*-$(RGSUFFIX).tsv entailed_edge" && \
	gzip -f $*-$(RGSUFFIX).tsv && \
	cat $(THIS_DIR)/indexes/*.sql | sqlite3 $@.tmp && \
	echo "ALTER TABLE statements ADD COLUMN graph TEXT;" | sqlite3 $@.tmp && \
	mv $@.tmp $@
.PRECIOUS: %.db

%-prefixes.yaml: $(PREFIX_CSV_PATH)
	grep -v ^prefix, $< | grep -v ^obo, | perl -npe 's@,(.*)@: "$$1"@'  > $@.tmp && mv $@.tmp $@

# -- ENTAILED EDGES --
# relation-graph is used to compute entailed edges.
%-$(RGSUFFIX).tsv: %-min.owl %-properties.txt %-prefixes.yaml
	$(RG) --disable-owl-nothing true \
                       --ontology-file $<\
		       $(RG_PROPERTIES) \
                       --output-file $@.tmp \
                       --equivalence-as-subclass true \
                       --mode TSV \
		       --prefixes $*-prefixes.yaml \
	               --output-individuals true \
	               --output-subclasses true \
                       --reflexive-subclasses true && \
	mv $@.tmp $@
.PRECIOUS: %-$(RGSUFFIX).tsv

%-properties.txt:
	touch $@

