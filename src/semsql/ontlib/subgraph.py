"""
Deprecated -- use oaklib instead

"""
import click
import logging
import json
import yaml
import tempfile
import subprocess
import shutil
from enum import Enum, unique

from semsql.ontlib.common_queries import get_prefixes, get_label, get_text_definition, term_search, PREFIX_MAP, CURIE
from semsql.sqla.semsql import RdfsLabelStatement
from semsql.sqla.semsql import HasOioSynonymStatement
from semsql.sqla.relation_graph import SubgraphEdgeByAncestor, SubgraphEdgeByDescendant, \
    SubgraphEdgeBySelf, SubgraphEdgeByChild, SubgraphEdgeByParent, SubgraphEdgeByAncestorOrDescendant
from typing import List
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine

logger = logging.getLogger(__name__)


Row = dict
OboGraphDict = dict
TRAVERSAL_VIEWS = {
    "self": SubgraphEdgeBySelf,
    "parent": SubgraphEdgeByParent,
    "child": SubgraphEdgeByChild,
    "down": SubgraphEdgeByAncestor,
    "up": SubgraphEdgeByDescendant,
    "updown": SubgraphEdgeByAncestorOrDescendant,
}

LOGLEVEL = {
    0: logging.WARN,
    1: logging.INFO,
    2: logging.DEBUG,
    3: logging.DEBUG
}

PREDMAP = {
    "s": "rdfs:subClassOf",
    "e": "owl:equivalentClass",
    "p": "BFO:0000050"
}

TERM_QUERY_VIEWS = {
    "id": None,
    "label": RdfsLabelStatement,
    "synonym": HasOioSynonymStatement
}

@unique
class OutputFormat(Enum):
    text = 'text'
    obojson = 'obojson'
    viz = 'viz'
    obo = 'obo'
    markdown = 'markdown'
    @staticmethod
    def list():
        return list(map(lambda c: c.value, OutputFormat))


def extract_subgraph(session, terms: List[CURIE], predicates: List[CURIE] = None,
                     anchor_predicates: List[CURIE] = None,
                     view=SubgraphEdgeByAncestor) -> List[Row]:
    """
    Gives a set of IDs, extract a subgraph using these IDs as seeds

    Different view classes can be supplied; these map to SQL views conforming to the same structure

    The default view is SubgraphEdgeByAncestor, which returns all edges whose subject is an ancestor
    of a seed ID

    :param session:
    :param terms:
    :param predicates:
    :param view: SQLAlchemy model class to use as View
    :return:
    """
    q = session.query(view)
    q = q.filter(view.anchor_object.in_(terms))
    if anchor_predicates is not None:
        q = q.filter(view.anchor_predicate.in_(anchor_predicates))
    if predicates is not None:
        q = q.filter(view.predicate.in_(predicates))
    return q

def render_edge_as_string(session, e: Row) -> str:
    """
    :param session:
    :param e:
    :return: String rendering of an edge
    """
    sl = get_label(session, e.subject)
    ol = get_label(session, e.object)
    pl = get_label(session, e.predicate)
    return f'{e.subject} "{sl}" --[{e.predicate} "{pl}"]--> {e.object} "{ol}"'

def edges_to_obograph(session, edge_rows: List[Row], definitions=False) -> OboGraphDict:
    """
    Convert a list of edges into a dict object following the OboGraphsJson standard;
    the database will be iteratively queried to fetch labels, and optionally other metadata too

    :param session:
    :param edge_rows:
    :param definitions: add text definition metadata via additional queries
    :return:
    """
    emap = {}
    nodes = []
    nodeids  = set()
    for e in edge_rows:
        e2 = {"sub": e.subject, "pred": e.predicate, "obj": e.object}

        ekey = (e.subject, e.predicate, e.object)
        emap[ekey] = e2
        nodeids.add(e.subject)
        nodeids.add(e.predicate)
        nodeids.add(e.object)
    for nid in nodeids:
        n = {"id": nid, "lbl": get_label(session, nid)}
        nodes.append(n)
        if definitions:
            val = get_text_definition(session, nid)
            if val is not None:
                n["meta"] = {"definition": {"val": val}}

    g = {"nodes": nodes, "edges": list(emap.values())}
    return g

def graph_to_subject_index(g: OboGraphDict) -> dict:
    ix = {}
    for e in g["edges"]:
        s = e['sub']
        if s not in ix:
            ix[s] = []
        ix[s].append(e)
    return ix

