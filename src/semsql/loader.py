import click
import os
import logging
import subprocess
from typing import List
from sqlalchemy.sql import text
from sqlalchemy import create_engine

def get_sqlite_path(url: str) -> str:
    if url.startswith('sqlite:///'):
        return url.replace('sqlite:///', '')
    elif ':' in url:
        raise Exception('Only sqlite supported')
    else:
        return url

def load_ddl(con, path: str):
    with open(path, 'r') as stream:
        statement = text("\n".join(stream.readlines()))
        print(f's={statement}')
        con.execute(statement)

def create_and_load(inputs: List[str], create: bool, url: str) -> None:
    db = get_sqlite_path(url)
    if create:
        subprocess.run(['cat', 'prefixes/prefix.sql | sqlite3', db])
        engine = create_engine(url)
        with engine.connect() as con:
            load_ddl(con, 'prefixes/prefix.sql')
            load_rdftab(con, 'sql/rdftab.sql')
            load_rdftab(con, 'sql_schema/semsql.sql')
    for input in inputs:
        results = subprocess.run(['./bin/rdftab', db, input])

@click.command()
@click.option('--url', '-u', help='SQL alchemy URL for db (MUST BE SQLITE)')
@click.option('--db', '-d', help='Path to sqlite db')
@click.option('--create/--no-create', default=True, help='set if db is to be created')
@click.argument('inputs', nargs=-1)
def cli(inputs: List[str], create: bool, db: str, url: str):
    """
    Load from OWL
    """
    if db is not None:
        url = f'sqlite:///{db}'
    if url is None:
        logging.error('Must pass --db or --url')
    create_and_load(inputs, create, url)


if __name__ == '__main__':
    cli()
