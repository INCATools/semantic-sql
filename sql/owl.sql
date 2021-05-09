-- #include "rdf.sql"


CREATE VIEW owl_ontology AS SELECT subject AS id FROM rdftype WHERE object='owl:Ontology';

CREATE VIEW owlClass AS SELECT distinct subject AS id FROM statements WHERE predicate = 'rdf:type' AND object = 'owl:Class';
CREATE VIEW owlNamedIndividual AS SELECT distinct subject AS id FROM statements WHERE predicate = 'rdf:type' AND object = 'owl:NamedIndividual';
CREATE VIEW object_property AS SELECT distinct subject AS id FROM statements WHERE predicate = 'rdf:type' AND object = 'owl:ObjectProperty';
CREATE VIEW annotation_property AS SELECT distinct subject AS id FROM statements WHERE predicate = 'rdf:type' AND object = 'owl:AnnotationProperty';
CREATE VIEW transitive AS SELECT distinct subject AS id FROM statements WHERE predicate = 'rdf:type' AND object = 'owl:TransitiveProperty';

CREATE VIEW punned_class_as_individual AS SELECT id FROM owlClass WHERE id IN (SELECT id FROM owlNamedIndividual);

CREATE VIEW illegally_punned_object_annotation_property AS SELECT id FROM object_property WHERE id IN (SELECT id FROM annotation_property);

CREATE VIEW axiom_annotation AS
  SELECT
    axpv.stanza AS stanza,
    axs.object AS subject,
    axp.object AS predicate,
    axo.object AS object,
    axo.value AS value,
    axo.datatype AS datatype,
    axo.language AS language,
    axpv.subject AS id,
    axpv.predicate AS annotation_predicate,
    axpv.object AS annotation_iri,
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
   axp.subject = axpv.subject AND
   axo.subject = axpv.subject AND
   axpv.predicate NOT IN ('owl:annotatedSource', 'owl:annotatedProperty', 'owl:annotatedTarget', 'rdf:type');


CREATE VIEW subclass_of AS
   SELECT stanza, subject, predicate, object FROM
     statements
   WHERE
     predicate = 'rdfs:subClassOf';
     
CREATE VIEW subclass_of_named AS
   SELECT * from subclass_of WHERE object NOT LIKE '_:%';
     
CREATE VIEW some_values_from AS
   SELECT onProperty.subject AS restriction,
          onProperty.object AS on_property,
          someValuesFrom.object AS filler
          FROM
     statements AS onProperty,
     statements AS someValuesFrom
   WHERE
     onProperty.predicate = 'owl:onProperty' AND
     onProperty.subject=someValuesFrom.subject AND
     someValuesFrom.predicate='owl:someValuesFrom';
     
CREATE VIEW subclass_of_some AS
   SELECT subClassOf.stanza,
          subClassOf.subject,
          svf.on_property AS predicate,
          svf.filler AS object
          FROM
     statements AS subClassOf, 
     some_values_from AS svf
   WHERE
     subClassOf.predicate = 'rdfs:subClassOf' AND
     svf.restriction=subClassOf.object;



CREATE VIEW predicate AS SELECT distinct predicate AS id FROM edge WHERE id IN (SELECT id FROM object_property) OR id='rdfs:subClassOf';

CREATE VIEW subclass_of_ancestors AS
        WITH RECURSIVE subclass_of_ancestors
             (
                   subject, object, depth
             )
             AS
             (SELECT subject, object, 1
                FROM subclass_of
               UNION ALL
              SELECT
                   e.subject, a.object, a.depth+1
                FROM subclass_of AS e
                JOIN subclass_of_ancestors AS a
                  ON e.object = a.subject
             )
          SELECT * FROM subclass_of_ancestors;



