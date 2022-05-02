import logging

import click
import logging
import semsql.builder.builder as builder
from sqlalchemy import text


@click.group()
@click.option("-v", "--verbose", count=True)
@click.option("-q", "--quiet")
def main(verbose: int, quiet: bool):
    """Run the SSSOM CLI."""
    if verbose >= 2:
        logging.basicConfig(level=logging.DEBUG)
    elif verbose == 1:
        logging.basicConfig(level=logging.INFO)
    else:
        logging.basicConfig(level=logging.WARNING)
    if quiet:
        logging.basicConfig(level=logging.ERROR)


@main.command()
@click.argument('path')
def make(path):
    """
    Makes a specified target, such as a db file

    Example:

        semsql make envo.db

    (assumes envo.owl is in the same folder)
    """
    builder.make(path)


@main.command()
@click.option('-o', '--output')
@click.argument('ontology')
def download(ontology, output):
    """
    Download a read-made SQLite db for an OBO ontology

    Example:

        semsql download cl -o cl.db
    """
    builder.download_obo_sqlite(ontology, destination=output)


@main.command()
@click.option('-i', '--input')
@click.argument('query')
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



if __name__ == '__main__':
    main()
