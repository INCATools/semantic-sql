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

RG_VERSION=2.3.0
bin/relation-graph:
	curl -L -s https://github.com/balhoff/relation-graph/releases/download/v$(RG_VERSION)/relation-graph-cli-$(RG_VERSION).tgz | tar -zxv  && mv relation-graph-cli-$(RG_VERSION) relation-graph && (cd bin && ln -s ../relation-graph/bin/relation-graph)

