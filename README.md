# SemSQL: standard SQL views for RDF/OWL ontologies

[![PyPI version](https://badge.fury.io/py/semsql.svg)](https://badge.fury.io/py/semsql)
![](https://github.com/incatools/semantic-sql/workflows/Build/badge.svg)


This project provides a standard collection of SQL tables/views for ontologies, such that you can make queries like this,
to find all terms starting with `Abnormality` in [HPO](https://obofoundry.org/ontology/hp).

```sql
$ sqlite db/hp.db
sqlite> SELECT * FROM rdfs_label_statement WHERE value LIKE 'Abnormality of %';
```

|stanza|subject|predicate|object|value|datatype|language|
|---|---|---|---|---|---|---|
|HP:0000002|HP:0000002|rdfs:label||Abnormality of body height|xsd:string||
|HP:0000014|HP:0000014|rdfs:label||Abnormality of the bladder|xsd:string||
|HP:0000022|HP:0000022|rdfs:label||Abnormality of male internal genitalia|xsd:string||
|HP:0000032|HP:0000032|rdfs:label||Abnormality of male external genitalia|xsd:string||


Ready-made SQLite3 builds can also be downloaded for any ontology in [OBO](http://obofoundry.org), using URLs such as https://s3.amazonaws.com/bbop-sqlite/hp.db

[relation-graph](https://github.com/balhoff/relation-graph/) is used to pre-generate tables of [entailed edges](https://incatools.github.io/semantic-sql/EntailedEdge/). For example,
all is-a and part-of ancestors of [finger](http://purl.obolibrary.org/obo/UBERON_0002389) in Uberon:

```sql
$ sqlite db/uberon.db
sqlite> SELECT * FROM entailed_edge WHERE subject='UBERON:0002389' and predicate IN ('rdfs:subClassOf', 'BFO:0000050');
```

|subject, predicate, object|
|---|
|UBERON:0002389, BFO:0000050, UBERON:0015212|
|UBERON:0002389, BFO:0000050, UBERON:5002389|
|UBERON:0002389, BFO:0000050, UBERON:5002544|
|UBERON:0002389, rdfs:subClassOf, UBERON:0000061|
|UBERON:0002389, rdfs:subClassOf, UBERON:0000465|
|UBERON:0002389, rdfs:subClassOf, UBERON:0000475|

SQLite provides many advantages

- files can be downloaded and subsequently queried without network latency
- compared to querying a static rdf, owl, or obo file, there is no startup/parse delay
- robust and performant
- excellent support in many languages

Although the focus is on SQLite, this library can also be used for other DBMSs like PostgreSQL, MySQL, Oracle, etc

## Tutorials

- SemSQL: [notebooks/SemanticSQL-Tutorial.ipynb](https://github.com/INCATools/semantic-sql/blob/main/notebooks/SemanticSQL-Tutorial.ipynb)
- Using OAK: [part 7 of OAK tutorial](https://incatools.github.io/ontology-access-kit/intro/tutorial07.html)

## Installation

SemSQL comes with a helper Python library. Use of this is optional. To install:

```bash
pip install semsql
```

## Download ready-made SQLite databases

Pre-generated SQLite database are created weekly for all OBO ontologies and a selection of others (see [ontologies.yaml](https://github.com/INCATools/semantic-sql/blob/main/src/semsql/builder/registry/ontologies.yaml))

To download:

```bash
semsql download obi -o obi.db
```

Or simply download using URL of the form:

- https://s3.amazonaws.com/bbop-sqlite/hp.db

## Attaching databases

If you are using sqlite3, then databases can be attached to facilitate cross-database joins.

For example, many ontologies use ORCID URIs as the object of `dcterms:contributor` and `dcterms:creator` statements, but these are left "dangling". Metadata about these orcids are available in the semsql orcid database instance (derived from [wikidata-orcid-ontology](https://github.com/cthoyt/wikidata-orcid-ontology)), in the [Orcid table](https://incatools.github.io/semantic-sql/Orcid).

You can use [ATTACH DATABASE](https://www.sqlite.org/lang_attach.html) to connect two databases, for example:

```sql
$ sqlite3 db/cl.dl
sqlite> attach 'db/orcid.db' as orcid_db;
sqlite> select * from contributor inner join orcid_db.orcid on (orcid.id=contributor.object) where orcid.label like 'Chris%';
obo:cl.owl|obo:cl.owl|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
CL:0010001|CL:0010001|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
CL:0010002|CL:0010002|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
CL:0010003|CL:0010003|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
CL:0010004|CL:0010004|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000093|UBERON:0000093|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000094|UBERON:0000094|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000095|UBERON:0000095|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000179|UBERON:0000179|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000201|UBERON:0000201|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000202|UBERON:0000202|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000203|UBERON:0000203|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
UBERON:0000204|UBERON:0000204|dcterms:contributor|orcid:0000-0002-6601-2165||||orcid:0000-0002-6601-2165|Christopher J. Mungall
```

## Creating a SQLite database from an OWL file

There are two protocols for doing this:

1. install build dependencies
2. use Docker

In either case:

- The input MUST be in RDF/XML serialization and have the suffix `.owl`:
- use robot to convert if format is different

We are planning to simplify this process in future.

### 1. Build a SQLite database directly

This requires some basic technical knowledge about how to install things on your machine
and how to put things in your PATH. It does not require Docker.

Requirements:

- [rdftab.rs](https://github.com/ontodev/rdftab.rs)
- [relation-graph](https://github.com/balhoff/relation-graph)

After installing these and putting both `relation-graph` and `rdftab.rs` in your path:

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

See [Schema Documentation](https://incatools.github.io/semantic-sql/)

The [source schema](https://github.com/INCATools/semantic-sql/tree/main/src/semsql/linkml) is in [LinkML](https://linkml.io) - this is then compiled down to SQL Tables and Views

The basic idea is as follows:

There are a small number of "base tables":

* [statements](https://incatools.github.io/semantic-sql/Statements/)
* [prefix](https://incatools.github.io/semantic-sql/Prefix/)
* [entailed_edge](https://incatools.github.io/semantic-sql/EntailedEdge/) - populated by relation-graph

All other tables are actually views (derived tables), and are provided for convenience.

## ORM Layer

A SemSQL relational database can be accessed in exactly the same way as any other SQLdb

For convenience, we provide a Python Object-Relational Mapping (ORM) layer using SQL Alchemy.
This allows for code uchlike the following, which joins [RdfsSubclassOfStatement](https://incatools.github.io/semantic-sql/RdfsSubclassOfStatement) and [existential restrictions](https://incatools.github.io/semantic-sql/OwlSomeValuesFrom):

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

Even if using OAK, it can be useful to access SQL tables directly to do complex multi-join queries in a performant way.

## Optimization

```bash
poetry run semsql view2table edge --full-index | sqlite3 $db/mydb.db
```

See [indexes](indexes) for some ready-made indexes
