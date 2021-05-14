import click
from linkml_model import SchemaDefinition
from linkml.utils.formatutils import underscore
from linkml.utils.schemaloader import load_raw_schema, SchemaLoader

@click.command()
@click.option('--limit', '-l', default=20)
@click.argument('inputs', nargs=-1)
def cli(inputs, limit: int):
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
            for cn, c in schema.classes.items():
                if c.mixin:
                    continue
                if len(c.slots) > 0:
                    sql_table = underscore(cn)
                    print(f'SELECT * FROM {sql_table} LIMIT {limit};')
                else:
                    print(f'-- No slots for {cn}')

if __name__ == '__main__':
    cli()