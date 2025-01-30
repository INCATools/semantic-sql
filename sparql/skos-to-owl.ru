PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX IAO: <http://purl.obolibrary.org/obo/IAO_>

# Transform broader to subClassOf
DELETE {
    ?concept skos:broader ?broaderConcept .
}
INSERT {
    ?concept rdf:type owl:Class .
    ?broaderConcept rdf:type owl:Class .
    ?concept rdfs:subClassOf ?broaderConcept .
}
WHERE {
    ?concept skos:broader ?broaderConcept .
};

# Transform prefLabel to rdfs:label
DELETE {
    ?concept skos:prefLabel ?label .
}
INSERT {
    ?concept rdfs:label ?label .
}
WHERE {
    ?concept skos:prefLabel ?label .
};

# Transform SKOS definition to IAO definition
DELETE {
    ?concept skos:definition ?definition .
}
INSERT {
    ?concept IAO:0000115 ?definition .
}
WHERE {
    ?concept skos:definition ?definition .
};


DELETE {
    ?concept rdf:type skos:Concept .
}
INSERT {
    ?concept rdf:type owl:Class .
}
WHERE {
    ?concept rdf:type skos:Concept .
};


DELETE {
    ?concept rdf:type owl:NamedIndividual .
}
WHERE {
    ?concept rdf:type owl:Class .
};


