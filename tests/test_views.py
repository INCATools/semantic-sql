import unittest
import os

from linkml_runtime import SchemaView

from semsql.sqlutils.viewgen import generate_views_from_linkml

cwd = os.path.abspath(os.path.dirname(__file__))
SCHEMA_DIR = os.path.join(cwd, '../src/schema')
OUTPUT_DIR = os.path.join(cwd, 'outputs')


class ViewTestCase(unittest.TestCase):
    def test_views(self):
        path = os.path.join(SCHEMA_DIR, 'rdf.yaml')
        sv = SchemaView(path)
        s = sv.schema
        generate_views_from_linkml(s)

