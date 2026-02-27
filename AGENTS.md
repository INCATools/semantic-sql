# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Semantic-SQL transforms OWL/RDF ontologies into SQLite databases with standardized SQL views. Pre-built databases for all OBO ontologies are available via S3 (e.g., `https://s3.amazonaws.com/bbop-sqlite/hp.db.gz`).

## Key Commands

```bash
# Build/test
make test                     # Run unit tests
uv run pytest tests/          # Run specific tests
uv run pytest tests/test_orm/test_basic_sqla.py -k "test_name"  # Single test

# Schema development (after editing src/semsql/linkml/*.yaml)
make gen-ddl                  # Generate SQL DDL from LinkML
make gen-sqla                 # Generate SQLAlchemy ORM models
make gendoc                   # Generate documentation

# Ontology builds
semsql make foo.db            # Build SQLite from foo.owl (requires rdftab + relation-graph)
semsql download cl -o cl.db   # Download pre-built database
make build_all                # Build all OBO ontologies
make s3-deploy                # Deploy to S3

# Docker alternative
docker run -v $PWD:/work -w /work -ti linkml/semantic-sql semsql make foo.db
```

## Architecture

### Core Data Model

**Base tables** (physical storage):
- `statements` - RDF triples (stanza, subject, predicate, object, value, datatype, language)
- `prefix` - CURIE prefix mappings
- `entailed_edge` - Pre-computed transitive closures from relation-graph

**All other "tables" are SQL views** defined in LinkML schemas via embedded `sqlview>>` comments:
```yaml
rdfs_label_statement:
  comments:
    - sqlview>> SELECT * FROM statements WHERE predicate='rdfs:label'
```

### Build Pipeline

```
OWL file → robot preprocessing → rdftab → SQLite statements table
                              ↓
         relation-graph → entailed_edge table
                              ↓
                   Apply SQL views from schema
```

External dependencies: [rdftab.rs](https://github.com/ontodev/rdftab.rs), [relation-graph](https://github.com/balhoff/relation-graph)

### Source Layout

```
src/semsql/
├── linkml/           # LinkML schemas (THE SOURCE OF TRUTH)
│   ├── semsql.yaml   # Main schema, imports all modules
│   ├── rdf.yaml      # RDF/RDFS abstractions
│   ├── owl.yaml      # OWL constructs (restrictions, expressions)
│   ├── obo.yaml      # OBO patterns and validation checks
│   ├── omo.yaml      # Ontology Metadata mappings
│   └── relation_graph.yaml  # Edge-based graph views
├── builder/
│   ├── cli.py        # semsql command (make, download, query, view2table)
│   ├── builder.py    # Build orchestration
│   ├── build.Makefile # Core db build rules
│   ├── sql_schema/   # Generated SQL DDL (from LinkML)
│   ├── registry/     # ontologies.yaml - non-OBO ontology registry
│   └── prefixes/     # CURIE mappings
├── sqla/             # Generated SQLAlchemy ORM models
└── sqlutils/
    └── viewgen.py    # Extracts SQL views from LinkML comments
```

### Ontology Registry

`src/semsql/builder/registry/ontologies.yaml` defines non-OBO ontologies. After adding a new entry:

```bash
# If you added prefixes to the entry, rebuild prefix mappings first:
make build_prefixes

# May need to touch STAMP to force re-download:
rm STAMP

# Build the database:
make db/NAME.db

# Test with OAK:
runoak -i db/NAME.db terms
```

## Testing

Tests use pytest, not unittest. Integration tests require rdftab/relation-graph and are marked `@pytest.mark.integration`.

```bash
uv run pytest tests/test_orm/      # ORM tests use tests/inputs/go-nucleus.db
uv run pytest tests/test_builder/  # Builder tests
```

## Best Practices from User

- Use `uv` for dependencies (never pip)
- pytest functional style, use `@pytest.mark.parametrize`
- Never mock tests unless explicitly requested
- Avoid try/except blocks
- Use doctests liberally
- Never guess OBO term IDs - use OLS MCP to look them up
- LinkML naming: CamelCase for classes, snake_case for slots
