CREATE VIEW hasExactSynonym AS SELECT * FROM statements WHERE predicate='oio:hasExactSynonym';
CREATE VIEW hasBroadSynonym AS SELECT * FROM statements WHERE predicate='oio:hasBroadSynonym';
CREATE VIEW hasNarrowSynonym AS SELECT * FROM statements WHERE predicate='oio:hasNarrowSynonym';
CREATE VIEW hasRelatedSynonym AS SELECT * FROM statements WHERE predicate='oio:hasRelatedSynonym';
CREATE VIEW hasSynonym AS
  SELECT * FROM hasExactSynonym UNION
  SELECT * FROM hasBroadSynonym UNION
  SELECT * FROM hasNarrowSynonym UNION
  SELECT * FROM hasRelatedSynonym;

CREATE VIEW axiom_dbxref_annotation AS SELECT * FROM owl_axiom_annotation WHERE annotation_predicate = 'oio:hasDbXref';
CREATE VIEW axiom_source_annotation AS SELECT * FROM owl_axiom_annotation WHERE annotation_predicate = 'oio:source';


CREATE VIEW exact_synonym_axiom_dbxref_annotation AS SELECT * FROM axiom_dbxref_annotation WHERE predicate = 'oio:hasExactSynonym';
CREATE VIEW dbxref_axiom_dbxref_annotation AS SELECT * FROM axiom_dbxref_annotation WHERE predicate = 'oio:hasDbXref';
CREATE VIEW dbxref_axiom_source_annotation AS SELECT * FROM axiom_source_annotation WHERE predicate = 'oio:hasDbXref';

-- we assume domain of hasSynonymType is a synonym axiom
CREATE VIEW hasSynonymWithType AS SELECT * FROM axiom_annotation WHERE annotation_predicate = 'oio:hasSynonymType';

CREATE VIEW hasSynonymWithTypeXrefs AS
  SELECT s.*, GROUP_CONCAT(a.value) AS xref FROM hasSynonymWithType AS s LEFT JOIN dbxref_axiom AS a ON(a.subject=s.subject AND a.predicate=s.predicate AND a.value=s.value) GROUP BY s.subject,s.predicate,s.object;


CREATE VIEW hasSynonymWithXrefs AS
  SELECT s.*, GROUP_CONCAT(a.axiom_object_value) AS xref FROM hasSynonym AS s LEFT JOIN dbxref_axiom AS a ON(a.subject=s.subject AND a.predicate=s.predicate AND a.value=s.value) GROUP BY s.subject,s.predicate,s.object;

CREATE VIEW has_dbxref AS SELECT * FROM statements WHERE predicate = 'oio:hasDbXref';
CREATE VIEW skos_exact_match AS SELECT * FROM statements WHERE predicate = 'skos:exactMatch';
CREATE VIEW skos_narrow_match AS SELECT * FROM statements WHERE predicate = 'skos:narrowMatch';
CREATE VIEW skos_broad_match AS SELECT * FROM statements WHERE predicate = 'skos:broadMatch';
CREATE VIEW skos_close_match AS SELECT * FROM statements WHERE predicate = 'skos:closeMatch';

CREATE VIEW mapping AS
  SELECT * FROM has_dbxref UNION
  SELECT * FROM skos_exact_match UNION
  SELECT * FROM skos_broad_match UNION
  SELECT * FROM skos_narrow_match UNION
  SELECT * FROM skos_related_match;

-- TODO: autogenerate these for all prefixes
CREATE VIEW rhea_xref AS SELECT * FROM has_dbxref WHERE VALUE LIKE 'RHEA:%';

CREATE VIEW axiom_dbxref_annotation_inconsistency
  AS SELECT a.*, x.subject AS subject2 FROM axiom_dbxref_annotation AS a JOIN has_dbxref AS x ON (a.annotation_value = x.value)
     WHERE a.subject != x.subject AND x.subject NOT LIKE '_:%';
