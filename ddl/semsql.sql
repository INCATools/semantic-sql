-- # Class: "subject prefix" Description: "This may move to another module as it is generally useful"
--     * Slot: subject Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "textual transformation" Description: "Represents a transformation of a subject text value, e.g. lemmatization"
--     * Slot: subject Description: The string value prior to processing. This may be for example the value of an rdfs_label_statement
--     * Slot: predicate Description: The relation between subject and object, e.g stemming
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "processed statement" Description: "A statement that is enhanced with a processed/transformed text value"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: transformation_predicate Description: 
--     * Slot: transformed_value Description: 
-- # Class: "match" Description: "TODO: Reuse SSSOM here"
--     * Slot: subject_id Description: 
--     * Slot: subject_label Description: 
--     * Slot: subject_source Description: 
--     * Slot: subject_match_field Description: 
--     * Slot: subject_preprocessing Description: 
--     * Slot: object_id Description: 
--     * Slot: object_label Description: 
--     * Slot: object_source Description: 
--     * Slot: object_match_field Description: 
--     * Slot: object_preprocessing Description: 
--     * Slot: match_string Description: 
-- # Class: "prefix" Description: "Maps CURIEs to URIs"
--     * Slot: prefix Description: A standardized prefix such as 'GO' or 'rdf' or 'FlyBase'
--     * Slot: base Description: The base URI a prefix will expand to
-- # Class: "statements" Description: "Represents an RDF triple"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "node to node statement" Description: "A statement where object is non-null and value is not populated"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "node to value statement" Description: "A statement where value is non-null and object is not populated"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf type statement" Description: "A statement that indicates the asserted type of the subject entity"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: The entity type
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs subclass of statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: 
--     * Slot: object Description: The superclass element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs subclass of named statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs subproperty of statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: The subproperty element of the triple
--     * Slot: predicate Description: 
--     * Slot: object Description: The superproperty element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs label statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: The label value
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs domain statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdfs range statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf list statement" Description: "A statement that is used to represent aspects of RDF lists"
--     * Slot: stanza Description: 
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf first statement" Description: "A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf rest statement" Description: "A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf rest transitive statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "rdf list member statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "node" Description: "The basic unit of representation in an RDF or OWL graph"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "blank node" Description: "A node with an ID that is not preserved between databases"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "rdf list node" Description: "A node representing an RDF list. Note that you will not likely need to use this directly."
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "iri node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "class node" Description: "A node that represents an RDFS/OWL class"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "property node" Description: "Note this only directly classifies nodes asserted to be rdf:Properties"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "named individual node" Description: "A node that represents an OWL Named Individual"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "rdf level summary statistic" Description: "Abstract grouping for views/classes that provide some kind of count summary about an individual element"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count of predicates" Description: "Number of distinct usages of a predicate. NOTE MAY CHANGE: does not currently count existential usage in OWL"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count of instantiated classes" Description: "Number of distinct instantiations of a class. Note in many OBOs, classes are not directly instantiated"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "count of subclasses" Description: "Number of subclasses for a given class"
--     * Slot: element Description: 
--     * Slot: count_value Description: 
-- # Class: "node trait" Description: "abstract groupings/properties for different aspects of the model"
-- # Class: "class trait" Description: ""
-- # Class: "property trait" Description: ""
-- # Class: "individual trait" Description: ""
-- # Class: "is report" Description: "Used to describe classes/views that have a reporting function"
-- # Class: "relation graph construct" Description: "A construct used as part of a Relation Graph"
-- # Class: "edge" Description: "A relation graph edge that connects two entities by a predicate. Note an edge is distinct from a statement, in that an axiom such as A SubClassOf R some B is represented as multiple statements, but is a single relation graph edge"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "subgraph query" Description: "A subgraph query encompasses as subgraph edge and a seed/anchor object and seed/anchor predicate"
--     * Slot: subject Description: subject of the subgraph edge
--     * Slot: predicate Description: predicate of the subgraph edge
--     * Slot: object Description: object of the subgraph edge
--     * Slot: anchor_object Description: The entity that is used to seed the graph. The seed entity will bear some relationship to each subgraph edge; E.g. with an ancestor subgraph query, all edges will have a subject that descends from the ancestor
--     * Slot: anchor_predicate Description: The predicate that is used to determine if an edge should be included based on relationship to the anchor_object.
-- # Class: "subgraph edge by ancestor" Description: "An edge within a subgraph anchored around a set of ancestor terms"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: The ancestor term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between each edge subject and the ancestor
-- # Class: "subgraph edge by descendant" Description: "An edge within a subgraph anchored around a set of descendant terms"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: The descendant term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between the descendant and each edge subject
-- # Class: "subgraph edge by ancestor or descendant" Description: ""
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: 
--     * Slot: anchor_predicate Description: 
-- # Class: "subgraph edge by parent" Description: "An edge within a subgraph anchored around a set of parent terms"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: The parent term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between each edge subject and the parent
-- # Class: "subgraph edge by child" Description: "An edge within a subgraph anchored around a set of child terms"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: The child term
--     * Slot: anchor_predicate Description: The entailed predicate that holds between the child and each edge subject
-- # Class: "subgraph edge by self" Description: "A special null form of a subgraph query where there is no expansion"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: anchor_object Description: 
--     * Slot: anchor_predicate Description: 
-- # Class: "entailed_edge" Description: "A relation graph edge that is inferred"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "entailed_edge_cycle" Description: "An edge that composes with another edge to make a cycle"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: secondary_predicate Description: 
-- # Class: "entailed_edge_same_predicate_cycle" Description: "An entailed_edge_cycle over a single predicate"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: secondary_predicate Description: 
-- # Class: "transitive_edge" Description: "A relation graph edge that is formed from a chain of one or more edges"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
-- # Class: "ontology node" Description: "A node representing an ontology"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "object property node" Description: "A node representing an OWL object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "transitive property node" Description: "A node representing an OWL transitive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "symmetric property node" Description: "A node representing an OWL symmetric object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "reflexive property node" Description: "A node representing an OWL reflexive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "irreflexive property node" Description: "A node representing an OWL irreflexive object property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "asymmetric property node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "annotation property node" Description: "A node representing an OWL annotation property"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "deprecated node" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl imports statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl inverse of statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl complement of statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl equivalent class statement" Description: "A statement that connects two class nodes where both classes are equivalent"
--     * Slot: stanza Description: 
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: 
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl same as statement" Description: "A statement that connects two individual nodes where both individual are equivalent"
--     * Slot: stanza Description: 
--     * Slot: subject Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: predicate Description: 
--     * Slot: object Description: One of the two classes that are equivalent. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl disjoint class statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: predicate Description: 
--     * Slot: object Description: One of the two classes that are disjoint. No significance to subject vs object
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl reified axiom" Description: "An OWL axiom that has been reified - i.e. it includes an [id](id) field that uniquely identifies that axiom and which can be the subject of additional statements"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl axiom" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "owl axiom annotation" Description: ""
--     * Slot: axiom_predicate Description: 
--     * Slot: axiom_object Description: 
--     * Slot: axiom_value Description: 
--     * Slot: axiom_language Description: 
--     * Slot: axiom_datatype Description: 
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "anonymous expression" Description: "An OWL expression, such as a class expression. Expressions are "anonymous" as they are a composition of named elements rather than a named element themselves"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous class expression" Description: "An OWL anonymous class expression, such as for example `SomeValuesFrom(partOf Hand)`"
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous property expression" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "anonymous individual expression" Description: ""
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl restriction" Description: "An OWL restriction, such as `SomeValuesFrom(partOf Hand)`"
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: the id of the restriction
-- # Class: "owl some values from" Description: "An OWL SomeValuesFrom restriction"
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl all values from" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl has value" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: 
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl has self" Description: ""
--     * Slot: on_property Description: 
--     * Slot: filler Description: This is Null for a self-restriction
--     * Slot: id Description: An identifier for an element. Note blank node ids are not unique across databases
-- # Class: "owl complex axiom" Description: "An axiom that is composed of two or more statements"
-- # Class: "owl subclass of some values from" Description: "Composition of subClassOf and SomeValuesFrom"
--     * Slot: subject Description: the class C in the axiom C subClassOf P some D
--     * Slot: predicate Description: the predicate P in the axiom C subClassOf P some D
--     * Slot: object Description: the class D in the axiom C subClassOf P some D
-- # Class: "owl equivalent to intersection member" Description: "Composition of `OwlEquivalentClass`, `OwlIntersectionOf`, and `RdfListMember`; `C = X1 and ... and Xn`"
--     * Slot: subject Description: the defined class
--     * Slot: object Description: a class expression that forms the defining expression
-- # Class: "has text definition statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has oio synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has exact synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has broad synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has narrow synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has related synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has synonym statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has exact match statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has broad match statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has narrow match statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has related match statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has match statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has dbxref statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "has mapping statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "axiom dbxref annotation" Description: ""
--     * Slot: axiom_predicate Description: 
--     * Slot: axiom_object Description: 
--     * Slot: axiom_value Description: 
--     * Slot: axiom_language Description: 
--     * Slot: axiom_datatype Description: 
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "ontology status statement" Description: ""
--     * Slot: stanza Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: 
--     * Slot: language Description: 
-- # Class: "repair action" Description: "Represents an action that needs to be taken to repair a problem"
--     * Slot: subject Description: The thing that is problematic
--     * Slot: description Description: 
-- # Class: "problem" Description: "Represents an instance of a problem pertaining to conformance to OBO guidelines"
--     * Slot: subject Description: The thing that is problematic
--     * Slot: predicate Description: The property of the thing that is problematic
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "lexical problem" Description: "a problem with the textual value of an annotation property"
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "trailing whitespace problem" Description: ""
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "property used with datatype values and objects" Description: "A problem in which the same property is used two two different ways, one in which the range is a literal value, the other where it is an object."
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "node with two labels problem" Description: ""
--     * Slot: label1 Description: 
--     * Slot: label2 Description: 
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
-- # Class: "all problems" Description: ""
--     * Slot: subject Description: 
--     * Slot: predicate Description: 
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion

