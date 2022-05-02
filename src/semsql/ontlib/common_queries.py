import logging
from typing import Optional, List, Dict

from semsql.sqla.semsql import HasTextDefinitionStatement
from semsql.sqla.semsql import Prefix, RdfsLabelStatement

PREFIX_MAP = Dict[str, str]
CURIE = str

def get_prefixes(session) -> PREFIX_MAP:
    """
    Get all defined prefix mappings

    :param session:
    :return:
    """
    return {r.prefix: r.base for r in session.query(Prefix)}


def get_label(session, id: CURIE, **args) -> Optional[str]:
    """
    fetches the label/name for a term id

    :param session:
    :param id: CURIE
    :param args:
    :return:
    """
    return get_single_value(session, id, view=RdfsLabelStatement, **args)


def get_text_definition(session, id: CURIE, **args) -> Optional[str]:
    """
    Fetch label for an entity

    If >1 found, returns an arbitrary one
    If none found, returns None

    Note: it may be slow to call this 1000s of times, consider using a join instead
    :param session:
    :param id:
    :param args:
    :return:
    """
    return get_single_value(session, id, view=HasTextDefinitionStatement, **args)


def get_single_value(session, id: CURIE, view=None, strict=False) -> Optional[str]:
    q = session.query(view).where(view.subject == id)
    val = None
    for s in q.all():
        if not strict:
            return s.value
        else:
            if val is None:
                val = s.value
            elif val != s.value:
                raise Exception(f'Multiple values for {view} where id={id}')
    return val


def term_search(session, terms: List[str], view=None) -> List[CURIE]:
    """
    Maps a list of terms (e.g. query search terms to match labels, or IDs) to a list of IDs

    The intended use for this is to take a user query where a user may want to query
    either by IDs, or to provide a list of exact terms (e.g. "forelimb"), or queries
    (e.g. "%limb%"), and expand the term list to IDs

    The caller can specify a view, which is the SQLAlchemy model class used in the query;
    this should be a subtype of Statements.

    If view is none, then the output simply matches the input (i.e the user knows IDs already)

    :param session:
    :param terms: list of query terms
    :param view: view to use, e.g. RdfsLabelView
    :return: list of IDs from expansion
    """
    if view is None:
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
