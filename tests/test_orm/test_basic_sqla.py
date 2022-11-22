import logging
import os
import unittest

from sqlalchemy import create_engine
from sqlalchemy.orm import aliased, sessionmaker

from semsql.sqla.semsql import (
    OwlAxiomAnnotation,
    OwlSomeValuesFrom,
    RdfsLabelStatement,
    RdfsSubclassOfStatement,
)

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, "../inputs")
OUTPUT_DIR = os.path.join(cwd, "../outputs")


class SQLAlchemyTestCase(unittest.TestCase):
    def setUp(self) -> None:
        path = os.path.join(DB_DIR, "go-nucleus.db")
        engine = create_engine(f"sqlite:///{path}")
        SessionClass = sessionmaker(bind=engine)
        self.session = SessionClass()

    def test_basic_sqla(self):
        """
        Tests using SQL Alchemy to join/compose SubClassOf and SomeValuesFrom
        """
        session = self.session
        logging.info("OWL query:")
        # q = session.query(RdfsSubclassOfStatement, OwlSomeValuesFrom).\
        #    join(OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id)
        q = session.query(RdfsSubclassOfStatement)
        q = q.add_entity(OwlSomeValuesFrom)
        q = q.join(
            OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id
        )

        lines = []
        for ax, ex in q.all():
            line = f"{ax.subject} subClassOf {ex.on_property} SOME {ex.filler}"
            logging.info(line)
            lines.append(line)
        assert "GO:0016301 subClassOf BFO:0000050 SOME GO:0016310" in lines
        assert len(lines) > 100
        assert len(lines) < 200
        logging.info("As above, with labels")
        subclass_label = aliased(RdfsLabelStatement)
        filler_label = aliased(RdfsLabelStatement)
        # TODO: improve sqla mappings so this does not need to be as explicit
        q = (
            session.query(
                RdfsSubclassOfStatement, OwlSomeValuesFrom, subclass_label, filler_label
            )
            .join(
                OwlSomeValuesFrom,
                RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id,
            )
            .join(
                subclass_label,
                subclass_label.subject == RdfsSubclassOfStatement.subject,
            )
            .join(filler_label, filler_label.subject == OwlSomeValuesFrom.filler)
        )
        lines = []
        for ax, ex, sl, fl in q.all():
            line = f'{ax.subject} "{sl.value}" subClassOf {ex.on_property} SOME {ex.filler} "{fl.value}"'
            logging.info(line)
            # print(line)
            lines.append(line)
        assert (
            'GO:0012505 "endomembrane system" subClassOf BFO:0000051 SOME GO:0005773 "vacuole"'
            in lines
        )

        # alternate way of doing the same thing
        q = session.query(RdfsSubclassOfStatement)
        q = q.add_entity(OwlSomeValuesFrom)
        q = q.join(
            OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id
        )

        def add_label(q, join_slot):
            entity_label = aliased(RdfsLabelStatement)
            q = q.add_entity(entity_label)
            q = q.join(entity_label, entity_label.subject == join_slot, isouter=True)
            return q

        q = add_label(q, RdfsSubclassOfStatement.subject)
        q = add_label(q, OwlSomeValuesFrom.filler)
        null = "NONE"
        for ax, ex, sl, fl in q.all():
            line = f'{ax.subject} "{sl.value if sl else null}" subClassOf {ex.on_property} SOME {ex.filler} "{fl.value if fl else null}"'
            logging.info(line)
            # print(line)
            lines.append(line)
        print(len(lines))
        assert (
            'GO:0012505 "endomembrane system" subClassOf BFO:0000051 SOME GO:0005773 "vacuole"'
            in lines
        )

    def test_axiom_annotation(self):
        session = self.session
        n = 0
        ok1 = False
        for row in session.query(OwlAxiomAnnotation).filter(
            OwlAxiomAnnotation.subject == "GO:0005575"
        ):
            logging.info(row)
            n += 1
            if (
                row.predicate == "IAO:0000115"
                and row.value.startswith("A location")
                and row.annotation_predicate == "oio:hasDbXref"
                and row.annotation_value == "NIF_Subcellular:sao1337158144"
            ):
                ok1 = True
        assert ok1
