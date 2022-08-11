# SemSQL: standard SQL views for RDF/OWL ontologies

[![PyPI version](https://badge.fury.io/py/semsql.svg)](https://badge.fury.io/py/semsql)
![](https://github.com/incatools/semantic-sql/workflows/Build/badge.svg)


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

There are two protocols for doing this:

1. install build dependencies
2. use Docker

In either case:

- The input MUST be in RDF/XML serialization and have the suffix `.owl`:
- use robot to convert if format is different

### 1. Build a SQLite database directly

Requirements:

- [rdftab.rs](https://github.com/ontodev/rdftab.rs)
- [relation-graph](https://github.com/balhoff/relation-graph)

After installing these and putting both in your path:

```bash
semsql make foo.db
```

This assumes `foo.owl` is in the same folder

### 2. Use Docker

There are two docker images that can be used:

- ODK
- [semantic-sql](https://hub.docker.com/repository/docker/linkml/semantic-sql)

The ODK image may lag behind

```bash
docker run  -v $PWD:/work -w /work -ti linkml/semantic-sql semsql make foo.db
```

## Schema

See [LinkML Schema Docs](https://incatools.github.io/semantic-sql/)

The source schema is in LinkML - this is then compiled down to SQL Tables and Views

## ORM Layer

A SemSQL relational database can be accessed in exactly the same way as any other SQLdb

For convenience, we provide a Python ORM layer using SQL Alchemy. This allows code like the following, which joins [RdfsSubclassOfStatement](https://incatools.github.io/semantic-sql/RdfsSubclassOfStatement) and [existential restrictions](https://incatools.github.io/semantic-sql/OwlSomeValuesFrom):

```python
engine = create_engine(f"sqlite:////path/to/go.db")
SessionClass = sessionmaker(bind=engine)
session = SessionClass()
q = session.query(RdfsSubclassOfStatement)
q = q.add_entity(OwlSomeValuesFrom)
q = q.join(OwlSomeValuesFrom, RdfsSubclassOfStatement.object == OwlSomeValuesFrom.id)

lines = []
for ax, ex in q.all():
    line = f'{ax.subject} subClassOf {ex.on_property} SOME {ex.filler}'
    logging.info(line)
    lines.append(line)
```    

(this example is just for illustration - to do the same thing there is a simpler Edge relation)

## Applications

The semsql python library is intentionally low level - we recommend using the [ontology-access-kit](https://github.com/INCATools/ontology-access-kit)

For example:

```bash
runoak -i db/envo.db search t~biome
```

You can also pass in an OWL file and have the sqlite be made on the fly

```bash
runoak -i sqlite:envo.owl search t~biome
```