def to_obo_format(g: OboGraphDict) -> None:
    """
    Incomplete serialization of obographs to obo format

    This can be useful for getting a quick textual overview of an ontology subgraph

    This should probably move elsewhere
    :param g:
    :return:
    """
    eix = graph_to_subject_index(g)
    nix = {n['id']: n for n in g['nodes']}
    for n in g["nodes"]:
        id = n["id"]
        print()
        print(f'[Term]')
        print(f'id: {id}')
        print(f'name: {n["lbl"]}')
        if 'meta' in n:
            meta = n['meta']
            if 'definition' in meta:
                d = meta['definition']
                v = d["val"]
                if v is not None:
                    xrefs = d.get('xrefs', [])
                    print(f'def: "{v}" [{", ".join(xrefs)}]')
        if id in eix:
            for e in eix[id]:
                p = e['pred']
                o = e['obj']
                cmt = ''
                if o in nix:
                    if 'lbl' in nix[o]:
                        cmt = f' ! {nix[o]["lbl"]}'
                if p == 'rdfs:subClassOf':
                    print(f'is_a: {o}{cmt}')
                else:
                    print(f'relationship: {p} {o}{cmt}')

def to_markdown(g: OboGraphDict, prefixes: PREFIX_MAP={}, definitions=True) -> None:
    """
    Serialization to markdown

    This should probably move elsewhere
    :param g:
    :return:
    """
    eix = graph_to_subject_index(g)
    nix = {n['id']: n for n in g['nodes']}
    for n in g["nodes"]:
        id = n["id"]
        print()
        link = _id_to_markdown_link(id, prefixes)
        print(f' * {link} **{n["lbl"]}**')
        if 'meta' in n:
            meta = n['meta']
            if  definitions and 'definition' in meta:
                d = meta['definition']
                v = d["val"]
                if v is not None:
                    xrefs = d.get('xrefs', [])
                    print(f'     * _{v}_ [{", ".join(xrefs)}]')
        if id in eix:
            for e in eix[id]:
                p = e['pred']
                o = e['obj']
                plink = _id_to_markdown_link(p, prefixes)
                olink = _id_to_markdown_link(o, prefixes)
                cmt = ''
                if o in nix:
                    if 'lbl' in nix[o]:
                        cmt = f' ({nix[o]["lbl"]})'
                print(f'     * {plink} {olink} {cmt}')

def _id_to_markdown_link(id: str, prefixes={}):
    pfx,localid = id.split(':')
    if pfx in prefixes:
        url = f'{prefixes[pfx]}{localid}'
        return f'[{id}]({url})'
    else:
        return id


def render_edges(session, edges: List[Row], to_format: str = 'text', seeds: List[CURIE] = [], stylemap: str = None,
                 configure: str = None):
    """
    render a list of edges into a desired format
    :param session:
    :param edges:
    :param to_format:
    :param seeds: this is not used to query, instead it provides metadata for rendering
    :param stylemap: used for graphviz rendering
    :return:
    """
    prefixes = get_prefixes(session)
    if to_format == 'obojson':
        g = edges_to_obograph(session, edges, definitions=True)
        print(json.dumps(g))
    elif to_format == 'obo':
        g = edges_to_obograph(session, edges, definitions=True)
        to_obo_format(g)
    elif to_format == 'markdown':
        g = edges_to_obograph(session, edges, definitions=True)
        to_markdown(g, prefixes=prefixes)
    elif to_format == 'viz':
        g1 = edges_to_obograph(session, edges)
        g = {"graphs": [g1]}
        logger.debug(f'graph = {g}')
        EXEC = 'og2dot.js'
        if shutil.which(EXEC) is None:
            logger.error(f'No {EXEC}')
            print('You need to install a node package to be able to visualize results')
            print('')
            print('npm install -g obographviz')
            print('Then set your path to include og2dot')
            raise Exception(f'Cannot find {EXEC} on path. Install from https://github.com/cmungall/obographviz')
        with tempfile.NamedTemporaryFile(dir='/tmp', mode='w') as tmpfile:
            style = {}
            if seeds is not None:
                style['highlightIds'] = seeds
            if configure is not None:
                configure_obj = yaml.safe_load(configure)
                for k,v in configure_obj.items():
                    style[k] = v
            #style['styles'] = ['filled', 'rounded']
            #style['prefixProperties'] = {
            #    "CL": {"fillcolor": "yellow"},
            #    "GO": {"fillcolor": "#ff7f00"}
            #}
            temp_file_name = tmpfile.name
            logger.info(f'Writing to {temp_file_name}')
            tmpfile.write(json.dumps(g))
            tmpfile.flush()
            pngfile = f'{temp_file_name}.png'
            style_json = json.dumps(style).replace("'", "\\'")
            logger.debug(f'Style = {style_json}')
            cmdtoks = ['og2dot.js', '-S', style_json, '-t', 'png', temp_file_name, '-o', pngfile]
            if stylemap is not None:
                cmdtoks += ['-s', stylemap]
            logger.debug(f'Run: {cmdtoks}')
            subprocess.run(cmdtoks)
            subprocess.run(['open', pngfile])
    else:
        for e in edges:
            print(render_edge_as_string(session, e))

