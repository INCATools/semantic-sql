import click
from typing import List
from linkml_runtime.linkml_model import SchemaDefinition, ClassDefinitionName, SlotDefinitionName
from linkml.utils.formatutils import underscore
from linkml.utils.schemaloader import SchemaLoader
from semsql import get_viewdef

def all_slots(schema: SchemaDefinition, cn: ClassDefinitionName) -> List[SlotDefinitionName]:
    c = schema.classes[cn]
    slots = list(c.slots)
    if c.is_a:
        slots += all_slots(schema, c.is_a)
    if c.mixins:
        for m in c.mixins:
            slots += all_slots(schema, m)
    return slots

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
            schema = SchemaLoader(input).schema
            for cn, c in schema.classes.items():
                tn = underscore(cn)
                if name is None or str(cn) == name or tn == name:
                    view = get_viewdef(schema, c)
                    if view is not None:
                        print(f'DROP VIEW {tn};')
                        print(f'CREATE TABLE {tn} AS {view};')
                        if index:
                            for sn in all_slots(schema, cn):
                                colname = underscore(sn)
                                print(f'CREATE INDEX {tn}_{colname} ON {tn}({colname});')

if __name__ == '__main__':
    cli()
