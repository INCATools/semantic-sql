import gzip
import logging
import os
import shutil
import subprocess
from pathlib import Path
from typing import Optional

import requests
from linkml_runtime.loaders import yaml_loader
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from semsql.builder.registry import registry_schema

this_path = Path(__file__).parent


class DockerConfig:
    """
    Configuration for running ODK Docker image
    """
    odk_version: str = None  # not used yet
    memory: str = None


def make(target: str, docker_config: Optional[DockerConfig] = None):
    """
    Builds a target such as a SQLite file using the build.Makefile

    :param target: Make target
    :param docker_config: if passed, use ODK docker with the specific config
    """
    path_to_makefile = str(this_path / "build.Makefile")
    if docker_config is not None:
        mem = docker_config.memory
        if mem is None:
            mem = "4g"
        pwd = os.getcwd()
        pre = [
            "docker",
            "run",
            "-m",
            mem,
            "-v",
            f"{pwd}/:/work",
            "-v",
            f"{this_path}/:/builder",
            "-w",
            "/work",
            "--rm",
            "-ti",
            "obolibrary/odkfull",
        ]
        path_to_makefile = "/builder/build.Makefile"
    else:
        pre = []
    cmd = pre + ["make", target, "-f", path_to_makefile]
    logging.info(f"CMD={cmd}")
    subprocess.run(cmd)


def db_from_owl(input: str) -> str:
    """
    Creates a db file from a OWL file

    :param input: path to OWL file
    :return: path to db file
    """
    if input.endswith(".owl"):
        db = input.replace(".owl", ".db")
        make(db)
        return db
    else:
        raise ValueError(f"Path must be an OWL file")


def download_obo_sqlite(ontology: str, destination: str):
    """
    Downloads pre-made SQLite file

    :param ontology:
    :param destination:
    :return:
    """
    db = f"{ontology}.db"
    url = f"https://s3.amazonaws.com/bbop-sqlite/{db}.gz"
    r = requests.get(url, allow_redirects=True)
    destination_gzip = f"{destination}.gz"
    open(destination_gzip, "wb").write(r.content)
    with gzip.open(destination_gzip, "rb") as f_in:
        with open(destination, "wb") as f_out:
            shutil.copyfileobj(f_in, f_out)
            os.remove(destination_gzip)


def connect(owl_file: str):
    """
    Generates a SQLite connection to an OWL file

    :param owl_file:
    :return:
    """
    db = db_from_owl(owl_file)
    engine = create_engine(f"sqlite:///{db}")
    Session = sessionmaker(bind=engine)
    session = Session()
    return session

def compile_registry(registry_path: str) -> str:
    """
    Generate makefile content from registry

    :param registry_path:
    :return:
    """
    registry: registry_schema.Registry
    registry = yaml_loader.load(registry_path, target_class=registry_schema.Registry)
    mkfile = ""
    onts = []
    for ont in registry.ontologies.values():
        target = f"db/{ont.id}.owl"
        dependencies = ["STAMP"]
        if ont.has_imports or (ont.format and ont.format != 'rdfxml'):
            command = f"robot merge -I {ont.url} -o $@"
        else:
            command = f"curl -L -s {ont.url} > $@.tmp && mv $@.tmp $@"
        dependencies_str = " ".join(dependencies)
        mkfile += f"{target}: {dependencies_str}\n\t{command}\n\n"
        onts.append(ont.id)
    mkfile += f"EXTRA_ONTOLOGIES = {' '.join(onts)}"
    return mkfile
