-- # Class: "ontology_node" Description: "A node representing an ontology"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "object_property_node" Description: "A node representing an OWL object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "transitive_property_node" Description: "A node representing an OWL transitive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "symmetric_property_node" Description: "A node representing an OWL symmetric object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "reflexive_property_node" Description: "A node representing an OWL reflexive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "irreflexive_property_node" Description: "A node representing an OWL irreflexive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "asymmetric_property_node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "annotation_property_node" Description: "A node representing an OWL annotation property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "deprecated_node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_imports_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_inverse_of_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_complement_of_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_equivalent_class_statement" Description: "A statement that connects two class_nodes where both classes are equivalent"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_same_as_statement" Description: "A statement that connects two individual nodes where both individual are equivalent"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_disjoint_class_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_reified_axiom" Description: "An OWL axiom that has been reified - i.e. it includes an [id](id) field that uniquely identifies that axiom and which can be the subject of additional statements"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_axiom" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "owl_axiom_annotation" Description: ""
--     * Slot: annotation_subject Description: 
--     * Slot: annotation_predicate Description: 
--     * Slot: annotation_object Description: 
--     * Slot: annotation_value Description: 
--     * Slot: annotation_language Description: 
--     * Slot: annotation_datatype Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "anonymous_expression" Description: "An OWL expression, such as a class expression. Expressions are "anonymous" as they are a composition of named elements rather than a named element themselves"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous_class_expression" Description: "An OWL anonymous class expression, such as for example `SomeValuesFrom(partOf Hand)`"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous_property_expression" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous_individual_expression" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_restriction" Description: "An OWL restriction, such as `SomeValuesFrom(partOf Hand)`"
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: the id of the restriction
-- # Class: "owl_some_values_from" Description: "An OWL SomeValuesFrom restriction"
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_all_values_from" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_has_value" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_has_self" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: This is Null for a self-restriction
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl_complex_axiom" Description: "An axiom that is composed of two or more statements"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "owl_subclass_of_some_values_from" Description: "Composition of subClassOf and SomeValuesFrom"
--     * Slot: subject Description: the class C in the axiom C subClassOf P some D
--     * Slot: predicate Description: the predicate P in the axiom C subClassOf P some D
--     * Slot: object Description: the class D in the axiom C subClassOf P some D
-- # Class: "owl_equivalent_to_intersection_member" Description: "Composition of `OwlEquivalentClass`, `OwlIntersectionOf`, and `RdfListMember`; `C = X1 and ... and Xn`"
--     * Slot: subject Description: the defined class
--     * Slot: object Description: a class expression that forms the defining expression
--     * Slot: predicate Description: The predicate of the statement
-- # Class: "prefix" Description: "Maps CURIEs to URIs"
--     * Slot: prefix Description: A standardized prefix such as 'GO' or 'rdf' or 'FlyBase'
--     * Slot: base Description: The base URI a prefix will expand to
-- # Class: "statements" Description: "Represents an RDF triple"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "node_to_node_statement" Description: "A statement where object is non-null and value is not populated"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "node_to_value_statement" Description: "A statement where value is non-null and object is not populated"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_type_statement" Description: "A statement that indicates the asserted type of the subject entity"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The entity type
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subclass_of_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subclass_of_named_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subproperty_of_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subproperty element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superproperty element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_label_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: The label value
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_domain_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_range_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_list_statement" Description: "A statement that is used to represent aspects of RDF lists"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_first_statement" Description: "A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_rest_statement" Description: "A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_rest_transitive_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_list_member_statement" Description: ""
--     * Slot: stanza Description: the term which this statement is about
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "node" Description: "The basic unit of representation in an RDF or OWL graph"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "blank_node" Description: "A node with an ID that is not preserved between databases"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "rdf_list_node" Description: "A node representing an RDF list. Note that you will not likely need to use this directly."
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "iri_node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "class_node" Description: "A node that represents an RDFS/OWL class"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "property_node" Description: "Note this only directly classifies nodes asserted to be rdf:Properties"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "named_individual_node" Description: "A node that represents an OWL Named Individual"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "rdf_level_summary_statistic" Description: "Abstract grouping for views/classes that provide some kind of count summary about an individual element"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count_of_predicates" Description: "Number of distinct usages of a predicate. NOTE MAY CHANGE: does not currently count existential usage in OWL"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count_of_instantiated_classes" Description: "Number of distinct instantiations of a class. Note in many OBOs, classes are not directly instantiated"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count_of_subclasses" Description: "Number of subclasses for a given class"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "node_trait" Description: "abstract groupings/properties for different aspects of the model"
-- # Class: "class_trait" Description: ""
-- # Class: "property_trait" Description: ""
-- # Class: "individual_trait" Description: ""
-- # Class: "is_report" Description: "Used to describe classes/views that have a reporting function"

