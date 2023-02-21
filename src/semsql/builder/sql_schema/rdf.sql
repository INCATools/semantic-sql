-- # Class: "prefix" Description: "Maps CURIEs to URIs"
--     * Slot: prefix Description: A standardized prefix such as 'GO' or 'rdf' or 'FlyBase'
--     * Slot: base Description: The base URI a prefix will expand to
-- # Class: "statements" Description: "Represents an RDF triple"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "node_to_node_statement" Description: "A statement where object is non-null and value is not populated"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "node_to_value_statement" Description: "A statement where value is non-null and object is not populated"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_type_statement" Description: "A statement that indicates the asserted type of the subject entity"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The entity type
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subclass_of_statement" Description: ""
--     * Slot: subject Description: The subclass element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superclass element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subclass_of_named_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_subproperty_of_statement" Description: ""
--     * Slot: subject Description: The subproperty element of the triple
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: The superproperty element of the triple
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_label_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: The label value
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_domain_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdfs_range_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_list_statement" Description: "A statement that is used to represent aspects of RDF lists"
--     * Slot: subject Description: The rdf:List to which the statement applies
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_first_statement" Description: "A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_rest_statement" Description: "A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful"
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_rest_transitive_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
-- # Class: "rdf_list_member_statement" Description: ""
--     * Slot: subject Description: The subject of the statement
--     * Slot: predicate Description: The predicate of the statement
--     * Slot: object Description: Note the range of this slot is always a node. If the triple represents a literal, instead value will be populated
--     * Slot: value Description: Note the range of this slot is always a string. Only used the triple represents a literal assertion
--     * Slot: datatype Description: the rdf datatype of the value, for example, xsd:string
--     * Slot: language Description: the human language in which the value is encoded, e.g. en
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
	id TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE node_identifier (
	id TEXT, 
	prefix TEXT, 
	local_identifier TEXT, 
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
