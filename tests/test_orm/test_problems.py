import os
import unittest

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from semsql.sqla.semsql import AllProblems

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, "../inputs")
OUTPUT_DIR = os.path.join(cwd, "../outputs")


class ProblemsTestCase(unittest.TestCase):
    def test_problems(self):
        """
        Tests a simple robot-report style QC check
        """
        path = os.path.join(DB_DIR, "go-nucleus.db")
        engine = create_engine(f"sqlite:///{path}")
        session = sessionmaker(bind=engine)()
        print("OWL query:")
        q = session.query(AllProblems)
        n = 0
        for row in q.all():
            n += 1
            print(f"{n}: {row.subject} {row.predicate} {row.value}")
        assert n > 0
