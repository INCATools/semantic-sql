download/swo.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/swo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/swo.owl

db/swo.owl: download/swo.owl
	robot merge -i $<  -o $@


download/chiro.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/chiro.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chiro.owl

db/chiro.owl: download/chiro.owl
	robot relax -i $< merge -o $@


download/pcl.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/pcl.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/pcl.owl

db/pcl.owl: download/pcl.owl
	cp $< $@


download/chemessence.owl: STAMP
	curl -L -s https://github.com/cmungall/chemessence/releases/latest/download/chemessence.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chemessence.owl

db/chemessence.owl: download/chemessence.owl
	cp $< $@


download/ogco.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/cmungall/chemessence/refs/heads/main/src/ontology/components/ogco.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ogco.owl

db/ogco.owl: download/ogco.owl
	cp $< $@


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


download/pride.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/PRIDE-Archive/pride-ontology/master/pride_cv.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/pride.owl

db/pride.owl: download/pride.owl
	robot relax -i $< merge -o $@


download/modl.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/Data-Semantics-Laboratory/modular-ontology-design-library/master/MODL.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/modl.owl

db/modl.owl: download/modl.owl
	cp $< $@


download/phenio.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/phenio/releases/latest/download/phenio.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/phenio.owl

db/phenio.owl: download/phenio.owl
	cp $< $@


download/phenio_test.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/phenio/releases/latest/download/phenio-test.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/phenio_test.owl

db/phenio_test.owl: download/phenio_test.owl
	cp $< $@


download/comploinc.owl: STAMP
	curl -L -s https://github.com/loinc/comp-loinc/releases/download/v2022-11-05/merged_reasoned_loinc.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/comploinc.owl

db/comploinc.owl: download/comploinc.owl
	robot relax -i $< merge -o $@


download/hba.owl: STAMP
	curl -L -s https://github.com/brain-bican/human_brain_atlas_ontology/raw/main/hbao-base.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/hba.owl

db/hba.owl: download/hba.owl
	cp $< $@


download/mba.owl: STAMP
	curl -L -s https://github.com/brain-bican/mouse_brain_atlas_ontology/raw/main/mbao-base.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/mba.owl

db/mba.owl: download/mba.owl
	cp $< $@


download/dmba.owl: STAMP
	curl -L -s https://github.com/brain-bican/developing_mouse_brain_atlas_ontology/raw/main/dmbao-base.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dmba.owl

db/dmba.owl: download/dmba.owl
	cp $< $@


download/dhba.owl: STAMP
	curl -L -s https://github.com/brain-bican/developing_human_brain_atlas_ontology/raw/main/dhbao-base.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dhba.owl

db/dhba.owl: download/dhba.owl
	cp $< $@


download/pba.owl: STAMP
	curl -L -s https://github.com/brain-bican/primate_brain_atlas_ontology/raw/main/pbao-base.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/pba.owl

db/pba.owl: download/pba.owl
	cp $< $@


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


download/xsmo.owl: STAMP
	curl -L -s https://download.xenbase.org/xenbase/Ontologies/XSMO/XSMO_1.1/XSMO_1.1.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/xsmo.owl

db/xsmo.owl: download/xsmo.owl
	cp $< $@


download/bcio.owl: STAMP
	curl -L -s http://humanbehaviourchange.org/ontology/bcio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bcio.owl

db/bcio.owl: download/bcio.owl
	cp $< $@


download/sio.owl: STAMP
	curl -L -s http://semanticscience.org/ontology/sio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/sio.owl

db/sio.owl: download/sio.owl
	cp $< $@


download/icd10who.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/icd10who.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/icd10who.owl

db/icd10who.owl: download/icd10who.owl
	cp $< $@


download/ordo.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/ordo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ordo.owl

db/ordo.owl: download/ordo.owl
	cp $< $@


download/gard.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/gard.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/gard.owl

db/gard.owl: download/gard.owl
	cp $< $@


download/mondo-ingest.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/mondo-ingest.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/mondo-ingest.owl

db/mondo-ingest.owl: download/mondo-ingest.owl
	cp $< $@


download/oeo.owl: STAMP
	curl -L -s https://openenergyplatform.org/ontology/oeo/releases/oeo-full.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/oeo.owl

