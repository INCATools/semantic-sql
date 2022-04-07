import unittest

import logging
import unittest
import os

from semsql.common_queries import term_search
from semsql.sqla.rdf import RdfsLabelStatement
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor, SubgraphEdgeByDescendant
from semsql.subgraph import extract_subgraph
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine


cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')

class CommonQueriesTestCase(unittest.TestCase):
    """
    Tests common queries
    """

    def setUp(self):
        path = os.path.join(DB_DIR, 'go-nucleus.db')
        engine = create_engine(f"sqlite:///{path}")
        Session = sessionmaker(bind=engine)
        session = Session()

    def test_common_queries(self):

        ids = term_search(session, ['%nucleus%'], RdfsLabelStatement)
        self.assertIn('GO:0005634', ids)

