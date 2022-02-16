import unittest

import logging
import unittest
import os
from semsql.testmodel import RdfsLabelStatement, IriNode, Node
from sqlalchemy import Column, ForeignKey, Integer, String, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, '../db')
OUTPUT_DIR = os.path.join(cwd, 'outputs')


class QueryTestCase(unittest.TestCase):
    def test_sqla(self):
        path = os.path.join(DB_DIR, 'pato.db')
        engine = create_engine(f"sqlite:///{path}")
        Session = sessionmaker(bind=engine)
        session = Session()
        result = session.query(IriNode).join(RdfsLabelStatement) ## .filter(Invoice.amount == 8500)
        for row in result[0:5]:
            print(f'Row = {row}')
            print(row.id)
            for lbl in row.labels:
                print(f'  LBL={lbl.subject} {lbl.value} // {lbl.subject_ref.id}')
        result = session.query(RdfsLabelStatement).join(IriNode)
        for lbl in result[0:5]:
            print(f'Row = {lbl}')
            print(f'  LBL={lbl.subject} {lbl.value} // {lbl.subject_ref.id} // {len(lbl.subject_ref.labels)}')



