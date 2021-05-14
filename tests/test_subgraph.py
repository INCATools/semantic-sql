import unittest

import logging
import unittest
import os
from semsql.sqla.rdf import RdfsLabelStatement
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine



cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, 'inputs')
OUTPUT_DIR = os.path.join(cwd, 'outputs')

class SubgraphTestCase(unittest.TestCase):
    """
    https://github.com/cmungall/semantic-sql/issues/5
    """
    path = os.path.join(DB_DIR, 'go-nucleus.db')
    engine = create_engine(f"sqlite:///{path}")
    Session = sessionmaker(bind=engine)
    session = Session()
    print('OWL query:')
    q = session.query(SubgraphEdgeByAncestor).\
        where(SubgraphEdgeByAncestor.ancestor_object == 'CL:0000000')
    lines = []
    for e in q.all():
        line = f'{e.subject} {e.predicate} {e.object}'
        print(line)
        lines.append(line)
    assert 'GO:0031967 BFO:0000050 GO:0043229' in lines
    assert 'GO:0031975 rdfs:subClassOf GO:0110165' in lines

