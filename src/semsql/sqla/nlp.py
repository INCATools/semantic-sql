from sqlalchemy import Column, Index, Table, Text
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata

class BlankNode(Base):
    __tablename__ = 'blank_node'
    id = Column(Text, primary_key=True)

class ClassNode(Base):
    __tablename__ = 'class_node'
    id = Column(Text, primary_key=True)

class CountOfInstantiatedClasses(Base):
    __tablename__ = 'count_of_instantiated_classes'
    element = Column(Text, primary_key=True)
    number_of_usages = Column(Text, primary_key=True)

class CountOfPredicates(Base):
    __tablename__ = 'count_of_predicates'
    element = Column(Text, primary_key=True)
    number_of_usages = Column(Text, primary_key=True)

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
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class NodeToValueStatement(Base):
    """
    A statement where value is non-null and object is not populated
    """
    __tablename__ = 'node_to_value_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class Prefix(Base):
    """
    Maps CURIEs to URIs
    """
    __tablename__ = 'prefix'
    prefix = Column(Text, primary_key=True)
    base = Column(Text, primary_key=True)

class ProcessedStatement(Base):
    __tablename__ = 'processed_statement'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    transformation_predicate = Column(Text, primary_key=True)
    transformed_value = Column(Text, primary_key=True)

class PropertyNode(Base):
    """
    Note this only directly classifies nodes asserted to be rdf:Properties
    """
    __tablename__ = 'property_node'
    id = Column(Text, primary_key=True)

class RdfFirstStatement(Base):
    """
    A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful
    """
    __tablename__ = 'rdf_first_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)

class RdfLevelSummaryStatistic(Base):
    __tablename__ = 'rdf_level_summary_statistic'
    element = Column(Text, primary_key=True)
    number_of_usages = Column(Text, primary_key=True)

class RdfListMemberStatement(Base):
    __tablename__ = 'rdf_list_member_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)

class RdfListNode(Base):
    """
    A node representing an RDF list
    """
    __tablename__ = 'rdf_list_node'
    id = Column(Text, primary_key=True)

class RdfListStatement(Base):
    """
    A statement that is used to represent aspects of RDF lists
    """
    __tablename__ = 'rdf_list_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)

class RdfRestStatement(Base):
    """
    A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful
    """
    __tablename__ = 'rdf_rest_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)

class RdfRestTransitiveStatement(Base):
    __tablename__ = 'rdf_rest_transitive_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)

class RdfTypeStatement(Base):
    """
    A statement that indicates the asserted type of the subject entity
    """
    __tablename__ = 'rdf_type_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsDomainStatement(Base):
    __tablename__ = 'rdfs_domain_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsLabelStatement(Base):
    __tablename__ = 'rdfs_label_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class RdfsRangeStatement(Base):
    __tablename__ = 'rdfs_range_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsSubclassOfNamedStatement(Base):
    __tablename__ = 'rdfs_subclass_of_named_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsSubclassOfStatement(Base):
    __tablename__ = 'rdfs_subclass_of_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsSubpropertyOfStatement(Base):
    __tablename__ = 'rdfs_subproperty_of_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
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
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)

class TextualTransformation(Base):
    __tablename__ = 'textual_transformation'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)