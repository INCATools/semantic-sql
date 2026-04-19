import os
import tempfile
import textwrap
import unittest

from semsql.builder import builder
from semsql.builder.registry import path_to_ontology_registry

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, "../inputs")
OUTPUT_DIR = os.path.join(cwd, "../outputs")
SRC_OWL = os.path.join(DB_DIR, "go-nucleus.owl")
SRC_DB = os.path.join(DB_DIR, "go-nucleus.db")
TEST_OWL = os.path.join(OUTPUT_DIR, "go-nucleus-in.owl")
TEST_DB = os.path.join(OUTPUT_DIR, "go-nucleus-in.db")


class TestBuilder(unittest.TestCase):
    def setUp(self) -> None:
        self.registry = str(path_to_ontology_registry())

    def test_builder(self):
        mkfile = builder.compile_registry(self.registry)
        print(mkfile)

    def test_get_postprocessing_steps(self):
        registry_text = textwrap.dedent(
            """
            id: test-registry
            license: CC0
            ontologies:
              reactome-mm:
                url: https://example.org/reactome-mm.owl
                post_processing_steps:
                  - "sqlite3 {db} < views/reactome.sql"
                  - "echo {ont}"
            """
        ).strip()
        with tempfile.TemporaryDirectory() as tmpdir:
            registry_path = os.path.join(tmpdir, "registry.yaml")
            with open(registry_path, "w") as stream:
                stream.write(registry_text)
            steps = builder.get_postprocessing_steps(
                "reactome-mm",
                "db/reactome-mm.db",
                registry_path=registry_path,
            )
            self.assertEqual(
                [
                    "sqlite3 db/reactome-mm.db < views/reactome.sql",
                    "echo reactome-mm",
                ],
                steps,
            )

    def test_get_postprocessing_steps_missing_ontology(self):
        registry_text = textwrap.dedent(
            """
            id: test-registry
            license: CC0
            ontologies:
              cmso:
                url: https://example.org/cmso.owl
            """
        ).strip()
        with tempfile.TemporaryDirectory() as tmpdir:
            registry_path = os.path.join(tmpdir, "registry.yaml")
            with open(registry_path, "w") as stream:
                stream.write(registry_text)
            steps = builder.get_postprocessing_steps(
                "asmo",
                "db/asmo.db",
                registry_path=registry_path,
            )
            self.assertEqual([], steps)
