# Consumers of the old `s3.amazonaws.com/bbop-sqlite` URL

Inventory of everything found that still points at the raw S3 bucket instead of the
vendor-neutral CDN (`https://semanticsql.berkeleybop.io`) introduced in
[#110](https://github.com/INCATools/semantic-sql/issues/110).
Companion to [#115](https://github.com/INCATools/semantic-sql/issues/115) (migration tracking)
and [#112](https://github.com/INCATools/semantic-sql/issues/112) (raw-bucket lockdown).

**Survey date: 2026-08-18.**

## Method

- GitHub code search across all indexed default branches for `bbop-sqlite` (79 files) and for the
  literal `s3.amazonaws.com/bbop-sqlite` (44 files). Hyphen tokenization makes search alone
  unreliable, so **every entry below was re-verified by fetching current default-branch content**.
- Released artifacts checked by unpacking the distributions: `semsql` (PyPI), `oaklib` (PyPI),
  `ontoProc` (Bioconductor).
- Web search plus direct fetches of documentation sites for non-repository mentions.
- Live probes of both hosts (headers/CORS).

Not covered: bucket access logs (the only way to see users with no public repo), non-GitHub forges,
and private notebooks. Public code-search mirrors (grep.app) and non-Google engines were unreachable
from this environment, so GitHub's own index is the ceiling on repo coverage here.

## A. Runtime code with the raw URL hardcoded

These do not migrate via an oaklib/ODK bump; each needs a one-line repoint.

| Project | Location | Note |
|---|---|---|
| monarch-initiative/monarch-ingest | `src/monarch_ingest/download.yaml:28` | `phenio.db.gz` |
| Knowledge-Graph-Hub/kg-alzheimers | `src/kg_alzheimers/download.yaml:186,255` | one uncompressed `.db` |
| monarch-initiative/dictybase-ingest | `download.yaml:10`, `src/versions.py:26` | `versions.py` *filters* on the literal string `bbop-sqlite`, so a URL-only fix silently breaks version tracking |
| Knowledge-Graph-Hub/universalizer | `universalizer/oak_utils.py:48` | fetches uncompressed `.db` |
| microbiomedata/ontology-loader | `src/ontology_loader/ontology_processor.py:100` | also covers microbiomedata/nmdc-runtime, which calls this library |
| ccb-hms/NHANES-metadata | `code/generate_ontology_tables.py:30` | |
| waldronlab/bioanalyzer-backend | `app/normalization/grounding/seed.py:57` | single `SEMANTIC_SQL_BASE_URL` constant |
| seandavi/metacurator | `src/metacurator/grounding/local_duckdb.py:26` | single base-URL constant |
| seandavi/cdsci-lake | `src/cdsci/lake/config.py:141`, `sources/ontology/ingest.py` | also a listing dependent (see B) |
| CultureBotAI/MediaIngredientMech | `scripts/check_chebi_currency.py:53` | |
| biobricks-ai/semsql | `stages/01_download.sh:33,41`, `.bb/source.jsonld` | also a listing dependent (see B) |
| microbiomedata/external-metadata-awareness | `notebooks/environmental_context_value_sets/generate_voting_sheet.ipynb`, `notebooks/multi-lexmatch/interleave_s3_catalog_yaml_registry_bioportal_obo.ipynb` | second notebook uses the ListBucket XML API |
| Knowledge-Graph-Hub/kg-registry | `resource/reactome/reactome.md:51`, `resource/reactome/reactome.data.human.md:11` | `product_url:` — machine-consumable registry metadata pointing downstream users at the raw bucket |
| kltm/obo-sql-js-demo | `db.html:298,331` | **not previously listed**; browser XHR straight at the bucket |

Browser clients are safe to move: the CDN answers with `access-control-allow-origin: *` and
`access-control-allow-methods: GET`, while the raw bucket returns no CORS headers at all.

## B. Bucket *listing* dependents

A URL swap alone does not migrate these — they enumerate the bucket rather than fetching known keys:

- seandavi/cdsci-lake — paginated `ListObjectsV2` as its registry
- biobricks-ai/semsql — `stages/00_invalidate.sh` (`s3_bucket="bbop-sqlite"`, anonymous `aws s3 ls`)
- microbiomedata/external-metadata-awareness — ListBucket XML notebook
- vjcitn/ontoProc2 and vjcitn/op2workshop — `aws s3 ls s3://bbop-sqlite/` in READMEs

These need a decision in #112: either keep a listing route open through the CDN or publish a manifest.

## C. Verified already migrated

- Knowledge-Graph-Hub/kg-microbe — runtime on the CDN; remaining hits are explanatory comments
- vjcitn/ontoProc2 — `R/semsql_url.R` returns `https://semanticsql.berkeleybop.io/%s.db.gz`
- monarch-initiative/dismech — `scripts/fetch_ontology_dbs.sh:36` `BASE_URL="https://semanticsql.berkeleybop.io"`; CI files mention the bucket only in comments
- oaklib ≥ 0.7.2 (checked 0.7.4 sdist) — defaults to the CDN, overridable via `OAKLIB_SEMSQL_SQLITE_URL_BASE`

## D. Released packages

- **semsql 0.4.0 on PyPI (2025-02-05) still ships the old URL**: `src/semsql/builder/builder.py:96`,
  plus README/PKG-INFO examples. Every `pip install semsql` user is still on raw S3 — this is the
  blocker tracked in #114.
- **Bioconductor `ontoProc` 2.6.0: clean** — no `bbop-sqlite` reference anywhere in the released
  source. Only the GitHub-only `ontoProc2` ever used it, and it is migrated.

## E. Documentation, examples and logs

Prose only — no runtime impact, but they keep teaching the old URL:

- cthoyt/pystow — `src/pystow/api.py:1990`, `src/pystow/impl.py` docstrings (`ensure_from_s3` examples)
- berkeleybop/metpo (3 docs), turbomam/metpo-attic (4 docs, incl. a copy-pasteable `curl`)
- brad-usredoxlabs/computable-lab, monarch-initiative/dismech docs, waldronlab/bioanalyzer-backend
  `docs/GROUNDING_ARCHITECTURE.md` provenance table
- monarch-initiative/rare-disease-identification (docstring), monarch-initiative/mondo
  (notebook output cells), monarch-initiative/ontogpt-experiments (committed stdout),
  ai4curation/agent-watcher (captured traces), geneontology/operations (ops runbooks)
- This repo: `README.md:27` (deprecation note), `notebooks/SemanticSQL-Tutorial.ipynb` (2022 `wget`
  output inside a saved cell). `Makefile` `s3://bbop-sqlite` targets are the publishing side and stay.

## F. Non-repository channels

- **monarch-initiative.github.io/monarch-documentation/Repositories/semantic-sql/** still advertises
  `https://s3.amazonaws.com/bbop-sqlite/hp.db.gz` and never mentions the CDN (fetched 2026-08-18).
- **PyPI project page for semsql** renders the 0.4.0 README with the old URL; fixed by a release (#114).
- **Search engines and LLM assistants** still answer "how do I download a semsql db" with the S3
  URL, sourced from these stale READMEs. New users keep arriving at the old host regardless of repo
  fixes, so a release plus a docs refresh matters more than any single repo PR.

## G. Hits that could not be verified

- monarch-initiative/kg-dashboard-phil (`semsimian-precompute/precompute.py`,
  `dashboard/public/index.html`) and cmungall/mondo-eval-2026
  (`src/scripts/oak-question-notebook.ipynb`) — indexed by code search but the content is no longer
  publicly fetchable (private or renamed). Both are **not listed in #115**; the dashboard
  `index.html` hit suggests a second browser-side consumer.
