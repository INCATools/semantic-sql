-- # Class: "prefix" Description: "Maps CURIEs to URIs"
--     * Slot: prefix Description: A standardized prefix such as 'GO' or 'rdf' or 'FlyBase'
--     * Slot: base Description: The base URI a prefix will expand to
-- # Class: "statements" Description: "Represents an RDF triple"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "node_to_node_statement" Description: "A statement where object is non-null and value is not populated"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "node_to_value_statement" Description: "A statement where value is non-null and object is not populated"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_type_statement" Description: "A statement that indicates the asserted type of the subject entity"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The entity type
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_subclass_of_statement" Description: ""
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_subclass_of_named_statement" Description: ""
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_subproperty_of_statement" Description: ""
--     * Slot: subject Description: The subproperty element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superproperty element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_label_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: The label value
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_domain_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdfs_range_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_list_statement" Description: "A statement that is used to represent aspects of RDF lists"
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_first_statement" Description: "A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_rest_statement" Description: "A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_rest_transitive_statement" Description: ""
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "rdf_list_member_statement" Description: ""
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "node" Description: "The basic unit of representation in an RDF or OWL graph"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "node_identifier" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: prefix Description: A standardized prefix such as 'GO' or 'rdf' or 'FlyBase'
--     * Slot: local_identifier Description: The part of a CURIE after the colon
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
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_inverse_of_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_complement_of_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_equivalent_class_statement" Description: "A statement that connects two class_nodes where both classes are equivalent"
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_same_as_statement" Description: "A statement that connects two individual nodes where both individual are equivalent"
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_disjoint_class_statement" Description: ""
--     * Slot: subject Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_reified_axiom" Description: "An OWL axiom that has been reified - i.e. it includes an [id](id) field that uniquely identifies that axiom and which can be the subject of additional statements"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_axiom" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "owl_axiom_annotation" Description: ""
--     * Slot: annotation_subject Description:
--     * Slot: annotation_predicate Description:
--     * Slot: annotation_object Description:
--     * Slot: annotation_value Description:
--     * Slot: annotation_language Description:
--     * Slot: annotation_datatype Description:
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
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
--     * Slot: id Description: the id of the restriction
-- # Class: "owl_all_values_from" Description: ""
--     * Slot: on_property Description:
--     * Slot: filler Description:
--     * Slot: id Description: the id of the restriction
-- # Class: "owl_has_value" Description: ""
--     * Slot: on_property Description:
--     * Slot: filler Description:
--     * Slot: id Description: the id of the restriction
-- # Class: "owl_has_self" Description: ""
--     * Slot: on_property Description:
--     * Slot: filler Description: This is Null for a self-restriction
--     * Slot: id Description: the id of the restriction
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
-- # Class: "has_text_definition_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_oio_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_exact_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_broad_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_narrow_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_related_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_synonym_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_exact_match_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_broad_match_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_narrow_match_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_related_match_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_match_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_dbxref_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "has_mapping_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "contributor" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "creator" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "orcid" Description: ""
--     * Slot: label Description: A label for an element
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "axiom_dbxref_annotation" Description: ""
--     * Slot: annotation_subject Description:
--     * Slot: annotation_predicate Description:
--     * Slot: annotation_object Description:
--     * Slot: annotation_value Description:
--     * Slot: annotation_language Description:
--     * Slot: annotation_datatype Description:
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "ontology_status_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. 'en'
-- # Class: "repair_action" Description: "Represents an action that needs to be taken to repair a problem"
--     * Slot: subject Description: The thing that is problematic
--     * Slot: description Description:
-- # Class: "problem" Description: "Represents an instance of a problem pertaining to conformance to OBO guidelines"
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "lexical_problem" Description: "a problem with the textual value of an annotation property"
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "trailing_whitespace_problem" Description: ""
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "property_used_with_datatype_values_and_objects" Description: "A problem in which the same property is used two two different ways, one in which the range is a literal value, the other where it is an object."
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "node_with_two_labels_problem" Description: ""
--     * Slot: label1 Description:
--     * Slot: label2 Description:
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "all_problems" Description: ""
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "relation_graph_construct" Description: "A construct used as part of a Relation Graph"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "edge" Description: "A relation graph edge that connects two entities by a predicate. Note an edge is distinct from a statement, in that an axiom such as A SubClassOf R some B is represented as multiple statements, but is a single relation graph edge"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "subgraph_query" Description: "A subgraph query encompasses as subgraph edge and a seed/anchor object and seed/anchor predicate"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The entity that is used to seed the graph. The seed entity will bear some relationship to each subgraph edge; E.g. with an ancestor subgraph query, all edges will have a subject that descends from the ancestor
--     * Slot: anchor_predicate Description: The predicate that is used to determine if an edge should be included based on relationship to the anchor_object.
-- # Class: "subgraph_edge_by_ancestor" Description: "An edge within a subgraph anchored around a set of ancestor terms"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The ancestor term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between each edge subject and the ancestor
-- # Class: "subgraph_edge_by_descendant" Description: "An edge within a subgraph anchored around a set of descendant terms"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The descendant term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between the descendant and each edge subject
-- # Class: "subgraph_edge_by_ancestor_or_descendant" Description: ""
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The entity that is used to seed the graph. The seed entity will bear some relationship to each subgraph edge; E.g. with an ancestor subgraph query, all edges will have a subject that descends from the ancestor
--     * Slot: anchor_predicate Description: The predicate that is used to determine if an edge should be included based on relationship to the anchor_object.
-- # Class: "subgraph_edge_by_parent" Description: "An edge within a subgraph anchored around a set of parent terms"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The parent term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between each edge subject and the parent
-- # Class: "subgraph_edge_by_child" Description: "An edge within a subgraph anchored around a set of child terms"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The child term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between the child and each edge subject
-- # Class: "subgraph_edge_by_self" Description: "A special null form of a subgraph query where there is no expansion"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The entity that is used to seed the graph. The seed entity will bear some relationship to each subgraph edge; E.g. with an ancestor subgraph query, all edges will have a subject that descends from the ancestor
--     * Slot: anchor_predicate Description: The predicate that is used to determine if an edge should be included based on relationship to the anchor_object.
-- # Class: "entailed_edge" Description: "A relation graph edge that is inferred"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "entailed_subclass_of_edge" Description: ""
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
-- # Class: "entailed_type_edge" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
-- # Class: "entailed_edge_cycle" Description: "An edge that composes with another edge to make a cycle"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: secondary_predicate Description:
-- # Class: "entailed_edge_same_predicate_cycle" Description: "An entailed_edge_cycle over a single predicate"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: secondary_predicate Description:
-- # Class: "transitive_edge" Description: "A relation graph edge that is formed from a chain of one or more edges"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "term_association" Description: "A minimal datamodel for relating a subject entity to an object term"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: evidence_type Description:
--     * Slot: publication Description:
--     * Slot: source Description:

CREATE TABLE prefix (
	prefix TEXT,
	base TEXT
);
CREATE TABLE statements (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE node_to_node_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE node_to_value_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_type_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_subclass_of_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_subclass_of_named_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_subproperty_of_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_label_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_domain_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdfs_range_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_list_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_first_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_rest_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_rest_transitive_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE rdf_list_member_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE node_identifier (
	id TEXT NOT NULL,
	prefix TEXT,
	local_identifier TEXT,
	PRIMARY KEY (id)
);
CREATE TABLE blank_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE rdf_list_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE iri_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE class_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE named_individual_node (
	id TEXT NOT NULL,
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
CREATE TABLE ontology_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE object_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE transitive_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE symmetric_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE reflexive_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE irreflexive_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE asymmetric_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE annotation_property_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE deprecated_node (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_imports_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_inverse_of_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_complement_of_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_equivalent_class_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_same_as_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_disjoint_class_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE owl_reified_axiom (
	id TEXT NOT NULL,
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT,
	PRIMARY KEY (id)
);
CREATE TABLE owl_axiom (
	id TEXT NOT NULL,
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
	id TEXT NOT NULL,
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT,
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_expression (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_class_expression (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_property_expression (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE anonymous_individual_expression (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_restriction (
	on_property TEXT,
	filler TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_some_values_from (
	on_property TEXT,
	filler TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_all_values_from (
	on_property TEXT,
	filler TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_has_value (
	on_property TEXT,
	filler TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE owl_has_self (
	on_property TEXT,
	filler TEXT,
	id TEXT NOT NULL,
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
CREATE TABLE has_text_definition_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_oio_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_exact_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_broad_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_narrow_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_related_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_synonym_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_exact_match_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_broad_match_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_narrow_match_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_related_match_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_match_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_dbxref_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE has_mapping_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE contributor (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE creator (
	subject TEXT,
	predicate TEXT,
	object TEXT NOT NULL,
	value TEXT,
	datatype TEXT,
	language TEXT
);
CREATE TABLE orcid (
	label TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE axiom_dbxref_annotation (
	annotation_subject TEXT,
	annotation_predicate TEXT,
	annotation_object TEXT,
	annotation_value TEXT,
	annotation_language TEXT,
	annotation_datatype TEXT,
	id TEXT NOT NULL,
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT,
	PRIMARY KEY (id)
);
CREATE TABLE ontology_status_statement (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT NOT NULL,
	datatype TEXT,
	language TEXT
);
CREATE TABLE repair_action (
	subject TEXT,
	description TEXT
);
CREATE TABLE problem (
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE lexical_problem (
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE trailing_whitespace_problem (
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE property_used_with_datatype_values_and_objects (
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE node_with_two_labels_problem (
	label1 TEXT,
	label2 TEXT,
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE all_problems (
	subject TEXT,
	predicate TEXT,
	value TEXT
);
CREATE TABLE relation_graph_construct (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE edge (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE subgraph_query (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_ancestor (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_descendant (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_ancestor_or_descendant (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_parent (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_child (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE subgraph_edge_by_self (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	anchor_object TEXT,
	anchor_predicate TEXT
);
CREATE TABLE entailed_edge (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE entailed_subclass_of_edge (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE entailed_type_edge (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE entailed_edge_cycle (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	secondary_predicate TEXT
);
CREATE TABLE entailed_edge_same_predicate_cycle (
	subject TEXT,
	predicate TEXT,
	object TEXT,
	secondary_predicate TEXT
);
CREATE TABLE transitive_edge (
	subject TEXT,
	predicate TEXT,
	object TEXT
);
CREATE TABLE term_association (
	id TEXT NOT NULL,
	subject TEXT,
	predicate TEXT,
	object TEXT,
	evidence_type TEXT,
	publication TEXT,
	source TEXT,
	PRIMARY KEY (id)
);

DROP TABLE statements;
CREATE TABLE statements (
	stanza TEXT,
	subject TEXT,
	predicate TEXT,
	object TEXT,
	value TEXT,
	datatype TEXT,
	language TEXT
);

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

DROP TABLE node_identifier;
CREATE VIEW node_identifier AS SELECT
    id AS id,
    substr(id,0, instr(id,':')) AS prefix,
    substr(id,instr(id,':')+1) AS local_identifier
  FROM node;

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
CREATE VIEW owl_axiom AS SELECT * FROM owl_reified_axiom UNION SELECT NULL AS id, statements.* FROM statements;

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

DROP TABLE has_text_definition_statement;
CREATE VIEW has_text_definition_statement AS SELECT * FROM statements WHERE predicate='IAO:0000115';

DROP TABLE has_exact_synonym_statement;
CREATE VIEW has_exact_synonym_statement AS SELECT * FROM statements WHERE predicate='oio:hasExactSynonym';

DROP TABLE has_broad_synonym_statement;
CREATE VIEW has_broad_synonym_statement AS SELECT * FROM statements WHERE predicate='oio:hasBroadSynonym';

DROP TABLE has_narrow_synonym_statement;
CREATE VIEW has_narrow_synonym_statement AS SELECT * FROM statements WHERE predicate='oio:hasNarrowSynonym';

DROP TABLE has_related_synonym_statement;
CREATE VIEW has_related_synonym_statement AS SELECT * FROM statements WHERE predicate='oio:hasRelatedSynonym';

DROP TABLE has_synonym_statement;
CREATE VIEW has_synonym_statement AS SELECT * FROM has_exact_synonym_statement UNION SELECT * FROM has_broad_synonym_statement UNION SELECT * FROM has_narrow_synonym_statement UNION SELECT * FROM has_related_synonym_statement;

DROP TABLE has_exact_match_statement;
CREATE VIEW has_exact_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasExactMatch';

DROP TABLE has_broad_match_statement;
CREATE VIEW has_broad_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasBroadMatch';

DROP TABLE has_narrow_match_statement;
CREATE VIEW has_narrow_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasNarrowMatch';

DROP TABLE has_related_match_statement;
CREATE VIEW has_related_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasRelatedMatch';

DROP TABLE has_match_statement;
CREATE VIEW has_match_statement AS SELECT * FROM has_exact_match_statement UNION SELECT * FROM has_broad_match_statement UNION SELECT * FROM has_narrow_match_statement UNION SELECT * FROM has_related_match_statement;

DROP TABLE has_dbxref_statement;
CREATE VIEW has_dbxref_statement AS SELECT * FROM statements WHERE predicate='oio:hasDbXref';

DROP TABLE has_mapping_statement;
CREATE VIEW has_mapping_statement AS SELECT * FROM has_match_statement UNION SELECT * FROM has_dbxref_statement;

DROP TABLE contributor;
CREATE VIEW contributor AS SELECT * FROM statements WHERE predicate='dcterms:contributor';

DROP TABLE creator;
CREATE VIEW creator AS SELECT * FROM statements WHERE predicate='dcterms:creator';

DROP TABLE orcid;
CREATE VIEW orcid AS SELECT
    subject AS id,
    value AS label
  FROM
    rdfs_label_statement
  WHERE subject like 'orcid:%';

DROP TABLE axiom_dbxref_annotation;
CREATE VIEW axiom_dbxref_annotation AS SELECT * FROM owl_axiom_annotation WHERE annotation_predicate = 'oio:hasDbXref';

DROP TABLE ontology_status_statement;
CREATE VIEW ontology_status_statement AS SELECT * FROM statements WHERE predicate = '<http://obofoundry.github.io/vocabulary/activity_status>' UNION SELECT * FROM statements WHERE predicate = 'pav:status';

DROP TABLE trailing_whitespace_problem;
CREATE VIEW trailing_whitespace_problem AS SELECT
  subject,
  predicate,
  value
FROM statements WHERE VALUE like ' %' OR VALUE like '% ';

DROP TABLE property_used_with_datatype_values_and_objects;
CREATE VIEW property_used_with_datatype_values_and_objects AS SELECT
    DISTINCT
      s1.predicate AS subject,
      s1.predicate,
      s1.datatype AS value
  FROM statements AS s1
  JOIN statements AS s2 ON (s1.predicate=s2.predicate)
  WHERE s1.value IS NOT NULL and s2.object IS NOT NULL;

DROP TABLE node_with_two_labels_problem;
CREATE VIEW node_with_two_labels_problem AS SELECT
     s1.subject,
     s1.predicate,
     s1.value
  FROM rdfs_label_statement AS s1
  JOIN rdfs_label_statement AS s2
  WHERE s1.subject=s2.subject AND s1.value != s2.value;

DROP TABLE all_problems;
CREATE VIEW all_problems AS SELECT * FROM node_with_two_labels_problem UNION SELECT * FROM trailing_whitespace_problem;

DROP TABLE edge;
CREATE VIEW edge AS SELECT subject, predicate, object
  FROM owl_subclass_of_some_values_from
   UNION
  SELECT subject, predicate, object
  FROM rdfs_subclass_of_named_statement
   UNION
  SELECT subject, predicate, object
   FROM rdfs_subproperty_of_statement
   UNION
  SELECT subject, predicate, object
  FROM rdf_type_statement WHERE object IN (SELECT id FROM class_node);

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

DROP TABLE entailed_subclass_of_edge;
CREATE VIEW entailed_subclass_of_edge AS SELECT * FROM entailed_edge WHERE predicate='rdfs:subClassOf';

DROP TABLE entailed_type_edge;
CREATE VIEW entailed_type_edge AS SELECT * FROM entailed_edge WHERE predicate='rdf:type';

DROP TABLE entailed_edge_cycle;
CREATE VIEW entailed_edge_cycle AS SELECT e.*, e2.predicate AS secondary_predicate
FROM entailed_edge AS e
JOIN entailed_edge AS e2
WHERE e.object = e2.subject AND e2.object=e.subject;

DROP TABLE entailed_edge_same_predicate_cycle;
CREATE VIEW entailed_edge_same_predicate_cycle AS SELECT * FROM entailed_edge_cycle WHERE predicate = secondary_predicate;

DROP TABLE transitive_edge;
CREATE VIEW transitive_edge AS WITH RECURSIVE transitive_edge
               (
                     subject, predicate, object, depth
               )
               AS
               (SELECT subject, predicate, object, 1
                  FROM edge
                 UNION ALL
                SELECT
                     e.subject, e.predicate, a.object, a.depth+1
                  FROM edge AS e
                  JOIN transitive_edge AS a
                    ON e.object = a.subject AND e.predicate = a.predicate
               )
            SELECT * FROM transitive_edge;

-- patch statements table
-- ALTER TABLE statements ADD COLUMN graph TEXT;
