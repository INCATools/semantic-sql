---
name: semantic-sql
description: Query OWL/RDF ontologies as SQLite using Semantic SQL (SemSQL, ssql). Use for ontology labels, synonyms, annotations, ancestor/descendant queries, relation closures, and cross-ontology SQL joins, or to obtain/build a SemSQL database.
---

# Query ontologies with Semantic SQL

Prefer an existing SemSQL database for exploration. Open it read-only and inspect
its schema before constructing queries; different builds may materialize
different views and inferred relationships.

## Select and inspect a database

The `sqlite3` CLI can query a prebuilt database without the SemSQL Python package.
If a database is needed, download the requested ontology to a new output path:

```bash
uvx --from semsql semsql download cl -o cl.db
```

In a SemSQL checkout, use `uv run semsql` instead. Downloading writes the database;
choose a path that preserves existing files. Prebuilt files are also available
at `https://semanticsql.berkeleybop.io/ONTOLOGY.db.gz`. Record the source and any
available version metadata; do not assume a local database is the latest release.
Installing this skill does not install `sqlite3`, SemSQL, or ontology databases.

Replace `ontology.db` below with the actual file:

```bash
sqlite3 -readonly ontology.db '.tables'
sqlite3 -readonly ontology.db '.schema statements'
sqlite3 -readonly ontology.db '.schema entailed_edge'
```

Core structures to inspect:

| Structure | Meaning |
| --- | --- |
| `statements` | RDF statements; resource targets in `object`, literals in `value` |
| `rdfs_label_statement` | Labels in `value`, identified by `subject` |
| `edge` | Normalized graph edges; inspect the view definition for the build |
| `entailed_edge` | Materialized inferred relationships, including relation closure |
| `prefix` | Prefix mappings used for CURIEs |

Do not use `object` to search literal labels, or treat blank-node expressions as
named ontology terms. Inspect datatype/language when literal distinctions matter.

## Resolve terms, then query relationships

Look up the exact term in this database before using its CURIE. For example:

```bash
sqlite3 -readonly -header -csv ontology.db \
  "SELECT subject, value FROM rdfs_label_statement
   WHERE lower(value) LIKE '%nucleus%' ORDER BY value, subject LIMIT 20;"
```

Disambiguate multiple matches using labels and definitions. Use database results
or an authoritative ontology lookup; never guess a CURIE from memory.

After replacing `ROOT_CURIE` with a verified identifier, descendants under
`rdfs:subClassOf` can be queried as follows:

```sql
SELECT DISTINCT e.subject AS id, label.value AS label
FROM entailed_edge AS e
LEFT JOIN rdfs_label_statement AS label ON label.subject = e.subject
WHERE e.predicate = 'rdfs:subClassOf'
  AND e.object = 'ROOT_CURIE'
  AND e.subject <> e.object
ORDER BY id;
```

For ancestors, constrain `e.subject` to the term and return `e.object`, joining
labels on `e.object`. Check self-edges and decide explicitly whether to include
the root. Always specify the predicate: subclass and part-of answer different
questions. Use asserted statement views when the question requires assertions;
do not describe `entailed_edge` results as asserted axioms.

Start with bounded samples and counts; inspect duplicates before exporting a
large result. Use parameterized SQL when writing Python queries. For
cross-database joins, attach read-only database URIs with explicit aliases and
verify compatible identifiers and versions. An absent row describes this
database's coverage, not necessarily absence from the ontology or biology.

## Build only when needed

For a custom ontology, `uvx --from semsql semsql make foo.db` expects `foo.owl`
in RDF/XML. Building needs external tools such as `rdftab.rs` and
`relation-graph`; consult the repository build instructions for the requested
pipeline, including ROBOT when conversion is needed. A skill or Python-package
installation does not provide those executables. Keep builds separate from
the source data and report missing dependencies rather than treating a partial
build as a valid database.

Deliver the SQL, database provenance, row counts, identifier/label results, and
whether relationships are asserted or inferred. See the
[SemSQL documentation](https://incatools.github.io/semantic-sql/) for view definitions.
