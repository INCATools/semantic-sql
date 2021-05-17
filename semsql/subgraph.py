import click
import os
import logging
import json
import tempfile
import subprocess
import shutil
from semsql.sqla.rdf import RdfsLabelStatement
from semsql.sqla.omo import HasOioSynonymStatement
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor, SubgraphEdgeByDescendant
from typing import List
from sqlalchemy.orm import relationship, sessionmaker, aliased
from sqlalchemy import create_engine

TRAVERSAL_VIEWS = {
    "down": SubgraphEdgeByAncestor,
    "up": SubgraphEdgeByDescendant
}

TERM_QUERY_VIEWS = {
    "id": None,
    "label": RdfsLabelStatement,
    "synonym": HasOioSynonymStatement
}

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

def map_terms_to_ids(session, terms: List[str], view = None) -> List:
    if view == None:
        return terms
    ids = set()
    for t in terms:
        q = session.query(view).filter(view.value.like(t))
        n = 0
        for row in q.all():
            ids.add(str(row.subject))
            n += 1
        if n == 0:
            logging.warning(f'No match for query: {t}')
    return list(ids)



def extract_subgraph(session, terms: List[str], predicates: List[str] = None, view = SubgraphEdgeByAncestor) -> None:
    q = session.query(view)
    q = q.filter(view.anchor_object.in_(terms))
    if predicates is not None:
        q = q.filter(view.predicate.in_(predicates))
    return q

def render_edge_as_string(session, e) -> str:
    """
    :param session:
    :param e:
    :return: String rendering of an edge
    """
    sl = get_label(session, e.subject)
    ol = get_label(session, e.object)
    pl = get_label(session, e.predicate)
    return f'{e.subject} "{sl}" --[{e.predicate} "{pl}"]--> {e.object} "{ol}"'

def edges_to_obograph(session, edge_rows:List) -> dict:
    edges = []
    nodes = []
    nodeids  = set()
    for e in edge_rows:
        edges.append({"sub": e.subject, "pred": e.predicate, "obj": e.object})
        nodeids.add(e.subject)
        nodeids.add(e.predicate)
        nodeids.add(e.object)
    for nid in nodeids:
        nodes.append({"id": nid, "lbl": get_label(session, nid)})
    g = {"nodes": nodes, "edges": edges}
    return g

def render_edges(session, edges: List, to_format: str = 'text', seeds: List[str] = [], stylemap: str = None):
    if to_format == 'obojson':
        g = edges_to_obograph(session, edges)
        print(json.dumps(g))
    elif to_format == 'viz':
        g = edges_to_obograph(session, edges)
        EXEC = 'og2dot.js'
        if shutil.which(EXEC) is None:
            raise Exception(f'Cannot find {EXEC} on path. Install from https://github.com/cmungall/obographviz')
        with tempfile.NamedTemporaryFile(dir='/tmp', mode='w') as tmpfile:
            style = {}
            if seeds is not None:
                style['highlightIds'] = seeds
            #style['styles'] = ['filled', 'rounded']
            #style['prefixProperties'] = {
            #    "CL": {"fillcolor": "yellow"},
            #    "GO": {"fillcolor": "#ff7f00"}
            #}
            temp_file_name = tmpfile.name
            print(f'Writing to {temp_file_name}')
            tmpfile.write(json.dumps(g))
            tmpfile.flush()
            pngfile = f'{temp_file_name}.png'
            style_json = json.dumps(style).replace("'", "\\'")
            print(style_json)
            cmdtoks = ['og2dot.js', '-S', style_json, '-t', 'png', temp_file_name, '-o', pngfile]
            if stylemap is not None:
                cmdtoks += ['-s', stylemap]
            subprocess.run(cmdtoks)
            subprocess.run(['open', pngfile])
    else:
        for e in edges:
            print(render_edge_as_string(session, e))

def expand_predicate(p: str) -> str:
    """
    Expand a predicate shorthand to a predicate CURIE
    :param p:
    :return: predicate CURIE
    """
    p = p.strip()
    if p == 's':
        return 'rdfs:subClassOf'
    elif p == 'p':
        return 'BFO:0000050'
    else:
        return p

from enum import Enum, unique

@unique
class OutputFormat(Enum):
    text = 'text'
    obojson = 'obojson'
    viz = 'viz'
    @staticmethod
    def list():
        return list(map(lambda c: c.value, OutputFormat))



@click.command()
@click.option('--db', '-d', help='Path to sqlite db')
@click.option('-f', '--to_format', default='text',
              type=click.Choice(OutputFormat.list()),
              help='output format')
@click.option('-p', '--predicates',
              help='comma separate list of predicates')
@click.option('-s', '--stylemap',
              help='a json file to configure visualization. See https://berkeleybop.github.io/kgviz-model/')
@click.option('-v', '--view', default='up',
              type=click.Choice(TRAVERSAL_VIEWS.keys()),
              help='view / direction to traverse from anchors')
@click.option('-m', '--match-criteria',
              default='id',
              type=click.Choice(TERM_QUERY_VIEWS.keys()),
              help='how to match query input')
@click.argument('terms', nargs=-1)
def cli(db: str, terms: List[str], predicates: str, to_format: str, match_criteria: str, view: str, stylemap: str):
    """
    Extract subgraph

    Example: -d tests/inputs/go-nucleus.db CL:0000000

    TODO: export to json for visualization
    """
    engine = create_engine(f'sqlite:///{db}')
    Session = sessionmaker(bind=engine)
    session = Session()
    ids = map_terms_to_ids(session, terms, TERM_QUERY_VIEWS[match_criteria])
    if predicates is not None:
        predicate_list = [expand_predicate(p) for p in predicates.split(",")]
    else:
        predicate_list = None
    edges = extract_subgraph(session, ids, predicates=predicate_list, view=TRAVERSAL_VIEWS[view])
    render_edges(session, edges, to_format.lower(), seeds=ids, stylemap=stylemap)




if __name__ == '__main__':
    cli()
