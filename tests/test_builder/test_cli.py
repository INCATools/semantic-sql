import os
import unittest
from shutil import copyfile

from click.testing import CliRunner

from semsql.builder.cli import main

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, "../inputs")
OUTPUT_DIR = os.path.join(cwd, "../outputs")
SRC_OWL = os.path.join(DB_DIR, "go-nucleus.owl")
SRC_DB = os.path.join(DB_DIR, "go-nucleus.db")
TEST_OWL = os.path.join(OUTPUT_DIR, "go-nucleus-in.owl")
TEST_DB = os.path.join(OUTPUT_DIR, "go-nucleus-in.db")


class TestCommandLineInterface(unittest.TestCase):
    def setUp(self) -> None:
        runner = CliRunner(mix_stderr=False)
        self.runner = runner

    def test_main_help(self):
        result = self.runner.invoke(main, ["--help"])
        out = result.stdout
        result.stderr
        self.assertIn("query", out)
        self.assertIn("make", out)
        self.assertIn("download", out)
        self.assertEqual(0, result.exit_code)
        self.assertEqual(0, self.runner.invoke(main, ["download", "--help"]).exit_code)
        self.assertEqual(0, self.runner.invoke(main, ["make", "--help"]).exit_code)
        self.assertEqual(0, self.runner.invoke(main, ["query", "--help"]).exit_code)
        self.assertEqual(
            0, self.runner.invoke(main, ["view2table", "--help"]).exit_code
        )

    def test_view2table(self):
        cases = [
            (["--no-index"], "CREATE TABLE deprecated_node AS SELECT"),
            (["edge", "--no-index"], "CREATE TABLE edge AS SELECT"),
            (["edge", "--index"], "CREATE INDEX edge_subject"),
            (["edge", "--full-index"], "CREATE INDEX edge_subject_predicate_object"),
            (["edge", "rdfs_label_statement"], "CREATE TABLE rdfs_label_statement"),
        ]
        for args, expected in cases:
            result = self.runner.invoke(main, ["view2table"] + args)
            self.assertIn(expected, result.stdout)
            self.assertEqual(0, result.exit_code)

    @unittest.skip("Requires Docker or installing dependencies")
    def test_make_db(self):
        copyfile(SRC_OWL, TEST_OWL)
        result = self.runner.invoke(main, ["make", TEST_DB])
        result.stdout
        result.stderr
        self.assertEqual(0, result.exit_code)

    @unittest.skip("Requires Docker or installing dependencies")
    def test_query(self):
        result = self.runner.invoke(
            main, ["query", "-i", SRC_OWL, "SELECT * FROM rdfs_label_statement"]
        )
        out = result.stdout
        result.stderr
        self.assertIn("nucleus", out)
        self.assertEqual(0, result.exit_code)