db/oeo.owl: download/oeo.owl
	cp $< $@


download/envthes.owl: STAMP
	curl -L -s https://vocabs.lter-europe.net/rest/v1/envthes/data?format=text/turtle > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/envthes.owl

db/envthes.owl: download/envthes.owl
	robot query -i $< --update sparql/skos-to-owl.ru -o $@


download/wifire.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/WIFIRE-Lab/WIFIRE-commons-ontology/master/WIFIRE-commons-ontology-V1.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/wifire.owl

db/wifire.owl: download/wifire.owl
	cp $< $@


download/taxslim.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/ncbitaxon/subsets/taxslim.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/taxslim.owl

db/taxslim.owl: download/taxslim.owl
	robot convert -i $< -o $@


download/goldterms.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/cmungall/gold-ontology/main/gold.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/goldterms.owl

db/goldterms.owl: download/goldterms.owl
	robot relax -i $< reason -o $@


download/sdgio.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/SDG-InterfaceOntology/sdgio/master/sdgio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/sdgio.owl

db/sdgio.owl: download/sdgio.owl
	cp $< $@


download/kin.owl: STAMP
	curl -L -s http://purl.org/ga4gh/kin.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/kin.owl

db/kin.owl: download/kin.owl
	robot reason -i $< -o $@


download/biovoices.owl: STAMP
	curl -L -s https://zenodo.org/record/5589773/files/ontology.owl?download=1 > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/biovoices.owl

db/biovoices.owl: download/biovoices.owl
	robot relax -i $< merge -o $@


download/omop.owl: STAMP
	curl -L -s None > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/omop.owl

db/omop.owl: download/omop.owl
	cp $< $@


download/comet.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/linkml/linkml-common/main/project/owl/linkml_common.owl.ttl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/comet.owl

db/comet.owl: download/comet.owl
	robot relax -i $< merge -o $@


download/cco.owl: STAMP
	curl -L -s http://www.ontologyrepository.com/CommonCoreOntologies/Mid/AllCoreOntology > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/cco.owl

db/cco.owl: download/cco.owl
	robot merge -i $< relax -o $@


download/occo.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/Occupation-Ontology/OccO/main/src/ontology/occo-merged.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/occo.owl

db/occo.owl: download/occo.owl
	cp $< $@


download/iof.owl: STAMP
	curl -L -s https://spec.industrialontologies.org/ontology/AboutIOFProd/ > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/iof.owl

db/iof.owl: download/iof.owl
	robot relax -i $< merge -o $@


download/upa.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/upa.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/upa.owl

db/upa.owl: download/upa.owl
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


download/go-amigo.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/extensions/go-amigo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/go-amigo.owl

db/go-amigo.owl: download/go-amigo.owl
	cp $< $@


download/neo.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/go/noctua/neo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/neo.owl

db/neo.owl: download/neo.owl
	cp $< $@


download/bao.owl: STAMP
	curl -L -s http://www.bioassayontology.org/bao/bao_complete.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bao.owl

db/bao.owl: download/bao.owl
	robot merge -i $< -o $@


download/orcid.owl: STAMP
	curl -L -s https://w3id.org/orcidio/orcidio.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/orcid.owl

db/orcid.owl: download/orcid.owl
	cp $< $@


download/ror.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/ror/ror.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ror.owl

db/ror.owl: download/ror.owl
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
	curl -L -s https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/v2023-09-11/external/ml-ontology-202010021305.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/mlo.owl

db/mlo.owl: download/mlo.owl
	robot merge -i $< -o $@


download/ito.owl: STAMP
	curl -L -s https://github.com/OpenBioLink/ITO/raw/master/ITO.owl.zip > $@.zip.tmp && unzip -p $@.zip.tmp ITO.owl > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ito.owl

db/ito.owl: download/ito.owl
	cp $< $@


download/chemont.owl: STAMP
	curl -L -s http://classyfire.wishartlab.com/system/downloads/1_0/chemont/ChemOnt_2_1.obo.zip > $@.zip.tmp && unzip -p $@.zip.tmp ChemOnt_2_1.obo > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chemont.owl

