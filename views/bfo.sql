CREATE VIEW formal_class AS
 SELECT
  'BFO' AS ont, id
 FROM
  node
 WHERE
  id LIKE 'BFO:%'
UNION
 SELECT
  'OGMS' AS ont, id
 FROM
  node
 WHERE
  id LIKE 'OGMS:%';
 
CREATE VIEW subclass_of_formal_class AS
 SELECT
  f.ont, s.*
 FROM
  rdfs_subclass_of_statement s,
  formal_class f
 WHERE
  s.object=f.id AND s.subject NOT IN (select id FROM formal_class);

CREATE VIEW formal_class_subclass_count_by_prefix AS
 SELECT
  s.object AS formal_class_id, ni.prefix, count(distinct s.subject) AS subclass_count
 FROM
  subclass_of_formal_class AS s,
  node_identifier AS ni
 WHERE
  s.subject=ni.id
 GROUP BY formal_class_id, ni.prefix;


CREATE VIEW formal_class_subclass_count AS
 SELECT
  object AS formal_class_id, count(distinct subject) AS subclass_count
 FROM
  subclass_of_formal_class
 GROUP BY formal_class_id;

CREATE VIEW formal_ontology_usage_count AS
 SELECT
  ont, count(distinct subject) AS subclass_count
 FROM
  subclass_of_formal_class
 GROUP BY ont;

CREATE VIEW inter_sofc_edge AS
 SELECT
  e.*,
  s.object AS subject_fc,
  o.object AS object_fc
 FROM
  edge AS e,
  subclass_of_formal_class AS s,
  subclass_of_formal_class AS o
 WHERE
  e.subject=s.subject AND
  e.object=o.subject;
  
CREATE VIEW intra_inter_sofc_edge AS
 SELECT
  e.*,
  nis.prefix as subject_prefix,
  ois.prefix as object_prefix
 FROM
  inter_sofc_edge AS e,
  node_identifier AS nis,
  node_identifier AS nio
 WHERE
  e.subject=nis.id AND
  e.object=nio.id;
  
 
