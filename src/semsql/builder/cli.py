import logging

import click
import logging
import semsql.builder.builder as builder
from linkml_runtime import SchemaView
from linkml_runtime.utils.formatutils import underscore
from semsql.sqlutils.viewgen import get_viewdef
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


@main.command()
@click.argument('inputs', nargs=-1)
@click.option('--index/--no-index', default=True, help='Create indexes on each column')
@click.option('--name', '-n', help='Name of class/view to materialize. If blank, will perform for ALL')
def view2table(inputs, name: str, index: bool):
    """
    Generates a command that turns a view into a table

    See https://github.com/cmungall/semantic-sql/issues/9

    Example usage:
    ```
    semsql view2table src/linkml/rdf.yaml -n rdfs_label_statement | sqlite3 db/pato.db
    ```
    """
    for input in inputs:
        with open(input, 'r') as stream:
            sv = SchemaView(input)
            schema = sv.schema
            for cn, c in sv.all_classes().items():
                tn = underscore(cn)
                if name is None or str(cn) == name or tn == name:
                    view = get_viewdef(c)
                    if view is not None:
                        print(f'DROP VIEW {tn};')
                        print(f'CREATE TABLE {tn} AS {view};')
                        if index:
                            for sn in sv.class_slots(cn):
                                colname = underscore(sn)
                                print(f'CREATE INDEX {tn}_{colname} ON {tn}({colname});')
                    else:
                        logging.error(f'No view for {cn}')



if __name__ == '__main__':
    main()
