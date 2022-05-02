import subprocess
from pathlib import Path

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import requests

this_path = Path(__file__).parent

def make(target: str):
    """
    Builds a target such as a SQLite file using the build.Makefile

    :param target: Make target
    """
    subprocess.run(['make', '-f', this_path / 'build.Makefile', target])

def db_from_owl(input: str) -> str:
    """
    Creates a db file from a OWL file

    :param input: path to OWL file
    :return: path to db file
    """
    if input.endswith('.owl'):
        db = input.replace('.owl', '.db')
        make(db)
        return db
    else:
        raise ValueError(f'Path must be an OWL file')

def download_obo_sqlite(ontology: str, destination: str):
    """
    Downloads pre-made SQLite file

    :param ontology:
    :param destination:
    :return:
    """
    url = f'https://s3.amazonaws.com/bbop-sqlite/{ontology}.db'
    r = requests.get(url, allow_redirects=True)
    open(destination, 'wb').write(r.content)

def connect(owl_file: str):
    """
    Generates a SQLite connection to an OWL file

    :param owl_file:
    :return:
    """
    db = db_from_owl(owl_file)
    engine = create_engine(f'sqlite:///{db}')
    Session = sessionmaker(bind=engine)
    session = Session()
    return session