import click
from linkml_model import SchemaDefinition
from linkml.utils.formatutils import underscore
from linkml.utils.schemaloader import load_raw_schema, SchemaLoader

VIEW_CODE = 'sqlview>>'

def generate_views_from_linkml(schema: SchemaDefinition, view=True, drop_tables=True) -> None:
    """
    Generates SQL VIEW statements from hints in LinkML schema

    View hints are encoded in comments section in classes/tables section
    :param schema: LinkML schema containing hints
    """
    for cn, c in schema.classes.items():
        sql_table = underscore(cn)
        views = []
        for cmt in c.comments:
            cmt = cmt.strip().rstrip(';')
            if cmt.startswith(VIEW_CODE):
                views.append(cmt.replace(VIEW_CODE,'').strip())
        if len(views) > 0:
            print()
            if drop_tables:
                print(f'DROP TABLE {sql_table};')
            if view:
                print(f'CREATE VIEW {sql_table} AS {"UNION".join(views)};')
            else:
                print(f'INSERT INTO {sql_table} AS {"UNION".join(views)};')

@click.command()
@click.argument('inputs', nargs=-1)
@click.option('--view/--no-view', default=True)
def cli(inputs, view: bool):
    """
    Generates SQL VIEW commands from hints embedded in linkml schema
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
