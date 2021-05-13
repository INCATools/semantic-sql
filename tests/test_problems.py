import unittest

import logging
import unittest
import os
from semsql.sqla.obo import AllProblems
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')

class ProblemsTestCase(unittest.TestCase):
    path = os.path.join(DB_DIR, 'go-nucleus.db')
    engine = create_engine(f"sqlite:///{path}")
    Session = sessionmaker(bind=engine)
    session = Session()
    print('OWL query:')
    q = session.query(AllProblems)
    n = 0
    for row in q.all():
        n += 1
        print(f'{n}: {row.subject} {row.predicate} {row.value}')
    assert n > 0


