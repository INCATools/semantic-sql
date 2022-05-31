import click
from linkml_runtime import SchemaView
from linkml_runtime.utils.formatutils import underscore


@click.command()
@click.option('--limit', '-l', default=20)
@click.argument('inputs', nargs=-1)
def cli(inputs, limit: int):
    """
    Generates report queries
    """
    for input in inputs:
        sv = SchemaView(input)
        sv.merge_imports()
        schema = sv.schema
        print('-- ** REPORTS **')
        print(f'-- SCHEMA: {schema.id}')
        for cn, c in sv.all_classes().items():
            if c.mixin:
                continue
            if c.abstract:
                continue
            slots = sv.class_induced_slots(cn)
            if len(slots) > 0:
                sql_table = underscore(cn)
                print(f'SELECT * FROM {sql_table} LIMIT {limit};')
            else:
                print(f'-- No slots for {cn}')


if __name__ == '__main__':
    cli()
