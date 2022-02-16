import unittest

import logging
import unittest
import os
import subprocess
from semsql.sqla.rdf import Statements, RdfsLabelStatement
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')

class CRUDTestCase(unittest.TestCase):
    def test_crud(self):
        path = os.path.join(DB_DIR, 'go-nucleus.db')
        edit_path = os.path.join(OUTPUT_DIR, 'edit.db')
        subprocess.run(['cp', path, edit_path])
        engine = create_engine(f"sqlite:///{edit_path}")
        Session = sessionmaker(bind=engine)
        session = Session()
        q = session.query(Statements).filter(Statements.predicate == 'rdfs:label').filter(Statements.value.like('% activity'))
        for t in q.all():
            print(f'{t.subject} {t.value}')
            # https://github.com/ontodev/rdftab.rs/issues/16
            ## t.value = t.value.replace(' activity', '')
        #session.commit()



