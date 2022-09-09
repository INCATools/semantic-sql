db/phenio.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/phenio/releases/download/latest/phenio.owl > $@.tmp && mv $@.tmp $@

db/bero.owl: STAMP
	curl -L -s https://github.com/berkeleybop/bero/releases/download/2022-05-26/bero.owl > $@.tmp && mv $@.tmp $@

db/aio.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/main/aio.owl > $@.tmp && mv $@.tmp $@

db/reacto.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/reacto.owl > $@.tmp && mv $@.tmp $@

db/go-lego.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-lego.owl > $@.tmp && mv $@.tmp $@

db/bao.owl: STAMP
	robot merge -I http://www.bioassayontology.org/bao/bao_complete.owl -o $@

db/biolink.owl: STAMP
	robot merge -I https://w3id.org/biolink/biolink-model.owl.ttl -o $@

db/biopax.owl: STAMP
	curl -L -s http://www.biopax.org/release/biopax-level3.owl > $@.tmp && mv $@.tmp $@

db/enanomapper.owl: STAMP
	robot merge -I http://enanomapper.github.io/ontologies/enanomapper.owl -o $@

db/efo.owl: STAMP
	robot merge -I http://www.ebi.ac.uk/efo/efo.owl -o $@

db/edam.owl: STAMP
	curl -L -s http://edamontology.org/EDAM.owl > $@.tmp && mv $@.tmp $@

db/sweetAll.owl: STAMP
	robot merge -I http://sweetontology.net/sweetAll -o $@

db/lov.owl: STAMP
	robot merge -I https://lov.linkeddata.es/lov.n3.gz -o $@

db/schema-dot-org.owl: STAMP
	curl -L -s https://schema.org/version/latest/schemaorg-current-https.rdf > $@.tmp && mv $@.tmp $@


