import os
import unittest

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from semsql.ontlib.common_queries import term_search
from semsql.sqla.semsql import RdfsLabelStatement

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, "../inputs")
OUTPUT_DIR = os.path.join(cwd, "../outputs")


class CommonQueriesTestCase(unittest.TestCase):
    """
    Tests common queries
    """

    def setUp(self):
        path = os.path.join(DB_DIR, "go-nucleus.db")
        engine = create_engine(f"sqlite:///{path}")
        Session = sessionmaker(bind=engine)
        self.session = Session()

    def test_common_queries(self):

        ids = term_search(self.session, ["%nucleus%"], RdfsLabelStatement)
        self.assertIn("GO:0005634", ids)
