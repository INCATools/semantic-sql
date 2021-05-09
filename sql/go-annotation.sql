/**

These operate over NON-NORMALIZED gaf tables, for demo purposes

No attempt is yet made to parse pipe-separated fields like taxon, qualifier

*/


CREATE VIEW annotation_to_deprecated AS SELECT * FROM gaf WHERE ontology_class_ref IN (SELECT id FROM deprecated );

-- todo: include redundant
CREATE VIEW entailed_gaf AS SELECT gaf.*, e.predicate AS inferred_predicate, e.object AS ancestor_term FROM gaf JOIN entailed_edge AS e ON (gaf.ontology_class_ref = e.subject);

-- stats
CREATE VIEW num_annotation_by_taxon AS SELECT db_object_taxon, count(*) AS num_annotations FROM gaf GROUP BY db_object_taxon;
CREATE VIEW num_term_by_taxon AS SELECT db_object_taxon, count(DISTINCT ontology_class_ref) AS num_terms_annotated FROM gaf GROUP BY db_object_taxon;
