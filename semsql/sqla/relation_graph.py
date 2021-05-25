from sqlalchemy import Column, Index, Table, Text
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata

class AnnotationPropertyNode(Base):
    """
    A node representing an OWL annotation property
    """
    __tablename__ = 'annotation_property_node'
    id = Column(Text, primary_key=True)

class AnonymousClassExpression(Base):
    """
    An OWL anonymous class expression, such as for example `SomeValuesFrom(partOf Hand)`
    """
    __tablename__ = 'anonymous_class_expression'
    id = Column(Text, primary_key=True)

class AnonymousExpression(Base):
    """
    An OWL expression, such as a class expression. Expressions are "anonymous" as they are a composition of named elements rather than a named element themselves
    """
    __tablename__ = 'anonymous_expression'
    id = Column(Text, primary_key=True)

class AnonymousIndividualExpression(Base):
    __tablename__ = 'anonymous_individual_expression'
    id = Column(Text, primary_key=True)

class AnonymousPropertyExpression(Base):
    __tablename__ = 'anonymous_property_expression'
    id = Column(Text, primary_key=True)

class AsymmetricPropertyNode(Base):
    __tablename__ = 'asymmetric_property_node'
    id = Column(Text, primary_key=True)

class BlankNode(Base):
    """
    A node with an ID that is not preserved between databases
    """
    __tablename__ = 'blank_node'
    id = Column(Text, primary_key=True)

class ClassNode(Base):
    """
    A node that represents an RDFS/OWL class
    """
    __tablename__ = 'class_node'
    id = Column(Text, primary_key=True)

class CountOfInstantiatedClasses(Base):
    """
    Number of distinct instantiations of a class. Note in many OBOs, classes are not directly instantiated
    """
    __tablename__ = 'count_of_instantiated_classes'
    element = Column(Text, primary_key=True)
    count_value = Column(Text, primary_key=True)

class CountOfPredicates(Base):
    """
    Number of distinct usages of a predicate. NOTE MAY CHANGE: does not currently count existential usage in OWL
    """
    __tablename__ = 'count_of_predicates'
    element = Column(Text, primary_key=True)
    count_value = Column(Text, primary_key=True)

class CountOfSubclasses(Base):
    """
    Number of subclasses for a given class
    """
    __tablename__ = 'count_of_subclasses'
    element = Column(Text, primary_key=True)
    count_value = Column(Text, primary_key=True)

class DeprecatedNode(Base):
    __tablename__ = 'deprecated_node'
    id = Column(Text, primary_key=True)

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

class IriNode(Base):
    __tablename__ = 'iri_node'
    id = Column(Text, primary_key=True)

class IrreflexivePropertyNode(Base):
    """
    A node representing an OWL irreflexive object property
    """
    __tablename__ = 'irreflexive_property_node'
    id = Column(Text, primary_key=True)

class NamedIndividualNode(Base):
    """
    A node that represents an OWL Named Individual
    """
    __tablename__ = 'named_individual_node'
    id = Column(Text, primary_key=True)

class Node(Base):
    """
    The basic unit of representation in an RDF or OWL graph
    """
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

class ObjectPropertyNode(Base):
    """
    A node representing an OWL object property
    """
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
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

class OwlAxiom(Base):
    __tablename__ = 'owl_axiom'
    stanza = Column(Text)
    subject = Column(Text)
    predicate = Column(Text)
    object = Column(Text)
    value = Column(Text)
    datatype = Column(Text)
    language = Column(Text)
    id = Column(Text, primary_key=True)

class OwlAxiomAnnotation(Base):
    __tablename__ = 'owl_axiom_annotation'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    axiom_predicate = Column(Text, primary_key=True)
    axiom_object = Column(Text, primary_key=True)
    axiom_value = Column(Text, primary_key=True)
    axiom_language = Column(Text, primary_key=True)
    axiom_datatype = Column(Text, primary_key=True)

