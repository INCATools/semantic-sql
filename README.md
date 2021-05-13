# semantic-sql

This is an experimental repo that provides useful tools for working
with RDF, OWL, and ontologies using SQL databases, as a performant and
composable alternative to SPARQL.

Currently only sqlite is supported, but this would be easy to adapt to postgres

It leverages [rdftab.rs](https://github.com/ontodev/rdftab.rs) but can be used independently.

The only dependency is that RDF/OWL is loaded into a sqlite db
following the [rdftab schema](sql/rdftab.sql). This can be done easily
in a performant manner using the rdftab.rs command line tool.

The basic idea is:

 * provide SQL Views for common constructs, avoiding low-level RDF operations
 * allow OWL and ontologies to be trivially used in combination with large data tables or existing relational databases

## Requirements

 * [rdftab](https://github.com/ontodev/rdftab.rs)
 * sqlite

After building `rdftab`, place it in the bin directory

Note this repo includes additional python code for auxhiliary functions, but this is not required for main usage

## Demos

this repo is an early draft for discussion.

Currently there are a few "demos" to give the basic idea. In future these could be factored into different repos

 1. [ROBOT report](http://robot.obolibrary.org/report) functionality
 2. Translation of OWL to a "relation graph" for simpler querying of graph structure of ontologies like GO, Uberon
 3. Loading of large ontology annotations (GAFs, GPADs, id mapping files) for performant querying and validation ("GO Rules")
 4. Abstraction over ABoxes (GO-CAMs)

## Running

This example is for PATO but any ontology can be used

 0. install sqlite3
 1. Build rdftab.rs and copy to bin/ directory
 2. place an OWL file in the owl/ folder.
     E.g. `curl -L -s http://purl.obolibrary.org/obo/pato.owl > owl/pato.owl`
 3. Run `make target/pato.views` 
 4. Explore: `sqlite3 db/pato.db`

Example:

```bash
$ make target/pato.views
sqlite3 db/pato.db -cmd "SELECT * FROM problems"
```

generates:

PROBLEM|NODE|VALUE
---|---|---
node_with_two_labels_problems|BFO:0000050|part of
node_with_two_labels_problems|obo:RO_0002604|is opposite of
node_with_two_labels_problems|obo:RO_0002604|is_opposite_of
shared_label_problems|BFO:0000019|quality
shared_label_problems|obo:PATO_0000001|quality
shared_label_problems|obo:GO_0003824|catalytic activity
shared_label_problems|obo:PATO_0001414|catalytic activity

The `problem` view is actually a UNION view over multiple individual QC checks implemented as selects.

## Relation Graphs

We use `relation-graph` to materialize inferred edges such as `fingernail part-of body`, these are loaded into an `entailed_edge` table

## Querying multiple dbs

```bash
$ sqlite3 db/go.db
SQLite version 3.28.0 2019-04-15 14:49:49
Enter ".help" for usage hints.
sqlite> attach 'db/cl.db' as cl;
sqlite> .databases
main: /Users/cjm/repos/semantic-sql/db/go.db
cl: /Users/cjm/repos/semantic-sql/db/cl.db
sqlite> select count(*) from cl.rdfs_subclass_of_statement;
27236
sqlite> select count(*) from main.rdfs_subclass_of_statement;
173270
sqlite> select count(*) from rdfs_subclass_of_statement;
173270
```


## Modules

The logic/views are divided into modules. The current organization may be changed.

 - RDF - core RDF types and predicates
 - OWL - OWL constructs
 - OMO - OBO Metadata
 - Relation Graphs
 - OBO - mostly checks

Each of these is managed as a separate yaml file that compiles down to either SQL views or INSERTs

### RDF

The module [rdf](sql/rdf.sql) provides convenient views for common RDF and RDFS constructs.

E.g.

```
sqlite> select * from rdfslabel where value like '%shape%';
```

generates

subject|predicate|object|value|
---|---|---|---|
PATO:0002536|PATO:0002536|rdfs:label||boomerang shaped|xsd:string|
PATO:0002539|PATO:0002539|rdfs:label||ring shaped|xsd:string|
PATO:0002540|PATO:0002540|rdfs:label||spur shaped|xsd:string|
PATO:0005002|PATO:0005002|rdfs:label||pear shaped|xsd:string|
PATO:0005003|PATO:0005003|rdfs:label||paddle shaped|xsd:string|


### OWL

The module [owl](sql/owl.sql) provides convenient views for predicates such as subClassOf, and for transitive queries, e.g. subclasses of shape:

```sql
select * from subclass_of_ancestors where object='obo:PATO_0000052';
```

The module [relation-graph](sql/relation-graph.sql) provides useful
views for querying ontologies such as GO, that incorporate critical
information in existential axioms, the view `edge` provides a union of
subclass between named classes and subclasses of existentials.

### OBO-Checks

This is an experiment to try and replicate ROBOT checks. See below

### GO

## Validation

The general philosophy is not to use foreign key constraints or
triggers to enforce integrity. Instead we allow problematic data into
the database and instead provide transparent reporting on it and ways
to validate. Individual use cases may call for more aggressive filtering.

The convention is to write rules/constrains as SQL views with a name `problem_`.

See also:

 * ROBOT report
 * GO Rules
 * KGX validation

## Relationship to rdftab.rs

We use the same schema as rdftab.rs, and rdftab can be used as a performant robust loader.

Note that we (currently) do not make use of the 'stanza' column in
rdftab, so an alternate method of populating `statements` can be used
that does not depend on turtle serialization (this could be INSERT
statements from another schema, or simply a SPARQL SELECT dumping a
triplestore/RDF file in the required layout). However, the stanza
column is useful for ad-hoc querying.

rdftab provides a useful base standard that could be used e.g. for
distributing ontologies and semantic databases as sqlite, for which a
variety of performant tools can be written.

## Schema

See [LinkML Docs](https://cmungall.github.io/semantic-sql/)

SQL views can be generated automatically. For now the linkml schema can be used to explore the structure

## Additional Tools

Standard SQL client can be used to explore a sqlite db created using this framework

E.g. here is a shot of DBeaver querying the `rdfslabel` view in OBO for terms that have "assay" in the label:

![image](https://user-images.githubusercontent.com/50745/117589903-74e18900-b0e1-11eb-8aa1-c92856b64384.png)


## Design Philosophy

SPARQL has many appealing qualities and it was designed first and foremost for the semantic web. But there are problems:

 1. Implementations: lack performance, robustness
 2. Lack of an open analog of sqlite3 (embedded)
 3. Lack of an open analog of PostgreSQL (server)
 3. Lack of an open analog of pandas
 4. Developers not familiar with SPARQL
 5. Tooling does not match what is available for SQL DBs. E.g. no mature equivalent to sqlalchemy
 6. important: Lack of composability. No equivalent of SQL VIEWs

These mainly stem from the fact that the semantic web stack was
created de-novo rather than leveraging existing engineering
solutions. This was good for people who like to write tools but bad
for users.

The philosophy here is to take the good parts of the semantic web and
transfer them to the relational database world, leveraging existing
tooling.

The base table is the `statements` table from rdftab:

stanza | subject | predicate          | object                   | value | datatype | language
-------|---------|--------------------|--------------------------|-------|----------|----------
ex:foo | ex:foo  | rdfs:label         |                          | Foo   |          |
ex:foo | ex:foo  | rdfs:label         |                          | Fou   |          | fr
ex:foo | ex:foo  | ex:size            |                          | 123   | xsd:int  |
ex:foo | ex:foo  | ex:link            | <http://example.com/foo> |       |          |
ex:foo | ex:foo  | rdf:type           | owl:Class                |       |          |
ex:foo | ex:foo  | rdfs:subClassOf    | _:b1                     |       |          |
ex:foo | _:b1    | rdf:type           | owl:Restriction          |       |          |
ex:foo | _:b1    | owl:onProperty     | ex:part-of               |       |          |
ex:foo | _:b1    | owl:someValuesFrom | ex:bar                   |       |          |

This is a good standard for tools like gizmo to work with, but for ad-hoc querying RDF is quite low level.

One attractive feature of SQL compared to SPARQL is composability - we
can create views for common operations, and views can be composed of
other views. Views can also be materialized for speed.

A trivial example, from [sql/rdf.sql](sql/rdf.sql) is a view for labels:

```sql
CREATE VIEW rdfslabel AS SELECT * FROM statements WHERE predicate = 'rdfs:label';
```

This is a convenience predicate that saves typing, provides autocomplete in the sqlite CLI, etc

These can then be layered, e.g to write ROBOT-style checks in a declarative fashion [sql/obo-checks.sql](sql/obo-checks.sql):

```sql
CREATE VIEW node_with_two_labels_problems AS SELECT s1.subject AS id, s1.value AS label1, s2.value AS label2 FROM rdfslabel AS s1, rdfslabel AS s2 WHERE s1.subject=s2.subject AND s1.value != s2.value;
CREATE VIEW shared_label_problems AS SELECT s1.subject AS node1, s2.subject AS node2, s1.value FROM rdfslabel AS s1, rdfslabel AS s2 WHERE s1.subject!=s2.subject AND s1.value = s2.value;
```

We can then combine all reports into a single view:

```sql
SELECT * FROM problems;
```

I am also experimenting with CTEs but these currently seem slow - though an advantage is that they are dynamic, requiring no precomputation.

However, it is recommended you perform inference in advance, e.g. using `robot reason`

For relation-graph inference, use either

 1. [relation-graph](https://github.com/balhoff/relation-graph)
 2. [Datalog](https://github.com/cmungall/datalog-experiments)

## Previous work

 1. [Chado Ontology Schema](http://gmod.org/wiki/Chado_CV_Module)
 2. [GO MySQL database](http://web.archive.org/web/20030901235122/http://www.godatabase.org/dev/database/schema.html)
 3. [OBD](https://github.com/phenoscape/OBDAPI/tree/master/sql)
