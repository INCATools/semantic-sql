import click
import os
import logging
from semsql.sqla.rdf import RdfsLabelStatement
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor
from typing import List
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine

def get_label(session, id: str) -> str:
    """
    Fetch label for an entity

    If >1 found, returns an arbitrary one
    If none found, returns None

    Note: it may be slow to call this 1000s of times, consider using a join instead
    :param session:
    :param id:
    :return:
    """
    q = session.query(RdfsLabelStatement). \
        where(RdfsLabelStatement.subject == id)
    for s in q.all():
        # return first
        return s.value
    return None

def extract_subgraph(session, terms: List[str]) -> None:
    in_expression = SubgraphEdgeByAncestor.ancestor_object.in_([terms])
    q = session.query(SubgraphEdgeByAncestor)
    in_query = q.filter(in_expression)
    return q.filter(in_expression)

def render_edge(session, e) -> str:
    sl = get_label(session, e.subject)
    ol = get_label(session, e.object)
    pl = get_label(session, e.predicate)
    return f'{e.subject} "{sl}" --[{e.predicate} "{pl}"]--> {e.object} "{ol}"'

@click.command()
@click.option('--db', '-d', help='Path to sqlite db')
@click.argument('terms', nargs=-1)
def cli(db: str, terms: List[str]):
    """
    Extract subgraph

    Example: -d tests/inputs/go-nucleus.db CL:0000000

    TODO: export to json for visualization
    """
    engine = create_engine(f'sqlite:///{db}')
    Session = sessionmaker(bind=engine)
    session = Session()
    edges = extract_subgraph(session, terms)
    for e in edges:
        print(render_edge(session, e))


if __name__ == '__main__':
    cli()
