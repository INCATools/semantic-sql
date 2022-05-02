CREATE TABLE IF NOT EXISTS prefix (
  prefix TEXT PRIMARY KEY,
  base TEXT NOT NULL
);

INSERT OR IGNORE INTO prefix VALUES
("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#"),
("rdfs", "http://www.w3.org/2000/01/rdf-schema#"),
("xsd", "http://www.w3.org/2001/XMLSchema#"),
("owl", "http://www.w3.org/2002/07/owl#"),
("oio", "http://www.geneontology.org/formats/oboInOwl#"),
("dce", "http://purl.org/dc/elements/1.1/"),
("dct", "http://purl.org/dc/terms/"),
("foaf", "http://xmlns.com/foaf/0.1/"),
("protege", "http://protege.stanford.edu/plugins/owl/protege#"),
("ex", "http://example.com/"),

("BFO",       "http://purl.obolibrary.org/obo/BFO_"),
("CHEBI",     "http://purl.obolibrary.org/obo/CHEBI_"),
("CL",        "http://purl.obolibrary.org/obo/CL_"),
("RO",        "http://purl.obolibrary.org/obo/RO_"),
("GO",        "http://purl.obolibrary.org/obo/GO_"),
("ENVO",        "http://purl.obolibrary.org/obo/ENVO_"),
("UBERON",        "http://purl.obolibrary.org/obo/UBERON_"),
("PATO",        "http://purl.obolibrary.org/obo/PATO_"),
("IAO",       "http://purl.obolibrary.org/obo/IAO_"),
("NCBITaxon", "http://purl.obolibrary.org/obo/NCBITaxon_"),
("OBI",       "http://purl.obolibrary.org/obo/OBI_"),
("PR",        "http://purl.obolibrary.org/obo/PR_"),

("obo",       "http://purl.obolibrary.org/obo/"),

("gocam", "http://model.geneontology.org/"),
("UP", "http://purl.uniprot.org/uniprot/"),
("UC", "http://purl.uniprot.org/core/"),
("PRO", "http://www.uniprot.org/annotation/PRO_"),
("faldo", "http://biohackathon.org/resource/faldo#"),

("ONTIE", "https://ontology.iedb.org/ontology/ONTIE_"),
("IEDB", "http://iedb.org/"),
("iedb-protein", "http://iedb.org/taxon-protein/"),
("CoVIC", "https://cvdb.ontodev.com/antibody/"),
("ds", "https://cvdb.ontodev.com/dataset/"),
("org", "https://cvdb.ontodev.com/organization/"),
("user", "https://cvdb.ontodev.com/user/");
