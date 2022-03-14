import unittest

import logging
import unittest
import os
from semsql.sqla.owl import OwlSomeValuesFrom
from semsql.sqla.rdf import RdfsLabelStatement, RdfsSubclassOfStatement
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')

class SQLAlchemyTestCase(unittest.TestCase):

    def test_basic_sqla(self):
        """
        Tests using SQL Alchemy to join/compose SubClassOf and SomeValuesFrom
        """
        path = os.path.join(DB_DIR, 'go-nucleus.db')
        engine = create_engine(f"sqlite:///{path}")
        SessionClass = sessionmaker(bind=engine)
        session = SessionClass()
        logging.info('OWL query:')
        q = session.query(RdfsSubclassOfStatement, OwlSomeValuesFrom).\
            join(OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id)
        lines = []
        for ax, ex in q.all():
            line = f'{ax.subject} subClassOf {ex.on_property} SOME {ex.filler}'
            logging.info(line)
            lines.append(line)
        assert "GO:0016301 subClassOf BFO:0000050 SOME GO:0016310" in lines
        logging.info('As above, with labels')
        subclass_label = aliased(RdfsLabelStatement)
        filler_label = aliased(RdfsLabelStatement)
        # TODO: improve sqla mappings so this does not need to be as explicit
        q = session.query(RdfsSubclassOfStatement, OwlSomeValuesFrom, subclass_label, filler_label). \
            join(OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id). \
            join(subclass_label, subclass_label.subject == RdfsSubclassOfStatement.subject). \
            join(filler_label, filler_label.subject == RdfsSubclassOfStatement.subject)
        lines = []
        for ax, ex, sl, fl in q.all():
            line = f'{ax.subject} "{sl.value}" subClassOf {ex.on_property} SOME {ex.filler} "{fl.value}"'
            logging.info(line)
            lines.append(line)
        assert 'GO:0012505 "endomembrane system" subClassOf BFO:0000051 SOME GO:0005886 "endomembrane system"' \
               in lines

