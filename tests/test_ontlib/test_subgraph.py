import unittest
import os
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor, SubgraphEdgeByDescendant
from semsql.ontlib.subgraph import extract_subgraph
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine


cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, '../inputs')
OUTPUT_DIR = os.path.join(cwd, '../outputs')

class SubgraphTestCase(unittest.TestCase):
    """
    Tests subgraph extraction

    https://github.com/cmungall/semantic-sql/issues/5
    """
    def test_subgraph(self):
        path = os.path.join(DB_DIR, 'go-nucleus.db')
        engine = create_engine(f"sqlite:///{path}")
        Session = sessionmaker(bind=engine)
        session = Session()
        edges = extract_subgraph(session, terms=['CL:0000000'], view=SubgraphEdgeByAncestor)
        lines = []
        print(f'graph for descendants of "cell"')
        for e in edges:
            line = f'{e.subject} {e.predicate} {e.object}'
            print(line)
            lines.append(line)
        assert 'GO:0031967 BFO:0000050 GO:0043229' in lines
        assert 'GO:0031975 rdfs:subClassOf GO:0110165' in lines

        print(f'graph for ancestors of "nuclear membrane"')
        edges = extract_subgraph(session, terms=['GO:0031965'], view=SubgraphEdgeByDescendant)
        lines = []
        for e in edges:
            line = f'{e.subject} {e.predicate} {e.object}'
            print(line)
            lines.append(line)
        assert 'GO:0031967 BFO:0000050 GO:0043229' in lines
        assert 'GO:0031975 rdfs:subClassOf GO:0110165' in lines

