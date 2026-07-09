import gzip
import os
import tempfile
import textwrap
import unittest
from unittest.mock import MagicMock, patch

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

    def test_download_uses_cdn_url_and_user_agent(self):
        """download_obo_sqlite should hit the vendor-neutral CDN with an explicit User-Agent.

        The CDN is fronted by Cloudflare, which returns HTTP 403 for a default
        ``Python-urllib`` User-Agent, so the request must set one explicitly.
        """
        response = MagicMock()
        response.content = gzip.compress(b"fake-db-bytes")
        response.raise_for_status = MagicMock()
        with tempfile.TemporaryDirectory() as tmpdir:
            destination = os.path.join(tmpdir, "bfo.db")
            with patch.object(
                builder.requests, "get", return_value=response
            ) as mock_get:
                builder.download_obo_sqlite("bfo", destination)
            self.assertEqual(1, mock_get.call_count)
            url = mock_get.call_args.args[0]
            self.assertEqual(
                f"{builder.SEMSQL_SQLITE_URL_BASE}/bfo.db.gz", url
            )
            self.assertNotIn("s3.amazonaws.com", url)
            self.assertEqual(
                "semsql",
                mock_get.call_args.kwargs["headers"]["User-Agent"],
            )
            with open(destination, "rb") as stream:
                self.assertEqual(b"fake-db-bytes", stream.read())

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
