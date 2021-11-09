

CREATE TABLE annotation_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE asymmetric_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE blank_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE class_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE deprecated_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE iri_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE irreflexive_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE named_individual_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE object_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE ontology_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE prefix (
	prefix TEXT, 
	base TEXT, 
	PRIMARY KEY (prefix, base)
);

CREATE TABLE rdf_list_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE reflexive_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE symmetric_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE transitive_property_node (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE count_of_instantiated_classes (
	element TEXT, 
	count_value INTEGER, 
	PRIMARY KEY (element, count_value), 
	FOREIGN KEY(element) REFERENCES node (id)
);

CREATE TABLE count_of_predicates (
	element TEXT, 
	count_value INTEGER, 
	PRIMARY KEY (element, count_value), 
	FOREIGN KEY(element) REFERENCES node (id)
);

CREATE TABLE count_of_subclasses (
	element TEXT, 
	count_value INTEGER, 
	PRIMARY KEY (element, count_value), 
	FOREIGN KEY(element) REFERENCES node (id)
);

CREATE TABLE edge (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	PRIMARY KEY (subject, predicate, object), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE entailed_edge (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	PRIMARY KEY (subject, predicate, object), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_all_values_from (
	on_property TEXT, 
	filler TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(on_property) REFERENCES node (id), 
	FOREIGN KEY(filler) REFERENCES class_node (id)
);

CREATE TABLE owl_axiom (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_axiom_annotation (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	axiom_predicate TEXT, 
	axiom_object TEXT, 
	axiom_value TEXT, 
	axiom_language TEXT, 
	axiom_datatype TEXT, 
	PRIMARY KEY (stanza, subject, predicate, object, value, datatype, language, axiom_predicate, axiom_object, axiom_value, axiom_language, axiom_datatype), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_complement_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_disjoint_class_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES class_node (id), 
	FOREIGN KEY(object) REFERENCES class_node (id)
);

CREATE TABLE owl_equivalent_class_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES class_node (id), 
	FOREIGN KEY(object) REFERENCES class_node (id)
);

CREATE TABLE owl_equivalent_to_intersection_member (
	subject TEXT, 
	object TEXT, 
	PRIMARY KEY (subject, object), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_has_self (
	on_property TEXT, 
	id TEXT NOT NULL, 
	filler TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(on_property) REFERENCES node (id), 
	FOREIGN KEY(filler) REFERENCES class_node (id)
);

CREATE TABLE owl_has_value (
	on_property TEXT, 
	filler TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(on_property) REFERENCES node (id), 
	FOREIGN KEY(filler) REFERENCES class_node (id)
);

CREATE TABLE owl_imports_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_inverse_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_reified_axiom (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE owl_same_as_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES named_individual_node (id), 
	FOREIGN KEY(object) REFERENCES named_individual_node (id)
);

CREATE TABLE owl_some_values_from (
	on_property TEXT, 
	filler TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(on_property) REFERENCES node (id), 
	FOREIGN KEY(filler) REFERENCES class_node (id)
);

CREATE TABLE owl_subclass_of_some_values_from (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	PRIMARY KEY (subject, predicate, object), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE rdf_first_statement (
	stanza TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	PRIMARY KEY (stanza, predicate, object, value, datatype, language, subject), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES rdf_list_node (id)
);

CREATE TABLE rdf_list_member_statement (
	stanza TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	PRIMARY KEY (stanza, predicate, object, value, datatype, language, subject), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES rdf_list_node (id)
);

CREATE TABLE rdf_rest_statement (
	stanza TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	PRIMARY KEY (stanza, predicate, object, value, datatype, language, subject), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES rdf_list_node (id)
);

CREATE TABLE rdf_rest_transitive_statement (
	stanza TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	PRIMARY KEY (stanza, predicate, object, value, datatype, language, subject), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES rdf_list_node (id)
);

CREATE TABLE rdf_type_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES class_node (id)
);

CREATE TABLE rdfs_domain_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE rdfs_label_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	datatype TEXT, 
	language TEXT, 
	value TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, object, datatype, language, value), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE rdfs_range_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, subject, predicate, value, datatype, language, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE rdfs_subclass_of_named_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES class_node (id), 
	FOREIGN KEY(object) REFERENCES class_node (id)
);

CREATE TABLE rdfs_subclass_of_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES class_node (id), 
	FOREIGN KEY(object) REFERENCES class_node (id)
);

CREATE TABLE rdfs_subproperty_of_statement (
	stanza TEXT, 
	predicate TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	subject TEXT, 
	object TEXT NOT NULL, 
	PRIMARY KEY (stanza, predicate, value, datatype, language, subject, object), 
	FOREIGN KEY(stanza) REFERENCES node (id)
);

CREATE TABLE statements (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	PRIMARY KEY (stanza, subject, predicate, object, value, datatype, language), 
	FOREIGN KEY(stanza) REFERENCES node (id), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_ancestor (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_ancestor_or_descendant (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_child (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_descendant (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_parent (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

CREATE TABLE subgraph_edge_by_self (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT, 
	PRIMARY KEY (subject, predicate, object, anchor_object, anchor_predicate), 
	FOREIGN KEY(subject) REFERENCES node (id), 
	FOREIGN KEY(object) REFERENCES node (id), 
	FOREIGN KEY(anchor_object) REFERENCES node (id)
);

-- ** REWRITE TABLES AS VIEWS **
-- SCHEMA: https://w3id.org/semsql/relation_graph

DROP TABLE edge;
CREATE VIEW edge AS SELECT subject, predicate, object FROM owl_subclass_of_some_values_from UNION
    SELECT subject, predicate, object FROM rdfs_subclass_of_named_statement;

DROP TABLE subgraph_edge_by_ancestor;
CREATE VIEW subgraph_edge_by_ancestor AS SELECT
    edge.*,
    ee.predicate AS anchor_predicate,
    ee.object AS anchor_object
  FROM edge JOIN entailed_edge AS ee ON (edge.subject = ee.subject);

DROP TABLE subgraph_edge_by_descendant;
CREATE VIEW subgraph_edge_by_descendant AS SELECT
    edge.*,
    ee.predicate AS anchor_predicate,
    ee.subject AS anchor_object
  FROM edge JOIN entailed_edge AS ee ON (edge.subject = ee.object);

DROP TABLE subgraph_edge_by_ancestor_or_descendant;
CREATE VIEW subgraph_edge_by_ancestor_or_descendant AS SELECT * FROM subgraph_edge_by_ancestor UNION SELECT * FROM subgraph_edge_by_descendant;

DROP TABLE subgraph_edge_by_parent;
CREATE VIEW subgraph_edge_by_parent AS SELECT
    edge.*,
    ee.predicate AS anchor_predicate,
    ee.object AS anchor_object
  FROM edge JOIN edge AS ee ON (edge.subject = ee.subject);

DROP TABLE subgraph_edge_by_child;
CREATE VIEW subgraph_edge_by_child AS SELECT
    edge.*,
    ee.predicate AS anchor_predicate,
    ee.subject AS anchor_object
  FROM edge JOIN edge AS ee ON (edge.subject = ee.object);

DROP TABLE subgraph_edge_by_self;
CREATE VIEW subgraph_edge_by_self AS SELECT
    edge.*,
    edge.predicate AS anchor_predicate,
    edge.subject AS anchor_object
  FROM edge;

DROP TABLE node_to_node_statement;
CREATE VIEW node_to_node_statement AS SELECT * FROM statements WHERE object IS NOT NULL;

DROP TABLE node_to_value_statement;
CREATE VIEW node_to_value_statement AS SELECT * FROM statements WHERE value IS NOT NULL;

DROP TABLE rdf_type_statement;
CREATE VIEW rdf_type_statement AS SELECT * FROM statements WHERE predicate='rdf:type';

DROP TABLE rdfs_subclass_of_statement;
CREATE VIEW rdfs_subclass_of_statement AS SELECT * FROM statements WHERE predicate='rdfs:subClassOf';

DROP TABLE rdfs_subclass_of_named_statement;
CREATE VIEW rdfs_subclass_of_named_statement AS SELECT * FROM rdfs_subclass_of_statement WHERE object NOT LIKE '_:%';

DROP TABLE rdfs_subproperty_of_statement;
CREATE VIEW rdfs_subproperty_of_statement AS SELECT * FROM statements WHERE predicate='rdfs:subPropertyOf';

DROP TABLE rdfs_label_statement;
CREATE VIEW rdfs_label_statement AS SELECT * FROM statements WHERE predicate='rdfs:label';

DROP TABLE rdfs_domain_statement;
CREATE VIEW rdfs_domain_statement AS SELECT * FROM statements WHERE predicate='rdfs:domain';

DROP TABLE rdfs_range_statement;
CREATE VIEW rdfs_range_statement AS SELECT * FROM statements WHERE predicate='rdfs:range';

DROP TABLE rdf_first_statement;
CREATE VIEW rdf_first_statement AS SELECT * FROM statements WHERE predicate='rdf:first';

DROP TABLE rdf_rest_statement;
CREATE VIEW rdf_rest_statement AS SELECT * FROM statements WHERE predicate='rdf:rest';

DROP TABLE rdf_rest_transitive_statement;
CREATE VIEW rdf_rest_transitive_statement AS WITH RECURSIVE rdf_rest_transitive_statement
             (
                   subject, object
             )
             AS
             (SELECT subject, object
                FROM rdf_rest_statement
               UNION ALL
              SELECT
                   rest.subject, rest_t.object
                FROM rdf_rest_statement AS rest
                JOIN rdf_rest_transitive_statement AS rest_t
                  ON rest.object = rest_t.subject
             )
          SELECT * FROM rdf_rest_transitive_statement;

DROP TABLE rdf_list_member_statement;
CREATE VIEW rdf_list_member_statement AS SELECT
     rest_t.subject,
     f.object
    FROM rdf_rest_transitive_statement AS rest_t JOIN rdf_first_statement AS f ON (rest_t.object = f.subject)
    UNION
    SELECT subject,object FROM rdf_first_statement;

DROP TABLE node;
CREATE VIEW node AS SELECT distinct(subject) AS id FROM statements UNION SELECT distinct(object) AS id FROM statements WHERE datatype IS NOT NULL;

DROP TABLE blank_node;
CREATE VIEW blank_node AS SELECT * FROM node WHERE id LIKE '_:%';

DROP TABLE rdf_list_node;
CREATE VIEW rdf_list_node AS SELECT distinct subject AS id from rdf_type_statement WHERE object = 'rdf:List';

DROP TABLE iri_node;
CREATE VIEW iri_node AS SELECT * FROM node WHERE id NOT LIKE '_:%';

DROP TABLE class_node;
CREATE VIEW class_node AS SELECT distinct subject AS id from rdf_type_statement WHERE object = 'owl:Class';

DROP TABLE property_node;
CREATE VIEW property_node AS SELECT distinct subject AS id from rdf_type_statement WHERE object = 'owl:Property';

DROP TABLE named_individual_node;
CREATE VIEW named_individual_node AS SELECT distinct subject AS id from rdf_type_statement WHERE object = 'owl:NamedIndividual';

DROP TABLE count_of_predicates;
CREATE VIEW count_of_predicates AS SELECT predicate AS element, count(*) AS count_value FROM statements GROUP BY predicate ORDER BY count_value DESC;

DROP TABLE count_of_instantiated_classes;
CREATE VIEW count_of_instantiated_classes AS SELECT object AS element, count(*) AS count_value FROM rdf_type_statement GROUP BY element ORDER BY count_value DESC;

DROP TABLE count_of_subclasses;
CREATE VIEW count_of_subclasses AS SELECT sc.object AS element, count(distinct sc.subject) AS count_value FROM rdfs_subclass_of_statement AS sc GROUP BY sc.object ORDER BY count_value DESC;

DROP TABLE ontology_node;
CREATE VIEW ontology_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:Ontology';

DROP TABLE object_property_node;
CREATE VIEW object_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:ObjectProperty';

DROP TABLE transitive_property_node;
CREATE VIEW transitive_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:TransitiveProperty';

DROP TABLE symmetric_property_node;
CREATE VIEW symmetric_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:SymmetricProperty';

DROP TABLE reflexive_property_node;
CREATE VIEW reflexive_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:IrreflexiveProperty';

DROP TABLE irreflexive_property_node;
CREATE VIEW irreflexive_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:ReflexiveProperty';

DROP TABLE asymmetric_property_node;
CREATE VIEW asymmetric_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:AsymmetricProperty';

DROP TABLE annotation_property_node;
CREATE VIEW annotation_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:AnnotatonProperty';

DROP TABLE deprecated_node;
CREATE VIEW deprecated_node AS SELECT DISTINCT subject AS id FROM statements WHERE predicate='owl:deprecated' AND value='true';

DROP TABLE owl_imports_statement;
CREATE VIEW owl_imports_statement AS SELECT * FROM statements WHERE predicate='owl:imports';

DROP TABLE owl_inverse_of_statement;
CREATE VIEW owl_inverse_of_statement AS SELECT * FROM statements WHERE predicate='owl:inverseOf';

DROP TABLE owl_complement_of_statement;
CREATE VIEW owl_complement_of_statement AS SELECT * FROM statements WHERE predicate='owl:complementOf';

DROP TABLE owl_equivalent_class_statement;
CREATE VIEW owl_equivalent_class_statement AS SELECT * FROM statements WHERE predicate='owl:equivalentClass';

DROP TABLE owl_same_as_statement;
CREATE VIEW owl_same_as_statement AS SELECT * FROM statements WHERE predicate='owl:sameAs';

DROP TABLE owl_disjoint_class_statement;
CREATE VIEW owl_disjoint_class_statement AS SELECT * FROM statements WHERE predicate='owl:disjointClass';

DROP TABLE owl_reified_axiom;
CREATE VIEW owl_reified_axiom AS SELECT axs.subject AS id, axs.stanza AS stanza, axs.object AS subject, axp.object AS predicate, axo.object AS object, axo.value AS value, axo.datatype AS datatype, axo.language AS language FROM statements AS axs, statements AS axp, statements AS axo WHERE axs.predicate = 'owl:annotatedSource' AND axp.predicate = 'owl:annotatedProperty' AND axo.predicate = 'owl:annotatedTarget' AND axs.subject = axp.subject AND axs.subject = axo.subject;

DROP TABLE owl_axiom;
CREATE VIEW owl_axiom AS SELECT * FROM owl_reified_axiom UNION SELECT NULL AS id, * FROM statements;

DROP TABLE owl_axiom_annotation;
CREATE VIEW owl_axiom_annotation AS SELECT axpv.stanza AS stanza, axs.object AS subject, axp.object AS predicate, axo.object AS object, axo.value AS value, axo.datatype AS datatype, axo.language AS language, axpv.subject AS id, axpv.predicate AS annotation_predicate, axpv.object AS annotation_iri, axpv.value AS annotation_value, axpv.language AS annotation_language, axpv.datatype AS annotation_datatype FROM statements AS axs, statements AS axp, statements AS axo, statements AS axpv WHERE axs.predicate = 'owl:annotatedSource' AND axp.predicate = 'owl:annotatedProperty' AND axo.predicate = 'owl:annotatedTarget' AND axs.subject = axpv.subject AND axp.subject = axpv.subject AND axo.subject = axpv.subject AND axpv.predicate NOT IN ('owl:annotatedSource', 'owl:annotatedProperty', 'owl:annotatedTarget', 'rdf:type');

DROP TABLE owl_some_values_from;
CREATE VIEW owl_some_values_from AS SELECT onProperty.subject AS id,
            onProperty.object AS on_property,
            f.object AS filler
            FROM
       statements AS onProperty,
       statements AS f
     WHERE
       onProperty.predicate = 'owl:onProperty' AND
       onProperty.subject=f.subject AND
       f.predicate='owl:someValuesFrom';

DROP TABLE owl_all_values_from;
CREATE VIEW owl_all_values_from AS SELECT onProperty.subject AS id,
            onProperty.object AS on_property,
            f.object AS filler
            FROM
       statements AS onProperty,
       statements AS f
     WHERE
       onProperty.predicate = 'owl:onProperty' AND
       onProperty.subject=f.subject AND
       f.predicate='owl:allValuesFrom';

DROP TABLE owl_has_value;
CREATE VIEW owl_has_value AS SELECT onProperty.subject AS id,
            onProperty.object AS on_property,
            f.object AS filler
            FROM
       statements AS onProperty,
       statements AS f
     WHERE
       onProperty.predicate = 'owl:onProperty' AND
       onProperty.subject=f.subject AND
       f.predicate='owl:hasValue';

DROP TABLE owl_has_self;
CREATE VIEW owl_has_self AS SELECT onProperty.subject AS id,
            onProperty.object AS on_property,
            f.object AS filler
            FROM
       statements AS onProperty,
       statements AS f
     WHERE
       onProperty.predicate = 'owl:onProperty' AND
       onProperty.subject=f.subject AND
       f.predicate='owl:hasSelf' AND
       f.value='true';

DROP TABLE owl_subclass_of_some_values_from;
CREATE VIEW owl_subclass_of_some_values_from AS SELECT subClassOf.stanza,
         subClassOf.subject,
         svf.on_property AS predicate,
         svf.filler AS object
         FROM
    statements AS subClassOf, 
    owl_some_values_from AS svf
  WHERE
    subClassOf.predicate = 'rdfs:subClassOf' AND
    svf.id=subClassOf.object;

DROP TABLE owl_equivalent_to_intersection_member;
CREATE VIEW owl_equivalent_to_intersection_member AS SELECT e.stanza,
           e.subject,
           m.object
           FROM
      owl_equivalent_class_statement AS e JOIN
      statements AS i ON (e.object=i.subject) JOIN
      rdf_list_member_statement AS m ON (i.object=m.subject)
    WHERE
      i.predicate = 'owl:intersectionOf';
