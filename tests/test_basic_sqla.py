import unittest

import logging
import unittest
import os
from semsql.sqla.owl import ClassNode, OwlEquivalentClassStatement, RdfsSubClassOfStatement, OwlSomeValuesFrom
from sqlalchemy import Column, ForeignKey, Integer, String, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')


class OwlQueryTestCase(unittest.TestCase):
    path = os.path.join(DB_DIR, 'go-nucleus.db')
    engine = create_engine(f"sqlite:///{path}")
    Session = sessionmaker(bind=engine)
    session = Session()
    q = session.query(RdfsSubClassOfStatement).\
        join(OwlSomeValuesFrom, RdfsSubClassOfStatement.object == OwlSomeValuesFrom.restriction)
    for row in q.all():
        print(f'Row = {row}')
        print(row.subject)


