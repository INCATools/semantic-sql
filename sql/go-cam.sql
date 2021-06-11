CREATE VIEW inst_term AS SELECT * FROM rdf_type WHERE object != 'owl:NamedIndividual';

CREATE VIEW modelstate AS SELECT subject AS id, value AS state FROM statements WHERE predicate='<http://geneontology.org/lego/modelstate>';
CREATE VIEW modeltitle AS SELECT subject AS id, value AS state FROM statements WHERE predicate='dce:title';
CREATE VIEW templatestate AS SELECT subject AS id, value AS state FROM statements WHERE predicate='<http://geneontology.org/lego/templatestate>';
CREATE VIEW is_template AS SELECT id FROM templatestate WHERE state = 'true';

CREATE VIEW stats_modelstate SELECT state, count(distinct id) AS num_models FROM modelstate GROUP BY state;

CREATE VIEW has_evidence AS SELECT * FROM statements WHERE predicate = '<http://geneontology.org/lego/evidence>';

CREATE VIEW inferred_type AS SELECT t.subject AS id, t.object AS asserted_type, s.object AS inferred_type FROM rdf_type AS t JOIN entailed_subclass_of AS s ON (t.object=s.subject);

CREATE VIEW molecular_activity_node AS SELECT * FROM inferred_type WHERE inferred_type = 'GO:0003674';
CREATE VIEW biological_process_node AS SELECT * FROM inferred_type WHERE inferred_type = 'GO:0008150';
CREATE VIEW location_node AS SELECT * FROM inferred_type WHERE inferred_type = 'GO:0110165';

CREATE VIEW stats_molecular_activity_by_term AS select asserted_type, count(*) AS num_nodes FROM molecular_activity_node GROUP BY asserted_type ORDER BY num_nodes desc;

CREATE VIEW edge_with_terms AS SELECT edge.*,st.object AS subject_term,ot.object AS object_term from inst_term AS st JOIN statements AS edge ON (st.subject=edge.subject) INNER JOIN inst_term AS ot ON (edge.object=ot.subject);

CREATE VIEW enabled_by AS SELECT * from statements WHERE predicate='RO:0002333';
CREATE VIEW enabled_by_ann AS SELECT * from axiom_annotation WHERE predicate='RO:0002333';
--CREATE VIEW enabled_by_flat AS SELECT * from rdfslabel AS sl JOIN enabled_by AS edge ON (sl.subject=edge.subject) INNER JOIN rdfslabel AS ol ON (edge.object=ol.subject);
CREATE VIEW enabled_by_with_terms AS SELECT * from edge_with_terms WHERE predicate='RO:0002333';


CREATE VIEW occurs_in AS SELECT * from statements WHERE predicate='BFO:0000066';
CREATE VIEW regulates AS SELECT * from statements WHERE predicate='RO:0002211';
CREATE VIEW part_of AS SELECT * from statements WHERE predicate='BFO:0000050';

-- QC

CREATE VIEW problem_rdf_type_to_deprecated AS SELECT * FROM rdf_type WHERE object IN (SELECT id FROM deprecated);

-- suggest a repair for use of an obsolete term
-- sqlite does not support stored procedures but it would be easy to do an UPDATE for this
CREATE VIEW repair_rdf_type_to_deprecated AS SELECT t.*, r.object AS replaced_by FROM rdf_type AS t JOIN term_replaced_by AS r ON (t.object=r.subject);

