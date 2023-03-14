RUN = poetry run

input/%.owl:
	robot merge -I http://purl.obolibrary.org/obo/$*.owl -o $@
.PRECIOUS: input/%.owl

fake/%.owl: input/%.owl
	cp $< $@

input/%.db: input/%.owl
	$(RUN) semsql make $@

fake/%.db: fake/%.owl
	touch conf/bad-prefixes.csv && \
	$(RUN) semsql make $@ -P conf/bad-prefixes.csv
.PRECIOUS: fake/%.db

fake/%.tree: fake/%.db
	runoak -i $< tree -p i,p .all -o $@

test-bad-prefix: fake/hsapdv.db
	runoak -i $< info i^HsapDvFAKE: | head -5 | grep HsapDvFAKE && echo pass

input/%.tree: input/%.db
	runoak -i $< tree -p i,p .all -o $@
