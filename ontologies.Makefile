download/chiro.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/chiro.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chiro.owl

db/chiro.owl: download/chiro.owl
	robot relax -i $< merge -o $@


download/ncit.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/ncit.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ncit.owl

db/ncit.owl: download/ncit.owl
	robot relax -i $< merge -o $@


download/fma.owl: STAMP
	curl -L -s http://sig.biostr.washington.edu/share/downloads/fma/release/latest/fma.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/fma.owl

db/fma.owl: download/fma.owl
	cp $< $@


download/maxo.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/maxo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/maxo.owl

db/maxo.owl: download/maxo.owl
	robot relax -i $< merge reason -r structural -o $@


download/foodon.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/foodon.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/foodon.owl

db/foodon.owl: download/foodon.owl
	robot merge -i $< relax reduce -c true -o $@


download/chebiplus.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/chebi.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chebiplus.owl

db/chebiplus.owl: download/chebiplus.owl
	robot merge -i $< -I http://purl.obolibrary.org/obo/chiro.owl relax -o $@


download/msio.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/MSI-Metabolomics-Standards-Initiative/MSIO/master/releases/latest_release/MSIO-merged-reasoned.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/msio.owl

db/msio.owl: download/msio.owl
	cp $< $@


download/modl.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/Data-Semantics-Laboratory/modular-ontology-design-library/master/MODL.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/modl.owl

db/modl.owl: download/modl.owl
	cp $< $@


download/phenio.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/phenio/releases/latest/download/phenio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/phenio.owl

db/phenio.owl: download/phenio.owl
	cp $< $@


download/comploinc.owl: STAMP
	curl -L -s https://github.com/loinc/comp-loinc/releases/download/v2022-11-05/merged_reasoned_loinc.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/comploinc.owl

db/comploinc.owl: download/comploinc.owl
	robot relax -i $< merge -o $@


download/bero.owl: STAMP
	curl -L -s https://github.com/berkeleybop/bero/releases/download/2022-05-26/bero.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bero.owl

db/bero.owl: download/bero.owl
	cp $< $@


download/aio.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/main/aio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/aio.owl

db/aio.owl: download/aio.owl
	cp $< $@


download/reacto.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/reacto.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/reacto.owl

db/reacto.owl: download/reacto.owl
	cp $< $@


download/bcio.owl: STAMP
	curl -L -s http://humanbehaviourchange.org/ontology/bcio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bcio.owl

db/bcio.owl: download/bcio.owl
	cp $< $@


download/oeo.owl: STAMP
	curl -L -s http://openenergy-platform.org/ontology/oeo/ > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/oeo.owl

db/oeo.owl: download/oeo.owl
	cp $< $@


download/go.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-plus.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/go.owl

db/go.owl: download/go.owl
	cp $< $@


download/go-lego.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-lego.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/go-lego.owl

db/go-lego.owl: download/go-lego.owl
	cp $< $@


download/bao.owl: STAMP
	curl -L -s http://www.bioassayontology.org/bao/bao_complete.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bao.owl

db/bao.owl: download/bao.owl
	robot merge -i $< -o $@


download/orcid.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/cthoyt/wikidata-orcid-ontology/main/orcid.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/orcid.owl

db/orcid.owl: download/orcid.owl
	cp $< $@


download/cpont.owl: STAMP
	curl -L -s https://w3id.org/cpont/cpont.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/cpont.owl

db/cpont.owl: download/cpont.owl
	cp $< $@


download/biolink.owl: STAMP
	curl -L -s https://w3id.org/biolink/biolink-model.owl.ttl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/biolink.owl

db/biolink.owl: download/biolink.owl
	robot merge -i $< -o $@


download/biopax.owl: STAMP
	curl -L -s http://www.biopax.org/release/biopax-level3.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/biopax.owl

db/biopax.owl: download/biopax.owl
	cp $< $@


download/enanomapper.owl: STAMP
	curl -L -s http://enanomapper.github.io/ontologies/enanomapper.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/enanomapper.owl

db/enanomapper.owl: download/enanomapper.owl
	robot merge -i $< -o $@


download/mlo.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/main/external/ml-ontology-202010021305.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/mlo.owl

db/mlo.owl: download/mlo.owl
	robot merge -i $< -o $@


download/ito.owl: STAMP
	curl -L -s https://github.com/OpenBioLink/ITO/raw/master/ITO.owl.zip > $@.zip.tmp && unzip -p $@.zip.tmp {ont.zip_extract_file} > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ito.owl

db/ito.owl: download/ito.owl
	cp $< $@


download/reactome-Homo-sapiens.owl: STAMP
	curl -L -s https://reactome.org/download/current/biopax.zip > $@.zip.tmp && unzip -p $@.zip.tmp {ont.zip_extract_file} > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/reactome-Homo-sapiens.owl

db/reactome-Homo-sapiens.owl: download/reactome-Homo-sapiens.owl
	cp $< $@


