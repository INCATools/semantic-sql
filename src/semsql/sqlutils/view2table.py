import click
from typing import List

from linkml_runtime import SchemaView
from linkml_runtime.linkml_model import SchemaDefinition, ClassDefinitionName, SlotDefinitionName
from linkml_runtime.utils.formatutils import underscore
from semsql.sqlutils.viewgen import get_viewdef




@click.command()
@click.argument('inputs', nargs=-1)
@click.option('--index/--no-index', default=True, help='Create indexes on each column')
@click.option('--name', '-n', help='Name of class/view to materialize. If blank, will perform for ALL')
def cli(inputs, name: str, index: bool):
    """
    Generates a command that turns a view into a table

    See https://github.com/cmungall/semantic-sql/issues/9

    Example usage:
    ```
    python -m semsql.sqlutils.view2table src/linkml/rdf.yaml -n rdfs_label_statement | sqlite3 db/pato.db
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

if __name__ == '__main__':
    cli()