CREATE TABLE "subject prefix" (
	subject TEXT, 
	value TEXT
);
CREATE TABLE "textual transformation" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "processed statement" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT, 
	transformation_predicate TEXT, 
	transformed_value TEXT
);
CREATE TABLE "match" (
	subject_id TEXT, 
	subject_label TEXT, 
	subject_source TEXT, 
	subject_match_field TEXT, 
	subject_preprocessing TEXT, 
	object_id TEXT, 
	object_label TEXT, 
	object_source TEXT, 
	object_match_field TEXT, 
	object_preprocessing TEXT, 
	match_string TEXT
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
CREATE TABLE "node to node statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "node to value statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf type statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs subclass of statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs subclass of named statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs subproperty of statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs label statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs domain statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdfs range statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf list statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf first statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf rest statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf rest transitive statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "rdf list member statement" (
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
CREATE TABLE "blank node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "rdf list node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "iri node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "class node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "named individual node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "rdf level summary statistic" (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE "count of predicates" (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE "count of instantiated classes" (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE "count of subclasses" (
	element TEXT, 
	count_value INTEGER
);
CREATE TABLE edge (
	subject TEXT, 
	predicate TEXT, 
	object TEXT
);
CREATE TABLE "subgraph query" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by ancestor" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by descendant" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by ancestor or descendant" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by parent" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by child" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	anchor_object TEXT, 
	anchor_predicate TEXT
);
CREATE TABLE "subgraph edge by self" (
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
CREATE TABLE "ontology node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "object property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "transitive property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "symmetric property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "reflexive property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "irreflexive property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "asymmetric property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "annotation property node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "deprecated node" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl imports statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl inverse of statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl complement of statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl equivalent class statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl same as statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl disjoint class statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT NOT NULL, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "owl reified axiom" (
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
CREATE TABLE "owl axiom" (
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
CREATE TABLE "owl axiom annotation" (
	axiom_predicate TEXT, 
	axiom_object TEXT, 
	axiom_value TEXT, 
	axiom_language TEXT, 
	axiom_datatype TEXT, 
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "anonymous expression" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "anonymous class expression" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "anonymous property expression" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "anonymous individual expression" (
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl restriction" (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl some values from" (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl all values from" (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl has value" (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl has self" (
	on_property TEXT, 
	filler TEXT, 
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "owl subclass of some values from" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT
);
CREATE TABLE "owl equivalent to intersection member" (
	subject TEXT, 
	object TEXT
);
CREATE TABLE "has text definition statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has oio synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has exact synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has broad synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has narrow synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has related synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has synonym statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has exact match statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has broad match statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has narrow match statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has related match statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has match statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has dbxref statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "has mapping statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "axiom dbxref annotation" (
	axiom_predicate TEXT, 
	axiom_object TEXT, 
	axiom_value TEXT, 
	axiom_language TEXT, 
	axiom_datatype TEXT, 
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "ontology status statement" (
	stanza TEXT, 
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	value TEXT NOT NULL, 
	datatype TEXT, 
	language TEXT
);
CREATE TABLE "repair action" (
	subject TEXT, 
	description TEXT
);
CREATE TABLE problem (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "lexical problem" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "trailing whitespace problem" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "property used with datatype values and objects" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "node with two labels problem" (
	label1 TEXT, 
	label2 TEXT, 
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
CREATE TABLE "all problems" (
	subject TEXT, 
	predicate TEXT, 
	value TEXT
);
-- ** REWRITE TABLES AS VIEWS **
-- SCHEMA: https://w3id.org/kgcl/semsql

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
  FROM statements AS s1, statements AS s2 ON (s1.predicate=s2.predicate)
  WHERE s1.value IS NOT NULL and s2.object IS NOT NULL;

DROP TABLE node_with_two_labels_problem;
CREATE VIEW node_with_two_labels_problem AS SELECT
     s1.subject,
     s1.predicate,
     s1.value
  FROM rdfs_label_statement AS s1, rdfs_label_statement AS s2
  WHERE s1.subject=s2.subject AND s1.value != s2.value;

DROP TABLE all_problems;
CREATE VIEW all_problems AS SELECT * FROM node_with_two_labels_problem UNION SELECT * FROM trailing_whitespace_problem;

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

DROP TABLE has_exact_match_statement;
CREATE VIEW has_exact_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasExactMatch';

DROP TABLE has_broad_match_statement;
CREATE VIEW has_broad_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasBroadMatch';

DROP TABLE has_narrow_match_statement;
CREATE VIEW has_narrow_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasNarrowMatch';

DROP TABLE has_related_match_statement;
CREATE VIEW has_related_match_statement AS SELECT * FROM statements WHERE predicate='skos:hasRelatedMatch';

DROP TABLE has_dbxref_statement;
CREATE VIEW has_dbxref_statement AS SELECT * FROM statements WHERE predicate='oio:hasDbXref';

DROP TABLE axiom_dbxref_annotation;
CREATE VIEW axiom_dbxref_annotation AS SELECT * FROM owl_axiom_annotation WHERE annotation_predicate = 'oio:hasDbXref';

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

DROP TABLE entailed_edge_cycle;
CREATE VIEW entailed_edge_cycle AS SELECT e.*, e2.predicate AS secondary_predicate
  FROM entailed_edge AS e,
       entailed_edge AS e2
  WHERE e.object_id = e2.subject_id AND e2.object_id=e.subject_id;

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

DROP TABLE subject_prefix;
CREATE VIEW subject_prefix AS SELECT DISTINCT s.subject, prefix.prefix AS value FROM prefix, statements AS s WHERE INSTR(s.subject,prefix || ':')=1;

DROP TABLE processed_statement;
CREATE VIEW processed_statement AS SELECT s.*, t.predicate AS transformation_predicate, t.value AS transformed_value
  FROM statements AS s JOIN textual_transformation AS t ON(s.value=t.subject)
  WHERE datatype != 'xsd:boolean';

DROP TABLE match;
CREATE VIEW match AS SELECT
   s1.subject AS subject_id,
   s1l.value AS subject_label,
   s1.predicate AS subject_match_field,
   s1p.value AS subject_source,
   s1.transformation_predicate AS subject_preprocessing,
   s2.subject AS object_id,
   s2l.value AS object_label,
   s2.predicate AS object_match_field,
   s2p.value AS object_source,
   s2.transformation_predicate AS object_preprocessing,
   s1.transformed_value AS match_field
  FROM
    processed_statement AS s1
    JOIN processed_statement AS s2 ON (s1.transformed_value = s2.transformed_value)
    JOIN rdfs_label_statement AS s1l ON (s1.subject=s1l.subject)
    JOIN rdfs_label_statement AS s2l ON (s2.subject=s2l.subject)
    JOIN subject_prefix AS s1p ON (s1.subject=s1p.subject)
    JOIN subject_prefix AS s2p ON (s2.subject=s2p.subject)
    WHERE s1.subject != s2.subject;
