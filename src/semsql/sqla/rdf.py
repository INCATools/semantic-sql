from sqlalchemy import Column, ForeignKey, Index, Table
from sqlalchemy.ext.associationproxy import association_proxy
from sqlalchemy.orm import declarative_base, relationship
from sqlalchemy.sql.sqltypes import *

Base = declarative_base()
metadata = Base.metadata


class Prefix(Base):
    """
    Maps CURIEs to URIs
    """

    __tablename__ = "prefix"

    prefix = Column(Text(), primary_key=True)
    base = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"prefix(prefix={self.prefix},base={self.base},)"


class Statements(Base):
    """
    Represents an RDF triple
    """

    __tablename__ = "statements"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"statements(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"


class Node(Base):
    """
    The basic unit of representation in an RDF or OWL graph
    """

    __tablename__ = "node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"node(id={self.id},)"


class NodeIdentifier(Base):
    """ """

    __tablename__ = "node_identifier"

    id = Column(Text(), primary_key=True)
    prefix = Column(Text(), primary_key=True)
    local_identifier = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"node_identifier(id={self.id},prefix={self.prefix},local_identifier={self.local_identifier},)"


class RdfLevelSummaryStatistic(Base):
    """
    Abstract grouping for views/classes that provide some kind of count summary about an individual element
    """

    __tablename__ = "rdf_level_summary_statistic"

    element = Column(Text(), primary_key=True)
    count_value = Column(Integer(), primary_key=True)

    def __repr__(self):
        return f"rdf_level_summary_statistic(element={self.element},count_value={self.count_value},)"


class NodeToNodeStatement(Statements):
    """
    A statement where object is non-null and value is not populated
    """

    __tablename__ = "node_to_node_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"node_to_node_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class NodeToValueStatement(Statements):
    """
    A statement where value is non-null and object is not populated
    """

    __tablename__ = "node_to_value_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"node_to_value_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfListStatement(Statements):
    """
    A statement that is used to represent aspects of RDF lists
    """

    __tablename__ = "rdf_list_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_list_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class BlankNode(Node):
    """
    A node with an ID that is not preserved between databases
    """

    __tablename__ = "blank_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"blank_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class IriNode(Node):
    """ """

    __tablename__ = "iri_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"iri_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class ClassNode(Node):
    """
    A node that represents an RDFS/OWL class
    """

    __tablename__ = "class_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"class_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class PropertyNode(Node):
    """
    Note this only directly classifies nodes asserted to be rdf:Properties
    """

    __tablename__ = "property_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"property_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class NamedIndividualNode(Node):
    """
    A node that represents an OWL Named Individual
    """

    __tablename__ = "named_individual_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"named_individual_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class CountOfPredicates(RdfLevelSummaryStatistic):
    """
    Number of distinct usages of a predicate. NOTE MAY CHANGE: does not currently count existential usage in OWL
    """

    __tablename__ = "count_of_predicates"

    element = Column(Text(), primary_key=True)
    count_value = Column(Integer(), primary_key=True)

    def __repr__(self):
        return f"count_of_predicates(element={self.element},count_value={self.count_value},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class CountOfInstantiatedClasses(RdfLevelSummaryStatistic):
    """
    Number of distinct instantiations of a class. Note in many OBOs, classes are not directly instantiated
    """

    __tablename__ = "count_of_instantiated_classes"

    element = Column(Text(), primary_key=True)
    count_value = Column(Integer(), primary_key=True)

    def __repr__(self):
        return f"count_of_instantiated_classes(element={self.element},count_value={self.count_value},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class CountOfSubclasses(RdfLevelSummaryStatistic):
    """
    Number of subclasses for a given class
    """

    __tablename__ = "count_of_subclasses"

    element = Column(Text(), primary_key=True)
    count_value = Column(Integer(), primary_key=True)

    def __repr__(self):
        return f"count_of_subclasses(element={self.element},count_value={self.count_value},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfTypeStatement(NodeToNodeStatement):
    """
    A statement that indicates the asserted type of the subject entity
    """

    __tablename__ = "rdf_type_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_type_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsSubclassOfStatement(NodeToNodeStatement):
    """ """

    __tablename__ = "rdfs_subclass_of_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_subclass_of_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsSubpropertyOfStatement(NodeToNodeStatement):
    """ """

    __tablename__ = "rdfs_subproperty_of_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_subproperty_of_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsLabelStatement(NodeToValueStatement):
    """ """

    __tablename__ = "rdfs_label_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_label_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsDomainStatement(NodeToNodeStatement):
    """ """

    __tablename__ = "rdfs_domain_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_domain_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsRangeStatement(NodeToNodeStatement):
    """ """

    __tablename__ = "rdfs_range_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_range_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfFirstStatement(RdfListStatement):
    """
    A statement that connects a list to its first element. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful
    """

    __tablename__ = "rdf_first_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_first_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfRestStatement(RdfListStatement):
    """
    A statement that connects a list to its remaining elements. This is a low-level triple, it is unlikely you need to use this directly. It is used to define rdf_list_member_statement, which is more useful
    """

    __tablename__ = "rdf_rest_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_rest_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfRestTransitiveStatement(RdfListStatement):
    """ """

    __tablename__ = "rdf_rest_transitive_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_rest_transitive_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfListMemberStatement(RdfListStatement):
    """ """

    __tablename__ = "rdf_list_member_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_list_member_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfListNode(BlankNode):
    """
    A node representing an RDF list. Note that you will not likely need to use this directly.
    """

    __tablename__ = "rdf_list_node"

    id = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdf_list_node(id={self.id},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}


class RdfsSubclassOfNamedStatement(RdfsSubclassOfStatement):
    """ """

    __tablename__ = "rdfs_subclass_of_named_statement"

    subject = Column(Text(), primary_key=True)
    predicate = Column(Text(), primary_key=True)
    object = Column(Text(), primary_key=True)
    value = Column(Text(), primary_key=True)
    datatype = Column(Text(), primary_key=True)
    language = Column(Text(), primary_key=True)

    def __repr__(self):
        return f"rdfs_subclass_of_named_statement(subject={self.subject},predicate={self.predicate},object={self.object},value={self.value},datatype={self.datatype},language={self.language},)"

    # Using concrete inheritance: see https://docs.sqlalchemy.org/en/14/orm/inheritance.html
    __mapper_args__ = {"concrete": True}