download/efo.owl: STAMP
	curl -L -s http://www.ebi.ac.uk/efo/efo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/efo.owl

db/efo.owl: download/efo.owl
	robot merge -i $< -o $@


download/hcao.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/HumanCellAtlas/ontology/master/hcao.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/hcao.owl

db/hcao.owl: download/hcao.owl
	cp $< $@


download/edam.owl: STAMP
	curl -L -s http://edamontology.org/EDAM.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/edam.owl

db/edam.owl: download/edam.owl
	cp $< $@


download/sweetAll.owl: STAMP
	curl -L -s http://sweetontology.net/sweetAll > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/sweetAll.owl

db/sweetAll.owl: download/sweetAll.owl
	robot merge -i $< -o $@


download/lov.owl: STAMP
	curl -L -s https://lov.linkeddata.es/lov.n3.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/lov.owl

db/lov.owl: download/lov.owl
	robot merge -i $< -o $@


download/schema-dot-org.owl: STAMP
	curl -L -s https://schema.org/version/latest/schemaorg-current-https.rdf > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/schema-dot-org.owl

db/schema-dot-org.owl: download/schema-dot-org.owl
	cp $< $@


download/cellosaurus.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/calipho-sib/cellosaurus/master/cellosaurus.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/cellosaurus.owl

db/cellosaurus.owl: download/cellosaurus.owl
	robot merge -i $< -o $@


download/cosmo.owl: STAMP
	curl -L -s https://micra.com/COSMO/COSMO.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/cosmo.owl

db/cosmo.owl: download/cosmo.owl
	robot merge -i $< -o $@


download/dbpendiaont.owl: STAMP
	curl -L -s https://databus.dbpedia.org/ontologies/dbpedia.org/ontology--DEV/2023.01.03-072003/ontology--DEV_type=parsed.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dbpendiaont.owl

db/dbpendiaont.owl: download/dbpendiaont.owl
	cp $< $@


download/co_324.owl: STAMP
	curl -L -s https://cropontology.org/ontology/CO_324/rdf > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/co_324.owl

db/co_324.owl: download/co_324.owl
	cp $< $@


download/interpro.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/interpro/92.0/interpro.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/interpro.owl

db/interpro.owl: download/interpro.owl
	robot merge -i $< -o $@


download/hgnc.genegroup.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/hgnc.genegroup/hgnc.genegroup.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/hgnc.genegroup.owl

db/hgnc.genegroup.owl: download/hgnc.genegroup.owl
	cp $< $@


download/hgnc.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/hgnc/2022-06-01/hgnc.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/hgnc.owl

db/hgnc.owl: download/hgnc.owl
	cp $< $@


download/dictybase.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/dictybase/dictybase.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dictybase.owl

db/dictybase.owl: download/dictybase.owl
	cp $< $@


download/eccode.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/eccode/25-May-2022/eccode.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/eccode.owl

db/eccode.owl: download/eccode.owl
	cp $< $@


download/uniprot.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/uniprot/2022_02/uniprot.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/uniprot.owl

db/uniprot.owl: download/uniprot.owl
	cp $< $@


download/rhea.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/rhea/122/rhea.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/rhea.owl

db/rhea.owl: download/rhea.owl
	cp $< $@


download/swisslipid.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/swisslipid/2023-02-03/swisslipid.obo.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/swisslipid.owl

db/swisslipid.owl: download/swisslipid.owl
	robot merge -i $< -o $@


download/drugbank.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/drugbank/5.1.9/drugbank.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/drugbank.owl

db/drugbank.owl: download/drugbank.owl
	cp $< $@


download/drugcentral.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/drugcentral.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/drugcentral.owl

db/drugcentral.owl: download/drugcentral.owl
	cp $< $@


download/complexportal.owl: STAMP
	curl -L -s https://github.com/biopragmatics/obo-db-ingest/raw/main/export/complexportal/2022-02-03/complexportal.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/complexportal.owl

db/complexportal.owl: download/complexportal.owl
	cp $< $@


download/drugmechdb.owl: STAMP
	curl -L -s None > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/drugmechdb.owl

db/drugmechdb.owl: download/drugmechdb.owl
	cp $< $@


download/rxnorm.owl: STAMP
	curl -L -s None > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/rxnorm.owl

db/rxnorm.owl: download/rxnorm.owl
	cp $< $@


download/%.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/$*.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/%.owl

db/%.owl: download/%.owl
	robot merge -i $< -o $@

EXTRA_ONTOLOGIES = chiro ncit fma maxo foodon chebiplus msio modl phenio comploinc bero aio reacto bcio oeo go go-lego bao orcid cpont biolink biopax enanomapper mlo ito reactome-Homo-sapiens efo hcao edam sweetAll lov schema-dot-org cellosaurus cosmo dbpendiaont co_324 interpro hgnc.genegroup hgnc dictybase eccode uniprot rhea swisslipid drugbank drugcentral complexportal drugmechdb rxnorm
