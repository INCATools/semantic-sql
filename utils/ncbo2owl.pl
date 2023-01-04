#!/usr/bin/perl -np
# See: https://github.com/INCATools/ontology-access-kit/issues/427
s@skos:prefLabel @rdfs:label @;
s@<http://purl.bioontology.org/ontology/\w+/isa> @rdfs:subClassOf @;
s@umls:cui """(\w+)"""\^\^xsd:string@skos:exactMatch umls:$1@;
s@umls:cui """(\w+)"""\^\^xsd:string@skos:exactMatch umls:$1@;
s@(<http://purl.bioontology.org/ontology/RXNORM/(has_ingredient|consists_of|has_dose_form|tradename_of)>) (<http://purl.bioontology.org/ontology/RXNORM/\d+>)@rdfs:subClassOf [a owl:Restriction; owl:onProperty $1; owl:someValuesFrom $3]@;
