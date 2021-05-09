CREATE VIEW node AS SELECT distinct(subject) AS id FROM statements UNION SELECT distinct(object) AS id FROM statements WHERE datatype IS NOT NULL;
CREATE VIEW bnode AS SELECT * FROM node WHERE id LIKE '_:%';
CREATE VIEW iri AS SELECT * FROM node WHERE id NOT LIKE '_:%';


CREATE VIEW rdftype AS SELECT * FROM statements WHERE predicate = 'rdf:type';
CREATE VIEW rdfslabel AS SELECT * FROM statements WHERE predicate = 'rdfs:label';

-- move to owl?
CREATE VIEW deprecated AS SELECT distinct(subject) AS id FROM statements WHERE predicate='owl:deprecated' AND value='true';

-- move to OBO/IAO/OMO?
-- NOTE: most ontologies use OBJECT for replaced_by, and VALUE for consider??
CREATE VIEW term_replaced_by AS SELECT * FROM statements WHERE predicate='IAO:0100001';
CREATE VIEW term_consider_replacement AS SELECT * FROM statements WHERE predicate='oio:consider';
