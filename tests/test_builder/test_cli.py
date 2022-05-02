import logging
import os
import unittest
from shutil import copyfile

from click.testing import CliRunner
from semsql.builder.cli import main

cwd = os.path.abspath(os.path.dirname(__file__))
DB_DIR = os.path.join(cwd, '../inputs')
OUTPUT_DIR = os.path.join(cwd, '../outputs')
SRC_OWL = os.path.join(DB_DIR, 'go-nucleus.owl')
SRC_DB = os.path.join(DB_DIR, 'go-nucleus.db')
TEST_OWL = os.path.join(OUTPUT_DIR, 'go-nucleus-in.owl')
TEST_DB = os.path.join(OUTPUT_DIR, 'go-nucleus-in.db')


class TestCommandLineInterface(unittest.TestCase):

    def setUp(self) -> None:
        runner = CliRunner(mix_stderr=False)
        self.runner = runner

    def test_main_help(self):
        result = self.runner.invoke(main, ['--help'])
        out = result.stdout
        err = result.stderr
        self.assertIn('query', out)
        self.assertIn('make', out)
        self.assertIn('download', out)
        self.assertEqual(0, result.exit_code)

    @unittest.skip('Requires Docker or installing dependencies')
    def test_make_db(self):
        copyfile(SRC_OWL, TEST_OWL)
        result = self.runner.invoke(main, ['make', TEST_DB])
        out = result.stdout
        err = result.stderr
        self.assertEqual(0, result.exit_code)

    @unittest.skip('Requires Docker or installing dependencies')
    def test_query(self):
        result = self.runner.invoke(main, ['query', '-i', SRC_OWL,
                                           'SELECT * FROM rdfs_label_statement'])
        out = result.stdout
        err = result.stderr
        self.assertIn('nucleus', out)
        self.assertEqual(0, result.exit_code)