db/chemont.owl: download/chemont.owl
	robot convert -i $< -o $@


download/molgenie.owl: STAMP
	curl -L -s https://github.com/MolGenie/ontology/blob/main/mol_classes_ext_2024-11-20.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/molgenie.owl

db/molgenie.owl: download/molgenie.owl
	robot convert -i $< -o $@


download/cso.owl: STAMP
	curl -L -s https://cso.kmi.open.ac.uk/download/version-3.3/CSO.3.3.owl.zip > $@.zip.tmp && unzip -p $@.zip.tmp CSO.3.3.owl > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/cso.owl

db/cso.owl: download/cso.owl
	cp $< $@


download/obiws.owl: STAMP
	curl -L -s https://data.bioontology.org/ontologies/OBIWS/submissions/2/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/obiws.owl

db/obiws.owl: download/obiws.owl
	cp $< $@


download/biopragmatics-reactome.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/reactome/reactome.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/biopragmatics-reactome.owl

db/biopragmatics-reactome.owl: download/biopragmatics-reactome.owl
	cp $< $@


download/reactome-hs.owl: STAMP
	curl -L -s https://reactome.org/download/current/biopax.zip > $@.zip.tmp && unzip -p $@.zip.tmp Homo_sapiens.owl > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/reactome-hs.owl

db/reactome-hs.owl: download/reactome-hs.owl
	cp $< $@


download/reactome-mm.owl: STAMP
	curl -L -s https://reactome.org/download/current/biopax.zip > $@.zip.tmp && unzip -p $@.zip.tmp Mus_musculus.owl > $@.tmp && rm $@.zip.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/reactome-mm.owl

db/reactome-mm.owl: download/reactome-mm.owl
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


download/hpinternational.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/hp/hp-international.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/hpinternational.owl

db/hpinternational.owl: download/hpinternational.owl
	cp $< $@


download/edam.owl: STAMP
	curl -L -s http://edamontology.org/EDAM.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/edam.owl

db/edam.owl: download/edam.owl
	cp $< $@


download/chr.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/monarch-initiative/monochrom/master/chr.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/chr.owl

db/chr.owl: download/chr.owl
	cp $< $@


download/sweetAll.owl: STAMP
	curl -L -s http://sweetontology.net/sweetAll > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/sweetAll.owl

db/sweetAll.owl: download/sweetAll.owl
	robot merge -i $< -o $@


download/oboe-core.owl: STAMP
	curl -L -s http://ecoinformatics.org/oboe/oboe.1.0/oboe-core.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/oboe-core.owl

db/oboe-core.owl: download/oboe-core.owl
	cp $< $@


download/oboe-standards.owl: STAMP
	curl -L -s http://ecoinformatics.org/oboe/oboe.1.0/oboe-standards.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/oboe-standards.owl

db/oboe-standards.owl: download/oboe-standards.owl
	cp $< $@


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


download/prov.owl: STAMP
	curl -L -s http://www.w3.org/ns/prov.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/prov.owl

db/prov.owl: download/prov.owl
	cp $< $@


download/dtype.owl: STAMP
	curl -L -s http://www.linkedmodel.org/schema/dtype > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dtype.owl

db/dtype.owl: download/dtype.owl
	cp $< $@


download/vaem.owl: STAMP
	curl -L -s http://www.linkedmodel.org/schema/vaem > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/vaem.owl

db/vaem.owl: download/vaem.owl
	cp $< $@


download/qudtunit.owl: STAMP
	curl -L -s http://qudt.org/vocab/unit > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/qudtunit.owl

db/qudtunit.owl: download/qudtunit.owl
	robot merge -i $<  -o $@


download/quantitykind.owl: STAMP
	curl -L -s http://qudt.org/vocab/quantitykind > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/quantitykind.owl

db/quantitykind.owl: download/quantitykind.owl
	robot merge -i $<  -o $@


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


download/fhkb.owl: STAMP
	curl -L -s None > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/fhkb.owl

db/fhkb.owl: download/fhkb.owl
	cp $< $@


download/dbpendiaont.owl: STAMP
	curl -L -s https://databus.dbpedia.org/ontologies/dbpedia.org/ontology--DEV/2023.01.03-072003/ontology--DEV_type=parsed.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/dbpendiaont.owl