def expand_predicate(p: str) -> CURIE:
    """
    Expand a predicate shorthand to a predicate CURIE; e.g. s = rdfs:subClassOf

    See the PREDMAP dict

    :param p:
    :return: predicate CURIE
    """
    p = p.strip()
    return PREDMAP.get(p, p)


@click.command()
@click.option('--db', '-d', help='Path to sqlite db', required=True)
@click.option('-f', '--to_format', default='text',
              type=click.Choice(OutputFormat.list()),
              help='output format')
@click.option('-p', '--predicates',
              help='comma separate list of predicates or abbreviations for graph edges')
@click.option('-P', '--anchor_predicates',
              help='comma separate list of predicates or abbreviations for closure query')
@click.option('-s', '--stylemap',
              help='a json file to configure visualization. See https://berkeleybop.github.io/kgviz-model/')
@click.option('-C', '--configure',
             help='overrides for stylemap, specified as yaml. E.g. `-C "styles: [filled, rounded]" `')
@click.option('-V', '--view', default='up',
              type=click.Choice(TRAVERSAL_VIEWS.keys()),
              help='view / direction to traverse from anchors')
@click.option('-m', '--match-criteria',
              default='id',
              type=click.Choice(TERM_QUERY_VIEWS.keys()),
              help='how to match query input')
@click.option('-v', '--verbose', count=True)
@click.argument('terms', nargs=-1)
def cli(db: str, terms: List[str], predicates: str, anchor_predicates: str, to_format: str, match_criteria: str,
        view: str, stylemap: str, configure: str, verbose: int):
    """
    Extract subgraph

    Examples:

    \b
        List all edges for a given term
            $ subgraph-d tests/inputs/go-nucleus.db CL:0000000
    \b
        List all edges for subjects whose label starts 'nucle' (e.g. nucleus)
            $ subgraph-d tests/inputs/go-nucleus.db -m label nucle%
    \b
        Visualize subgraph seeded from terms matching a label:
            $ subgraph-d tests/inputs/go-nucleus.db -m label nucle% -f viz
        (requires obographviz)
    \b
        As above, with stylesheet:
            $ subgraph-d tests/inputs/go-nucleus.db -m label nucle% -f viz -s builder/obograph-style.json
    \b
        As above, with additional stylesheet configuration, and filtering relations
            $ subgraph-d tests/inputs/go-nucleus.db -m label nucle% -f viz -p s,BFO:0000050 \
            -s builder/obograph-style.json -C 'containmentRelations: [rdfs:subClassOf]'
    \b
        As above, but visualizing edges that are descendants of query
            $ subgraph-d tests/inputs/go-nucleus.db -V down -m label nucle% -f viz -s builder/obograph-style.json

    """
    logging.basicConfig(level=LOGLEVEL[verbose])
    engine = create_engine(f'sqlite:///{db}')
    Session = sessionmaker(bind=engine)
    session = Session()
    logger.info(f'QUERY: {terms}')
    ids = term_search(session, terms, TERM_QUERY_VIEWS[match_criteria])
    logger.debug(f'SEED CURIES: {ids}')
    if to_format != 'viz':
        if stylemap is not None:
            logging.error(f'Ignoring viz-specific stylemap arg {stylemap} as format={to_format}')
        if configure is not None:
            logging.error(f'Ignoring viz-specific configure arg {configure} as format={to_format}')


    if predicates is not None:
        predicate_list = [expand_predicate(p) for p in predicates.split(",")]
    else:
        predicate_list = None
    if anchor_predicates is not None:
        anchor_predicate_list = [expand_predicate(p) for p in anchor_predicates.split(",")]
    else:
        anchor_predicate_list = None
    logger.info(f'PREDICATES: {predicate_list}')
    if len(ids) == 0:
        logger.error(f'No matching IDs for query {terms}')
    else:
        edges = extract_subgraph(session, ids, predicates=predicate_list,
                                 anchor_predicates=anchor_predicate_list, view=TRAVERSAL_VIEWS[view])
        logger.debug(f'EDGES: {edges}')
        render_edges(session, edges, to_format.lower(), seeds=ids, stylemap=stylemap, configure=configure)

if __name__ == '__main__':
    cli()