CREATE TABLE ontology_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE object_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE transitive_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE symmetric_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE reflexive_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE irreflexive_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE asymmetric_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE annotation_property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE deprecated_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_imports_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_inverse_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_complement_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_equivalent_class_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_same_as_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_disjoint_class_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE owl_reified_axiom (
	id TEXT, 
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_axiom (
	id TEXT, 
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_axiom_annotation (
	annotation_subject TEXT, 
	annotation_predicate TEXT, 
	annotation_object TEXT, 
	annotation_value TEXT, 
	annotation_language TEXT, 
	annotation_datatype TEXT, 
	id TEXT, 
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_expression (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_class_expression (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_property_expression (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_individual_expression (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_restriction (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_some_values_from (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_all_values_from (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_has_value (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_has_self (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE owl_complex_axiom (
	subject TEXT, 
	predicate TEXT, 
	object TEXT
);
CREATE TABLE owl_subclass_of_some_values_from (
	subject TEXT, 
	predicate TEXT, 
	object TEXT
);
CREATE TABLE owl_equivalent_to_intersection_member (
	subject TEXT, 
	object TEXT, 
	predicate TEXT
);
CREATE TABLE prefix (
	prefix TEXT, 
	base TEXT
);
CREATE TABLE statements (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE node_to_node_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE node_to_value_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_type_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_subclass_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_subclass_of_named_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_subproperty_of_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_label_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_domain_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdfs_range_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_list_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_first_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_rest_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_rest_transitive_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE rdf_list_member_statement (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE blank_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE rdf_list_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE iri_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE class_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE property_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE named_individual_node (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE rdf_level_summary_statistic (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE count_of_predicates (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE count_of_instantiated_classes (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE count_of_subclasses (
	element TEXT, 
	count_value INTEGER
);

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
CREATE VIEW annotation_property_node AS SELECT DISTINCT subject AS id FROM rdf_type_statement WHERE object='owl:AnnotationProperty';

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
CREATE VIEW owl_disjoint_class_statement AS SELECT * FROM statements WHERE predicate='owl:disjointWith';

DROP TABLE owl_reified_axiom;
CREATE VIEW owl_reified_axiom AS SELECT axs.subject AS id, axs.stanza AS stanza, axs.object AS subject, axp.object AS predicate, axo.object AS object, axo.value AS value, axo.datatype AS datatype, axo.language AS language FROM statements AS axs, statements AS axp, statements AS axo WHERE axs.predicate = 'owl:annotatedSource' AND axp.predicate = 'owl:annotatedProperty' AND axo.predicate = 'owl:annotatedTarget' AND axs.subject = axp.subject AND axs.subject = axo.subject;

DROP TABLE owl_axiom;
CREATE VIEW owl_axiom AS SELECT * FROM owl_reified_axiom UNION SELECT NULL AS id, * FROM statements;

DROP TABLE owl_axiom_annotation;
CREATE VIEW owl_axiom_annotation AS SELECT
   axpv.stanza AS stanza,
   axs.object AS subject,
   axp.object AS predicate,
   axo.object AS object,
   axo.value AS value,
   axo.datatype AS datatype,
   axo.language AS language,
   axpv.subject AS id,
   axpv.subject AS annotation_subject,
   axpv.predicate AS annotation_predicate,
   axpv.object AS annotation_object,
   axpv.value AS annotation_value,
   axpv.language AS annotation_language,
   axpv.datatype AS annotation_datatype
  FROM
   statements AS axs,
   statements AS axp,
   statements AS axo,
   statements AS axpv
  WHERE
   axs.predicate = 'owl:annotatedSource' AND
   axp.predicate = 'owl:annotatedProperty' AND
   axo.predicate = 'owl:annotatedTarget' AND
   axs.subject = axpv.subject AND
   axp.subject = axpv.subject AND axo.subject = axpv.subject AND
   axpv.predicate NOT IN ('owl:annotatedSource', 'owl:annotatedProperty', 'owl:annotatedTarget', 'rdf:type');

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
