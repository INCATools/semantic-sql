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

class IriNode(Base):
    __tablename__ = 'iri_node'
    id = Column(Text, primary_key=True)

class NamedIndividualNode(Base):
    __tablename__ = 'named_individual_node'
    id = Column(Text, primary_key=True)

class Node(Base):
    __tablename__ = 'node'
    id = Column(Text, primary_key=True)

class OntologyNode(Base):
    __tablename__ = 'ontology_node'
    id = Column(Text, primary_key=True)

class OwlEquivalentClassStatement(Base):
    __tablename__ = 'owl_equivalent_class_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlRestriction(Base):
    __tablename__ = 'owl_restriction'
    restriction = Column(Text, primary_key=True)
    on_property = Column(Text, primary_key=True)
    filler = Column(Text, primary_key=True)

class OwlSomeValuesFrom(Base):
    __tablename__ = 'owl_some_values_from'
    restriction = Column(Text, primary_key=True)
    on_property = Column(Text, primary_key=True)
    filler = Column(Text, primary_key=True)

class Prefix(Base):
    """
    Maps CURIEs to URIs
    """
    __tablename__ = 'prefix'
    prefix = Column(Text, primary_key=True)
    base = Column(Text, primary_key=True)

class RdfTypeStatement(Base):
    """
    A statement that indicates the asserted type of the subject entity
    """
    __tablename__ = 'rdf_type_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class RdfsLabelStatement(Base):
    __tablename__ = 'rdfs_label_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)

class RdfsSubClassOfStatement(Base):
    __tablename__ = 'rdfs_subClassOf_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
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
    language = Column(Text, primary_key=True)