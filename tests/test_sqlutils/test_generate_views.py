import unittest
import os
from pathlib import Path

from linkml_runtime import SchemaView

from semsql.sqlutils.viewgen import generate_views_from_linkml

cwd = os.path.abspath(os.path.dirname(__file__))
SCHEMA_DIR = os.path.join(cwd, '../../src/semsql/linkml')
OUTPUT_DIR = os.path.join(cwd, '../outputs')
DDL_OUT = Path(OUTPUT_DIR) / 'test.sql'


class ViewTestCase(unittest.TestCase):
    def test_create_views(self):
        """
        tests generation of SQL VIEWs from LinkML linkml
        """
        path = os.path.join(SCHEMA_DIR, 'rdf.yaml')
        sv = SchemaView(path)
        s = sv.schema
        # TODO: change this so it returns a string, and check content
        with open(DDL_OUT, 'w') as stream:
            generate_views_from_linkml(s, output=stream)
        stream.close()
        with open(DDL_OUT) as stream:
            lines = stream.readlines()
            out = ''.join(lines)
            self.assertIn("CREATE VIEW rdfs_subclass_of_statement AS SELECT * FROM statements WHERE predicate='rdfs:subClassOf'",
                          out)
            self.assertIn("CREATE VIEW rdf_type_statement AS SELECT * FROM statements WHERE predicate='rdf:type'",
                          out)

