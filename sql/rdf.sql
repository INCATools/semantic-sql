CREATE VIEW node AS SELECT distinct(subject) AS id FROM statements UNION SELECT distinct(object) AS id FROM statements WHERE datatype IS NOT NULL;
CREATE VIEW bnode AS SELECT * FROM node WHERE id LIKE '_:%';
CREATE VIEW iri AS SELECT * FROM node WHERE id NOT LIKE '_:%';

CREATE VIEW deprecated AS SELECT distinct(subject) AS id FROM statements WHERE predicate='owl:deprecated' AND value='true';

CREATE VIEW rdfslabel AS SELECT * FROM statements WHERE predicate = 'rdfs:label';
