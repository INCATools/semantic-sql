import itertools

import click
from linkml_runtime import SchemaView
from linkml_runtime.utils.formatutils import underscore

from semsql.sqlutils.viewgen import get_viewdef

# DEPRECATED

@click.command()
@click.argument("inputs", nargs=-1)
@click.option("--index/--no-index", default=True, help="Create indexes on each column")
@click.option(
    "--name",
    "-n",
    help="Name of class/view to materialize. If blank, will perform for ALL",
)
def cli(inputs, name: str, index: bool, combinatorial: bool=False):
    """
    Generates a command that turns a view into a table

    See https://github.com/cmungall/semantic-sql/issues/9

    Example usage:
    ```
    view2table src/linkml/rdf.yaml -n rdfs_label_statement | sqlite3 db/pato.db
    ```
    """
    for input in inputs:
        sv = SchemaView(input)
        for cn, c in sv.all_classes().items():
            tn = underscore(cn)
            if name is None or str(cn) == name or tn == name:
                view = get_viewdef(c)
                if view is not None:
                    print(f"DROP VIEW {tn};")
                    print(f"CREATE TABLE {tn} AS {view};")
                    if index and not combinatorial:
                        for sn in sv.class_slots(cn):
                            colname = underscore(sn)
                            print(f"CREATE INDEX {tn}_{colname} ON {tn}({colname});")
                    if combinatorial:
                        if not index:
                            raise ValueError("Cannot use combinatorial without index")
                        s = sv.class_slots(cn)
                        powerset = itertools.chain.from_iterable(
                            itertools.combinations(s, r) for r in range(len(s) + 1))
                        for sns in powerset:
                            colnames = [underscore(sn) for sn in sns]
                            colnames_str = '_'.join(colnames)
                            colnames_commasep = ','.join(colnames)
                            print(f"CREATE INDEX {tn}_{colnames_str} ON {tn}({colnames_commasep});")


if __name__ == "__main__":
    cli()
