import unittest

import logging
import unittest
import os
import subprocess
from shutil import copyfile

from semsql.sqla.rdf import Statements, RdfsLabelStatement
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')
SRC_DB = os.path.join(DB_DIR, 'go-nucleus.db')
TEST_DB = os.path.join(DB_DIR, 'go-nucleus-copy.db')

class CRUDTestCase(unittest.TestCase):
    def test_crud(self):
        """
        Test using SQL Alchemy to perform updates

        INCOMPLETE
        """
        copyfile(SRC_DB, TEST_DB)
        engine = create_engine(f"sqlite:///{TEST_DB}")
        Session = sessionmaker(bind=engine)
        session = Session()
        q = session.query(Statements).filter(Statements.predicate == 'rdfs:label').filter(Statements.value.like('% activity'))
        for t in q.all():
            print(f'{t.subject} {t.value}')
            # https://github.com/ontodev/rdftab.rs/issues/16
            t.value = t.value.replace(' activity', '')
        # This needs resolved first: https://github.com/ontodev/rdftab.rs/issues/16
        #session.commit()



