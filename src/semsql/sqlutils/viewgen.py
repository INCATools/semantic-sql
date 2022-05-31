import sys
from typing import TextIO

import click
from linkml_runtime import SchemaView
from linkml_runtime.linkml_model import SchemaDefinition, ClassDefinition
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
        elif c.classification_rules:
            rule = c.classification_rules[0]
            if len(c.classification_rules) > 1:
                raise ValueError(f'Max 1 classification rule in {c}')
            if rule.is_a is None:
                raise NotImplementedError(f'Expected exactly one is-a')
            where = []
            for sn, slot in rule.slot_conditions.items():
                v = slot.equals_string
                where.append(f"{sn}='{v}'")
            if len(where) == 0:
                raise ValueError(f'no WHERE in {rule.slot_conditions}')
            v = f'SELECT * FROM {rule.is_a} WHERE {" AND ".join(where)}'
            return v
        else:
            return None

def generate_views_from_linkml(schema: SchemaDefinition, view=True, drop_tables=True,
                               output: TextIO = sys.stdout) -> None:
    """
    Generates SQL VIEW statements from hints in LinkML linkml

    View hints are encoded in comments section in classes/tables section
    :param schema: LinkML linkml containing hints
    """
    for cn, c in schema.classes.items():
        viewdef = get_viewdef(c)
        sql_table = underscore(cn)
        if viewdef is not None:
            output.write("\n")
            if drop_tables:
                output.write(f'DROP TABLE {sql_table};\n')
            if view:
                output.write(f'CREATE VIEW {sql_table} AS {viewdef};\n')
            else:
                output.write(f'INSERT INTO {sql_table} AS {viewdef};\n')

@click.command()
@click.argument('inputs', nargs=-1)
@click.option('--view/--no-view', default=True)
@click.option('--mergeimports/--no-mergeimports', default=True)
def cli(inputs, mergeimports: bool, view: bool):
    """
    Generates SQL VIEW commands from LinkML schema
    """
    for input in inputs:
        sv = SchemaView(input)
        if mergeimports:
            sv.merge_imports()
        generate_views_from_linkml(sv.schema, view=view)


if __name__ == '__main__':
    cli()
