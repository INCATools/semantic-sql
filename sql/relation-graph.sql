-- #include "owl.sql"

CREATE VIEW edge AS SELECT * FROM subclass_of_named UNION SELECT * FROM subclass_of_some;
CREATE VIEW edge_composition AS
  SELECT e1.subject, e1.predicate AS predicate1, e2.predicate AS predicate2, e2.object, e1.object AS intermediate
  FROM edge AS e1, edge AS e2
  WHERE
    e1.object = e2.subject;
    
CREATE VIEW edge_composition_via_transitivity AS
  SELECT
    subject,
    predicate1 AS predicate,
    object
  FROM edge_composition
  WHERE
    predicate1 = predicate2
  AND predicate1 IN (SELECT id FROM transitive);
  
CREATE VIEW edge_composition_via_subclass1 AS
  SELECT
    subject,
    predicate1 AS predicate,
    object
  FROM edge_composition
  WHERE
    predicate2 = 'rdfs:subClassOf';
    
CREATE VIEW edge_composition_via_subclass2 AS
  SELECT
    subject,
    predicate2 AS predicate,
    object
  FROM edge_composition
  WHERE
    predicate1 = 'rdfs:subClassOf';

CREATE VIEW inferred_edge_direct AS
  SELECT *  FROM edge_composition_via_transitivity UNION
  SELECT *  FROM edge_composition_via_subclass1 UNION
  SELECT *  FROM edge_composition_via_subclass2;

CREATE TABLE predicate_composition AS
 SELECT id AS predicate, id AS predicate1, id AS predicate2 FROM transitive
 UNION
 SELECT p2.id AS predicate, p1.id AS predicate1, p2.id AS predicate2 FROM predicate AS p1, predicate AS p2 WHERE p1.id = 'rdfs:subClassOf'
 UNION
 SELECT p1.id AS predicate, p1.id AS predicate1, p2.id AS predicate2 FROM predicate AS p1, predicate AS p2 WHERE p2.id = 'rdfs:subClassOf' AND p1.id != 'rdfs:subClassOf';

CREATE UNIQUE INDEX predicate_composition_u1 ON predicate_composition(predicate, predicate1, predicate2);

CREATE VIEW inferred_edge AS
        WITH RECURSIVE inferred_edge
             (
                   subject, predicate, object, depth
             )
             AS
             (SELECT subject, predicate, object, 1
                FROM edge
               UNION ALL
              SELECT
                   e.subject, pc.predicate, a.object, a.depth+1
                FROM edge AS e
                JOIN inferred_edge AS a
                  ON e.object = a.subject
                JOIN predicate_composition AS pc
                  ON pc.predicate1 = e.predicate AND pc.predicate2 = a.predicate
             )
          SELECT * FROM inferred_edge;

CREATE TABLE edge_m AS SELECT * FROM edge;

CREATE INDEX edge_spo ON edge_m(subject,predicate,object);
CREATE INDEX edge_sp ON edge_m(subject,predicate);
CREATE INDEX edge_op ON edge_m(object,predicate);

CREATE VIEW inferred_edge_m AS
        WITH RECURSIVE inferred_edge_m
             (
                   subject, predicate, object
             )
             AS
             (SELECT subject, predicate, object
                FROM edge_m
               UNION ALL
              SELECT
                   e.subject, pc.predicate, a.object
                FROM edge_m AS e
                JOIN inferred_edge_m AS a
                  ON e.object = a.subject
                JOIN predicate_composition AS pc
                  ON pc.predicate1 = e.predicate AND pc.predicate2 = a.predicate
             )
          SELECT * FROM inferred_edge_m;


