import os
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