db/dbpendiaont.owl: download/dbpendiaont.owl
	cp $< $@


download/uberoncm.owl: STAMP
	curl -L -s https://github.com/obophenotype/uberon/releases/latest/download/composite-metazoan.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/uberoncm.owl

db/uberoncm.owl: download/uberoncm.owl
	cp $< $@


download/icd10cm.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/icd10cm.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/icd10cm.owl

db/icd10cm.owl: download/icd10cm.owl
	cp $< $@


download/omim.owl: STAMP
	curl -L -s https://github.com/monarch-initiative/mondo-ingest/releases/latest/download/omim.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/omim.owl

db/omim.owl: download/omim.owl
	cp $< $@


download/co_324.owl: STAMP
	curl -L -s https://cropontology.org/ontology/CO_324/rdf > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/co_324.owl

db/co_324.owl: download/co_324.owl
	cp $< $@


download/ppeo.owl: STAMP
	curl -L -s http://purl.org/ppeo/PPEO.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ppeo.owl

db/ppeo.owl: download/ppeo.owl
	cp $< $@


download/interpro.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/interpro/interpro.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/interpro.owl

db/interpro.owl: download/interpro.owl
	perl -npe 's@ go:@ GO:@g;s@ ro:@ RO:@g;s@ interpro:@ InterPro:@g' $< > $@.tmp && robot convert -i $@.tmp -o $@


download/pfam.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/pfam/pfam.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/pfam.owl

db/pfam.owl: download/pfam.owl
	cp $< $@


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


download/sgd.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/sgd/sgd.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/sgd.owl

db/sgd.owl: download/sgd.owl
	robot merge -i $< -o $@


download/gtdb.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/gtdb/gtdb.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/gtdb.owl

db/gtdb.owl: download/gtdb.owl
	cp $< $@


download/eccode.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/eccode/eccode.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/eccode.owl

db/eccode.owl: download/eccode.owl
	cp $< $@


download/uniprot.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/uniprot/uniprot.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/uniprot.owl

db/uniprot.owl: download/uniprot.owl
	cp $< $@


download/uniprot.ptm.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/uniprot.ptm/uniprot.ptm.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/uniprot.ptm.owl

db/uniprot.ptm.owl: download/uniprot.ptm.owl
	cp $< $@


download/credit.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/biopragmatics/obo-db-ingest/main/export/credit/credit.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/credit.owl

db/credit.owl: download/credit.owl
	cp $< $@


download/rhea.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/rhea/rhea.owl.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/rhea.owl

db/rhea.owl: download/rhea.owl
	perl -npe 's@https://www.ebi.ac.uk/.*ec=@https://bioregistry.io/eccode:@g' $< > $@.tmp && robot convert -i $@.tmp -o $@


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


download/wikipathways.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/wikipathways/wikipathways.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/wikipathways.owl

db/wikipathways.owl: download/wikipathways.owl
	cp $< $@


download/pathbank.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/pathbank/pathbank.obo.gz | gzip -dc > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/pathbank.owl

db/pathbank.owl: download/pathbank.owl
	cp $< $@


download/kegg.genome.owl: STAMP
	curl -L -s https://w3id.org/biopragmatics/resources/kegg.genome/kegg.genome.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/kegg.genome.owl

db/kegg.genome.owl: download/kegg.genome.owl
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


download/vccf.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/obophenotype/vccf-ontology/main/vccf.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/vccf.owl

db/vccf.owl: download/vccf.owl
	cp $< $@


download/ontobiotope.owl: STAMP
	curl -L -s 'https://data.agroportal.lirmm.fr/ontologies/ONTOBIOTOPE/download?apikey=1de0a270-29c5-4dda-b043-7c3580628cd5&download_format=rdf' > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ontobiotope.owl

db/ontobiotope.owl: download/ontobiotope.owl
	cp $< $@


download/nando.owl: STAMP
	curl -L -s 'https://data.bioontology.org/ontologies/NANDO/submissions/15/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb' > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/nando.owl

db/nando.owl: download/nando.owl
	cp $< $@


