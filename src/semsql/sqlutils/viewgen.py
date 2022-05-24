import click
from linkml_runtime.linkml_model import SchemaDefinition, ClassDefinition
from linkml.utils.schemaloader import load_raw_schema, SchemaLoader
from linkml_runtime.utils.formatutils import underscore

VIEW_CODE = 'sqlview>>'

def get_viewdef(c: ClassDefinition) -> str:
    """
    Return all VIEW definitions for a class
    :param schema:
    :param c: class with potential views definitions
    :return: view SQL select clause
    """
    views = []
    for cmt in c.comments:
        cmt = cmt.strip().rstrip(';')
        if cmt.startswith(VIEW_CODE):
            views.append(cmt.replace(VIEW_CODE,'').strip())
    if len(views) > 0:
        return " UNION ".join(views)
    else:
        if c.union_of:
            return " UNION ".join([f'SELECT * FROM {uc}' for uc in c.union_of])
        return None

def generate_views_from_linkml(schema: SchemaDefinition, view=True, drop_tables=True) -> None:
    """
    Generates SQL VIEW statements from hints in LinkML linkml

    View hints are encoded in comments section in classes/tables section
    :param schema: LinkML linkml containing hints
    """
    for cn, c in schema.classes.items():
        viewdef = get_viewdef(schema, c)
        sql_table = underscore(cn)
        if viewdef is not None:
            print()
            if drop_tables:
                print(f'DROP TABLE {sql_table};')
            if view:
                print(f'CREATE VIEW {sql_table} AS {viewdef};')
            else:
                print(f'INSERT INTO {sql_table} AS {viewdef};')

@click.command()
@click.argument('inputs', nargs=-1)
@click.option('--view/--no-view', default=True)
def cli(inputs, view: bool):
    """
    Generates SQL VIEW commands from hints embedded in linkml
    """
    for input in inputs:
        with open(input, 'r') as stream:
            schema = load_raw_schema(input)
            print('-- ** REWRITE TABLES AS VIEWS **')
            print(f'-- SCHEMA: {schema.id}')
            loader = SchemaLoader(schema, mergeimports=True)
            loader.resolve()
            generate_views_from_linkml(schema, view)

if __name__ == '__main__':
    cli()
