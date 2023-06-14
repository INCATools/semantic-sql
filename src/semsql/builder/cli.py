import logging
from itertools import chain, combinations

import click
from linkml_runtime import SchemaView
from linkml_runtime.utils.formatutils import underscore
from sqlalchemy import text

import semsql.builder.builder as builder
from semsql.linkml import path_to_schema
from semsql.sqlutils.viewgen import get_viewdef


def powerset(iterable):
    """calculate powerset.

    See: https://docs.python.org/3/library/itertools.html#itertools-recipes

    >>> powerset([1,2,3])
    () (1,) (2,) (3,) (1,2) (1,3) (2,3) (1,2,3)
    """
    s = list(iterable)
    return chain.from_iterable(combinations(s, r) for r in range(len(s) + 1))


@click.group()
@click.option("-v", "--verbose", count=True)
@click.option("-q", "--quiet")
def main(verbose: int, quiet: bool):
    """Run the SemSQL CLI."""
    if verbose >= 2:
        logging.basicConfig(level=logging.DEBUG)
    elif verbose == 1:
        logging.basicConfig(level=logging.INFO)
    else:
        logging.basicConfig(level=logging.WARNING)
    if quiet:
        logging.basicConfig(level=logging.ERROR)


@main.command()
@click.argument("path")
@click.option(
    "--docker/--no-docker",
    default=False,
    show_default=True,
    help="Uses ODK docker image",
)
@click.option("--prefix-csv-path", "-P", help="path to csv of prefix expansions")
def make(path, docker, **kwargs):
    """
    Makes a specified target, such as a db file

    Example:

        semsql make envo.db

    (assumes envo.owl is in the same folder)
    """
    if docker:
        docker_config = builder.DockerConfig()
    else:
        docker_config = None
    builder.make(path, docker_config=docker_config, **kwargs)


@main.command()
@click.option(
    "--local-prefixes",
    "-P",
    type=click.File(mode="w"),
    help="path to local prefixes file (will be overridden)",
)
@click.argument("registry")
def generate_makefile(registry, local_prefixes):
    """
    Generates makefile
    """
    print(builder.compile_registry(registry, local_prefix_file=local_prefixes))


@main.command()
@click.option("-o", "--output")
@click.argument("ontology")
def download(ontology, output):
    """
    Download a read-made SQLite db for an OBO ontology

    Example:

        semsql download cl -o cl.db
    """
    builder.download_obo_sqlite(ontology, destination=output)


@main.command()
@click.option("-i", "--input")
@click.argument("query")
def query(input, query):
    """
    Performs a SQL query on an OWL file

    Example:

        semsql query -i hp.owl "SELECT * FROM rdfs_label_statement WHERE value LIKE 'Abnormality of %'"
    """
    conn = builder.connect(input)
    statement = text(query)
    rs = conn.execute(statement)
    for row in rs:
        print(row)


@main.command()
@click.argument("views", nargs=-1)
@click.option(
    "--index/--no-index",
    default=True,
    show_default=True,
    help="Create indexes on each column",
)
@click.option(
    "--full-index/--no-full-index",
    default=False,
    show_default=True,
    help="Create indexes on all combos of columns (powerset)",
)
@click.option(
    "--schema",
    "-s",
    help="Path o schema (optional)",
)
def view2table(views, schema, index: bool, full_index: bool):
    """
    Generates a command that turns a view into a table

    Example usage:

        semsql view2table rdfs_label_statement --index | sqlite3 db/pato.db

    """
    if not schema:
        schema = str(path_to_schema())
    sv = SchemaView(schema)
    for cn, c in sv.all_classes().items():
        tn = underscore(cn)
        if not views or str(cn) in views or tn in views:
            view = get_viewdef(c)
            if view is not None:
                print(f"DROP VIEW {tn};")
                print(f"CREATE TABLE {tn} AS {view};")
                if index or full_index:
                    colnames = [underscore(sn) for sn in sv.class_slots(cn)]
                    for colname in colnames:
                        print(f"CREATE INDEX {tn}_{colname} ON {tn}({colname});")
                    if full_index:
                        for combo in powerset(colnames):
                            if len(combo) > 1:
                                print(
                                    f"CREATE INDEX {tn}_{'_'.join(combo)} ON {tn}({','.join(combo)});"
                                )
            else:
                logging.info(f"No view for {cn}")


if __name__ == "__main__":
    main()