download/ecso.owl: STAMP
	curl -L -s 'https://data.bioontology.org/ontologies/ECSO/submissions/64/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb' > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ecso.owl

db/ecso.owl: download/ecso.owl
	cp $< $@


download/enigma_context.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/jmchandonia/CORAL/main/example/enigma/ontologies/context_measurement_ontology.obo > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/enigma_context.owl

db/enigma_context.owl: download/enigma_context.owl
	robot merge -i $<  -o $@


download/ontie.owl: STAMP
	curl -L -s https://ontology.iedb.org/file/ontie.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ontie.owl

db/ontie.owl: download/ontie.owl
	cp $< $@


download/ecosim.owl: STAMP
	curl -L -s https://data.bioontology.org/ontologies/ECOSIM/submissions/1/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/ecosim.owl

db/ecosim.owl: download/ecosim.owl
	cp $< $@


download/nmdc_schema.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/microbiomedata/nmdc-schema/main/project/owl/nmdc.owl.ttl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/nmdc_schema.owl

db/nmdc_schema.owl: download/nmdc_schema.owl
	robot merge -i $<  -o $@


download/mixs.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/GenomicsStandardsConsortium/mixs/main/project/owl/mixs.owl.ttl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/mixs.owl

db/mixs.owl: download/mixs.owl
	robot merge -i $< reason  -o $@


download/kgcl.owl: STAMP
	curl -L -s https://w3id.org/kgcl/kgcl.owl.ttl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/kgcl.owl

db/kgcl.owl: download/kgcl.owl
	robot merge -i $< reason  -o $@


download/fibo.owl: STAMP
	curl -L -s https://spec.edmcouncil.org/fibo/ontology/AboutFIBOProd/ > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/fibo.owl

db/fibo.owl: download/fibo.owl
	robot merge -i $<  -o $@


download/bfo2020.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/bfo/2020/bfo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bfo2020.owl

db/bfo2020.owl: download/bfo2020.owl
	cp $< $@


download/bfo2020_core.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/bfo/2020/bfo-core.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bfo2020_core.owl

db/bfo2020_core.owl: download/bfo2020_core.owl
	cp $< $@


download/bfo2020_notime.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/bfo/2020/notime/bfo.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bfo2020_notime.owl

db/bfo2020_notime.owl: download/bfo2020_notime.owl
	cp $< $@


download/bfo2020_time.owl: STAMP
	curl -L -s https://raw.githubusercontent.com/BFO-ontology/BFO-2020/master/src/owl/profiles/temporal%20extensions/temporalized%20relations/owl/bfo-temporalized-relations.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/bfo2020_time.owl

db/bfo2020_time.owl: download/bfo2020_time.owl
	cp $< $@


download/%.owl: STAMP
	curl -L -s http://purl.obolibrary.org/obo/$*.owl > $@.tmp
	sha256sum -b $@.tmp > $@.sha256
	mv $@.tmp $@

.PRECIOUS: download/%.owl

db/%.owl: download/%.owl
	robot merge -i $< -o $@

EXTRA_ONTOLOGIES = swo chiro pcl chemessence ogco ncit fma maxo foodon chebiplus msio pride modl phenio phenio_test comploinc hba mba dmba dhba pba bero aio reacto xsmo bcio sio icd10who ordo gard mondo-ingest oeo envthes wifire taxslim goldterms sdgio kin biovoices omop comet cco occo iof upa go go-lego go-amigo neo bao orcid ror cpont biolink biopax enanomapper mlo ito chemont molgenie cso obiws biopragmatics-reactome reactome-hs reactome-mm efo hcao hpinternational edam chr sweetAll oboe-core oboe-standards lov schema-dot-org prov dtype vaem qudtunit quantitykind cellosaurus cosmo fhkb dbpendiaont uberoncm icd10cm omim co_324 ppeo interpro pfam hgnc.genegroup hgnc sgd gtdb eccode uniprot uniprot.ptm credit rhea swisslipid drugbank drugcentral complexportal wikipathways pathbank kegg.genome drugmechdb rxnorm vccf ontobiotope nando ecso enigma_context ontie ecosim nmdc_schema mixs kgcl fibo bfo2020 bfo2020_core bfo2020_notime bfo2020_time
