from sqlalchemy import Column, Index, Table, Text
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata

class AllProblems(Base):
    __tablename__ = 'all_problems'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

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

class CountOfInstantiatedClasses(Base):
    __tablename__ = 'count_of_instantiated_classes'
    element = Column(Text, primary_key=True)
    number_of_usages = Column(Text, primary_key=True)

class CountOfPredicates(Base):
    __tablename__ = 'count_of_predicates'
    element = Column(Text, primary_key=True)
    number_of_usages = Column(Text, primary_key=True)

class Edge(Base):
    """
    A relation graph edge that connects two entities by a predicate. Note an edge is distinct from a statement, in that an axiom such as A SubClassOf R some B is represented as multiple statements, but is a single relation graph edge
    """
    __tablename__ = 'edge'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class EntailedEdge(Base):
    """
    A relation graph edge that is inferred
    """
    __tablename__ = 'entailed_edge'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class HasBroadMatchStatement(Base):
    __tablename__ = 'has_broad_match_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasBroadSynonymStatement(Base):
    __tablename__ = 'has_broad_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasDbxrefStatement(Base):
    __tablename__ = 'has_dbxref_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasExactMatchStatement(Base):
    __tablename__ = 'has_exact_match_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasExactSynonymStatement(Base):
    __tablename__ = 'has_exact_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasMappingStatement(Base):
    __tablename__ = 'has_mapping_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasMatchStatement(Base):
    __tablename__ = 'has_match_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasNarrowMatchStatement(Base):
    __tablename__ = 'has_narrow_match_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasNarrowSynonymStatement(Base):
    __tablename__ = 'has_narrow_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasOioSynonymStatement(Base):
    __tablename__ = 'has_oio_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasRelatedMatchStatement(Base):
    __tablename__ = 'has_related_match_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasRelatedSynonymStatement(Base):
    __tablename__ = 'has_related_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class HasSynonymStatement(Base):
    __tablename__ = 'has_synonym_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class IriNode(Base):
    __tablename__ = 'iri_node'
    id = Column(Text, primary_key=True)

class LexicalProblem(Base):
    """
    a problem with the textual value of an annotation property
    """
    __tablename__ = 'lexical_problem'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

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

class NodeWithTwoLabelsProblem(Base):
    __tablename__ = 'node_with_two_labels_problem'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
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

class OntologyStatusStatement(Base):
    __tablename__ = 'ontology_status_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class OwlAllValuesFrom(Base):
    __tablename__ = 'owl_all_values_from'
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

class OwlDisjointClassStatement(Base):
    __tablename__ = 'owl_disjoint_class_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlEquivalentClassStatement(Base):
    __tablename__ = 'owl_equivalent_class_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlEquivalentToIntersectionMember(Base):
    """
    Composition of OwlEquivalentClass, OwlIntersectionOf, and RdfListMember; C = X1 and ... and Xn
    """
    __tablename__ = 'owl_equivalent_to_intersection_member'
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlRestriction(Base):
    __tablename__ = 'owl_restriction'
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

class OwlSomeValuesFrom(Base):
    __tablename__ = 'owl_some_values_from'
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

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
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class PropertyNode(Base):
    __tablename__ = 'property_node'
    id = Column(Text, primary_key=True)

class PropertyUsedWithDatatypeValuesAndObjects(Base):
    """
    A problem in which the same property is used two two different ways, one in which the range is a literal value, the other where it is an object.
    """
    __tablename__ = 'property_used_with_datatype_values_and_objects'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

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

class RdfsLabelStatement(Base):
    __tablename__ = 'rdfs_label_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

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

class RepairAction(Base):
    """
    Represents an action that needs to be taken to repair a problem
    """
    __tablename__ = 'repair_action'
    subject = Column(Text, primary_key=True)
    description = Column(Text, primary_key=True)

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

class SubgraphEdgeByAncestor(Base):
    """
    An edge within a subgraph anchored around a set of ancestor terms
    """
    __tablename__ = 'subgraph_edge_by_ancestor'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    anchor_object = Column(Text, primary_key=True)
    anchor_predicate = Column(Text, primary_key=True)

class SubgraphEdgeByDescendant(Base):
    """
    An edge within a subgraph anchored around a set of descendant terms
    """
    __tablename__ = 'subgraph_edge_by_descendant'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    anchor_object = Column(Text, primary_key=True)
    anchor_predicate = Column(Text, primary_key=True)

class TrailingWhitespaceProblem(Base):
    __tablename__ = 'trailing_whitespace_problem'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)

class TransitivePropertyNode(Base):
    __tablename__ = 'transitive_property_node'
    id = Column(Text, primary_key=True)