class OwlComplementOfStatement(Base):
    __tablename__ = 'owl_complement_of_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

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
    """
    A statement that connects two class nodes where both classes are equivalent
    """
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
    Composition of `OwlEquivalentClass`, `OwlIntersectionOf`, and `RdfListMember`; `C = X1 and ... and Xn`
    """
    __tablename__ = 'owl_equivalent_to_intersection_member'
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlHasSelf(Base):
    __tablename__ = 'owl_has_self'
    on_property = Column(Text)
    id = Column(Text, primary_key=True)
    filler = Column(Text)

class OwlHasValue(Base):
    __tablename__ = 'owl_has_value'
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

class OwlImportsStatement(Base):
    __tablename__ = 'owl_imports_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlInverseOfStatement(Base):
    __tablename__ = 'owl_inverse_of_statement'
    stanza = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlReifiedAxiom(Base):
    """
    An OWL axiom that has been reified - i.e. it includes an [id](id) field that uniquely identifies that axiom and which can be the subject of additional statements
    """
    __tablename__ = 'owl_reified_axiom'
    stanza = Column(Text)
    subject = Column(Text)
    predicate = Column(Text)
    object = Column(Text)
    value = Column(Text)
    datatype = Column(Text)
    language = Column(Text)
    id = Column(Text, primary_key=True)

class OwlRestriction(Base):
    """
    An OWL restriction, such as `SomeValuesFrom(partOf Hand)`
    """
    __tablename__ = 'owl_restriction'
    on_property = Column(Text)
    filler = Column(Text)
    id = Column(Text, primary_key=True)

class OwlSameAsStatement(Base):
    """
    A statement that connects two individual nodes where both individual are equivalent
    """
    __tablename__ = 'owl_same_as_statement'
    stanza = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    value = Column(Text, primary_key=True)
    datatype = Column(Text, primary_key=True)
    language = Column(Text, primary_key=True)
    subject = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)

class OwlSomeValuesFrom(Base):
    """
    An OWL SomeValuesFrom restriction
    """
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
    """
    Abstract grouping for views/classes that provide some kind of count summary about an individual element
    """
    __tablename__ = 'rdf_level_summary_statistic'
    element = Column(Text, primary_key=True)
    count_value = Column(Text, primary_key=True)

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
    A node representing an RDF list. Note that you will not likely need to use this directly.
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

class ReflexivePropertyNode(Base):
    """
    A node representing an OWL reflexive object property
    """
    __tablename__ = 'reflexive_property_node'
    id = Column(Text, primary_key=True)

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

class SubgraphEdgeByChild(Base):
    """
    An edge within a subgraph anchored around a set of child terms
    """
    __tablename__ = 'subgraph_edge_by_child'
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

class SubgraphEdgeByParent(Base):
    """
    An edge within a subgraph anchored around a set of parent terms
    """
    __tablename__ = 'subgraph_edge_by_parent'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    anchor_object = Column(Text, primary_key=True)
    anchor_predicate = Column(Text, primary_key=True)

class SubgraphEdgeBySelf(Base):
    """
    A special null form of a subgraph query where there is no expansion
    """
    __tablename__ = 'subgraph_edge_by_self'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    anchor_object = Column(Text, primary_key=True)
    anchor_predicate = Column(Text, primary_key=True)

class SubgraphQuery(Base):
    """
    A subgraph query encompasses as subgraph edge and a seed/anchor object and seed/anchor predicate
    """
    __tablename__ = 'subgraph_query'
    subject = Column(Text, primary_key=True)
    predicate = Column(Text, primary_key=True)
    object = Column(Text, primary_key=True)
    anchor_object = Column(Text, primary_key=True)
    anchor_predicate = Column(Text, primary_key=True)

class SymmetricPropertyNode(Base):
    """
    A node representing an OWL symmetric object property
    """
    __tablename__ = 'symmetric_property_node'
    id = Column(Text, primary_key=True)

class TransitivePropertyNode(Base):
    """
    A node representing an OWL transitive object property
    """
    __tablename__ = 'transitive_property_node'
    id = Column(Text, primary_key=True)