import logging
import os
import subprocess
from dataclasses import field
from pathlib import Path
from typing import Optional

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import requests

this_path = Path(__file__).parent


class DockerConfig:
    """
    Configuration for running ODK Docker image
    """
    odk_version: str = None  ## not used yet
    memory: str = None


def make(target: str, docker_config: Optional[DockerConfig] = None):
    """
    Builds a target such as a SQLite file using the build.Makefile

    :param target: Make target
    :param docker_config: if passed, use ODK docker with the specific config
    """
    path_to_makefile = str(this_path / 'build.Makefile')
    if docker_config is not None:
        mem = docker_config.memory
        if mem is None:
            mem = '4g'
        pwd = os.getcwd()
        pre = ['docker', 'run',
               '-m', mem,
               '-v', f'{pwd}/:/work',
               '-v', f'{this_path}/:/builder',
               '-w', '/work',
               '--rm', '-ti', 'obolibrary/odkfull']
        path_to_makefile = '/builder/build.Makefile'
    else:
        pre = []
    cmd = pre + ['make', target, '-f', path_to_makefile]
    logging.info(f'CMD={cmd}')
    subprocess.run(cmd)


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
