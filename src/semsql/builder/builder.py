import gzip
import logging
import os
import shutil
import subprocess
from pathlib import Path
from typing import Optional, TextIO

import requests
from linkml_runtime.loaders import yaml_loader
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from semsql.builder.registry import registry_schema
from semsql.builder.registry.registry_schema import (CompressionEnum, Makefile,
                                                     MakefileRule, Ontology)
from semsql.utils.makefile_utils import makefile_to_string

this_path = Path(__file__).parent


class DockerConfig:
    """
    Configuration for running ODK Docker image
    """

    odk_version: str = None  # not used yet
    memory: str = None


def make(
    target: str, docker_config: Optional[DockerConfig] = None, prefix_csv_path=None
):
    """
    Builds a target such as a SQLite file using the build.Makefile

    :param target: Make target
    :param docker_config: if passed, use ODK docker with the specific config
    :param prefix_csv_path:
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
    if prefix_csv_path:
        cmd += [f"PREFIX_CSV_PATH={prefix_csv_path}"]
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
        raise ValueError("Path must be an OWL file")


def download_obo_sqlite(ontology: str, destination: str):
    """
    Downloads pre-made SQLite file

    :param ontology:
    :param destination:
    :return:
    """
    db = f"{ontology}.db"
    url = f"https://s3.amazonaws.com/bbop-sqlite/{db}.gz"
    logging.info(f"Downloading from {url}")
    r = requests.get(url, allow_redirects=True, timeout=3600)
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
    session = sessionmaker(bind=engine)()
    return session


def compile_registry(registry_path: str, local_prefix_file: TextIO = None) -> str:
    """
    Generate makefile content from registry

    :param registry_path:
    :param local_prefix_file:
    :return:
    """
    registry: registry_schema.Registry
    registry = yaml_loader.load(registry_path, target_class=registry_schema.Registry)
    makefile = Makefile()
    onts = []
    generic = Ontology("%", has_imports=True, suppress=True)
    if local_prefix_file:
        local_prefix_file.write("prefix,base\n")
    for ont in list(registry.ontologies.values()) + [generic]:
        # download target
        if ont == generic:
            command = "curl -L -s http://purl.obolibrary.org/obo/$*.owl > $@.tmp"
        elif ont.zip_extract_file:
            command = (
                f"curl -L -s {ont.url} > $@.zip.tmp && "
                "unzip -p $@.zip.tmp {ont.zip_extract_file} "
                "> $@.tmp && rm $@.zip.tmp"
            )
        elif ont.compression:
            if str(ont.compression) == str(CompressionEnum.gzip.text):
                command = f"curl -L -s {ont.url} | gzip -dc > $@.tmp"
            else:
                raise ValueError(f"Unknown compression: '{ont.compression}'")
        else:
            command = f"curl -L -s {ont.url} > $@.tmp"
        download_rule = MakefileRule(
            target=f"download/{ont.id}.owl",
            dependencies=["STAMP"],
            commands=[
                command,
                "sha256sum -b $@.tmp > $@.sha256",
                "mv $@.tmp $@",
            ],
            precious=True,
        )
        makefile.rules.append(download_rule)
        # main build target
        target = f"db/{ont.id}.owl"
        dependencies = [f"download/{ont.id}.owl"]
        if ont.build_command:
            command = ont.build_command.format(ont=ont)
        elif ont.has_imports or (ont.format and ont.format != "rdfxml"):
            command = "robot merge -i $< -o $@"
        else:
            command = "cp $< $@"
        rule = MakefileRule(
            target=target, dependencies=dependencies, commands=[command]
        )
        makefile.rules.append(rule)
        if not ont.suppress:
            onts.append(ont.id)
        if local_prefix_file:
            for pn in ont.prefixmap.values():
                local_prefix_file.write(f"{pn.prefix},{pn.prefix_value}\n")
    mkfile = makefile_to_string(makefile)
    mkfile += f"EXTRA_ONTOLOGIES = {' '.join(onts)}"
    return mkfile
