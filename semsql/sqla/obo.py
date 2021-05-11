from sqlalchemy import Column, Index, Table, Text
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata

class AnnotationPropertyNode(Base):
    __tablename__ = 'annotation_property_node'
    id = Column(Text, primary_key=True)

class AnonymousClassExpression(Base):
    __tablename__ = 'anonymous_class_expression'
    id = Column(Text, primary_key=True)

class AnonymousExpression(Base):
    __tablename__ = 'anonymous_expression'
    id = Column(Text, primary_key=True)

class AnonymousIndividualExpression(Base):
    __tablename__ = 'anonymous_individual_expression'
    id = Column(Text, primary_key=True)

class AnonymousPropertyExpression(Base):
    __tablename__ = 'anonymous_property_expression'
    id = Column(Text, primary_key=True)

class BlankNode(Base):
    __tablename__ = 'blank_node'
    id = Column(Text, primary_key=True)

class ClassNode(Base):
    __tablename__ = 'class_node'
    id = Column(Text, primary_key=True)

class IriNode(Base):
    __tablename__ = 'iri_node'
    id = Column(Text, primary_key=True)

class NamedIndividualNode(Base):
    __tablename__ = 'named_individual_node'
    id = Column(Text, primary_key=True)

class Node(Base):
    __tablename__ = 'node'
    id = Column(Text, primary_key=True)

class NodeToNodeStatement(Base):
    """
    A statement where object is non-null and value is not populated
    """
    __tablename__ = 'node_to_node_statement'
    object = Column(Text, primary_key=True)

class NodeToValueStatement(Base):
    """
    A statement where value is non-null and object is not populated
    """
    __tablename__ = 'node_to_value_statement'
    value = Column(Text, primary_key=True)

class NodeWithTwoLabelsProblem(Base):
    __tablename__ = 'node_with_two_labels_problem'
    subject = Column(Text, primary_key=True)
    description = Column(Text, primary_key=True)
    label1 = Column(Text, primary_key=True)
    label2 = Column(Text, primary_key=True)

class ObjectPropertyNode(Base):
    __tablename__ = 'object_property_node'
    id = Column(Text, primary_key=True)

class OntologyNode(Base):
    """
    A node representing an ontology
    """
    __tablename__ = 'ontology_node'
    id = Column(Text, primary_key=True)

class OwlAllValuesFrom(Base):
    __tablename__ = 'owl_all_values_from'
    id = Column(Text, primary_key=True)
    restriction = Column(Text)
    on_property = Column(Text)
    filler = Column(Text)

class OwlDisjointClassStatement(Base):
    __tablename__ = 'owl_disjoint_class_statement'
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlEquivalentClassStatement(Base):
    __tablename__ = 'owl_equivalent_class_statement'
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlRestriction(Base):
    __tablename__ = 'owl_restriction'
    id = Column(Text, primary_key=True)
    restriction = Column(Text)
    on_property = Column(Text)
    filler = Column(Text)

class OwlSomeValuesFrom(Base):
    __tablename__ = 'owl_some_values_from'
    id = Column(Text, primary_key=True)
    restriction = Column(Text)
    on_property = Column(Text)
    filler = Column(Text)

class OwlSubclassOfSomeValuesFrom(Base):
    """
    Composition of subClassOf and SomeValuesFrom
    """
    __tablename__ = 'owl_subclass_of_some_values_from'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class Prefix(Base):
    """
    Maps CURIEs to URIs
    """
    __tablename__ = 'prefix'
    prefix = Column(Text, primary_key=True)
    base = Column(Text, primary_key=True)

class Problem(Base):
    """
    Represents an instance of a problem pertaining to conformance to OBO guidelines
    """
    __tablename__ = 'problem'
    subject = Column(Text, primary_key=True)
    description = Column(Text, primary_key=True)

class PropertyNode(Base):
    __tablename__ = 'property_node'
    id = Column(Text, primary_key=True)

class RdfTypeStatement(Base):
    """
    A statement that indicates the asserted type of the subject entity
    """
    __tablename__ = 'rdf_type_statement'
    object = Column(Text, primary_key=True)

class RdfsLabelStatement(Base):
    __tablename__ = 'rdfs_label_statement'
    value = Column(Text, primary_key=True)

class RdfsSubClassOfStatement(Base):
    __tablename__ = 'rdfs_subClassOf_statement'
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class Statements(Base):
    """
    Represents an RDF triple
    """
    __tablename__ = 'statements'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)

class TransitivePropertyNode(Base):
    __tablename__ = 'transitive_property_node'
    id = Column(Text, primary_key=True)