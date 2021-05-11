CREATE VIEW node AS SELECT distinct(subject) AS id FROM statements UNION SELECT distinct(object) AS id FROM statements WHERE datatype IS NOT NULL;
CREATE VIEW blank_node AS SELECT * FROM node WHERE id LIKE '_:%';
CREATE VIEW iri AS SELECT * FROM node WHERE id NOT LIKE '_:%';


CREATE VIEW rdf_type AS SELECT * FROM statements WHERE predicate = 'rdf:type';
CREATE VIEW rdfslabel AS SELECT * FROM statements WHERE predicate = 'rdfs:label';

-- move to owl?
CREATE VIEW deprecated AS SELECT distinct(subject) AS id FROM statements WHERE predicate='owl:deprecated' AND value='true';

-- move to OBO/IAO/OMO?
-- NOTE: most ontologies use OBJECT for replaced_by, and VALUE for consider??
CREATE VIEW term_replaced_by AS SELECT * FROM statements WHERE predicate='IAO:0100001';
CREATE VIEW term_consider_replacement AS SELECT * FROM statements WHERE predicate='oio:consider';

CREATE VIEW rdfs_subclass_of AS
   SELECT stanza, subject, predicate, object FROM
     statements
   WHERE
     predicate = 'rdfs:subClassOf';

CREATE VIEW inferred_subclass_of AS
        WITH RECURSIVE inferred_subclass_of
             (
                   subject, object
             )
             AS
             (SELECT subject, object
                FROM rdfs_subclass_of
               UNION ALL
              SELECT
                   e.subject, a.object
                FROM rdfs_subclass_of AS e
                JOIN inferred_subclass_of AS a
                  ON e.object = a.subject
             )
          SELECT * FROM inferred_subclass_of;

CREATE VIEW statement_chain AS
  SELECT
    s1.stanza,
    s1.subject,
    s1.predicate AS predicate1,
    s2.predicate AS predicate2,
    s2.object AS intermediate_object,
    s2.object,
    s2.value,
    s2.language
  FROM statements AS s1 JOIN statements AS s2 ON (s1.object=s2.subject);

CREATE VIEW rdf_first AS SELECT * FROM statements WHERE predicate = 'rdf:first';
CREATE VIEW rdf_rest AS SELECT * FROM statements WHERE predicate = 'rdf:rest';
DROP VIEW rdf_rest_transitive;
CREATE VIEW rdf_rest_transitive AS
        WITH RECURSIVE rdf_rest_transitive
             (
                   subject, object
             )
             AS
             (SELECT subject, object
                FROM rdf_rest
               UNION ALL
              SELECT
                   rest.subject, rest_t.object
                FROM rdf_rest AS rest
                JOIN rdf_rest_transitive AS rest_t
                  ON rest.object = rest_t.subject
             )
          SELECT * FROM rdf_rest_transitive;
DROP VIEW rdf_list_member ;
CREATE VIEW rdf_list_member AS
  SELECT
   rest_t.subject,
   f.object
  FROM rdf_rest_transitive AS rest_t JOIN rdf_first AS f ON (rest_t.object = f.subject)
  UNION
  SELECT subject,object FROM rdf_first;
