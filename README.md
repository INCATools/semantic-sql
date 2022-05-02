# SemSQL: standard SQL views for RDF/OWL ontologies

This project provides a standard collection of SQL tables/views for ontologies, such that you can make queries like:

```sql
SELECT * FROM rdfs_label_statement WHERE value LIKE 'Abnormality of %';
```

Ready-made ontologies can also be downloaded for any ontology in [OBO](http://obofoundry.org)

## Installation

```bash
pip install semsql
```

## Download ready-made SQLite databases

```bash
semsql download obi -o obi.db
```

Or simply download using URL of the form:

- https://s3.amazonaws.com/bbop-sqlite/hp.db

## Creating a SQLite database from an OWL file

Requirements; EITHER:

- [rdftab.rs](https://github.com/ontodev/rdftab.rs)
- [relation-graph](https://github.com/balhoff/relation-graph)

OR use the ODK docker image

The input MUST be in RDF/XML serialization and have the suffix `.owl`:

```bash
semsql make foo.db
```

foo.db must be in the same directory

## Schema

See [LinkML Schema Docs](https://incatools.github.io/semantic-sql/)

The source schema is in LinkML - this is then compiled down to SQL Tables and Views

## Applications

The semsql python library is intentionally low level - we recommend using the [ontology-access-kit](https://github.com/INCATools/ontology-access-kit)

For example:

```bash
runoak -i db/envo.db search t~biome
```

