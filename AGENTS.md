# AGENTS.md for semantic-sql

SQL and SQLite builds of common OWL ontologies, including all of OBO

TODO: fill in extra description here

## Repo management

This repo uses `uv` for managing dependencies. Never use commands like `pip` to add or manage dependencies.
`uv run` is the best way to run things, unless you are using `justfile` or `makefile` target

`mkdocs` is used for documentation.## This is a LinkML Schema repository

Layout:

 * `src/semantic_sql/schema/semantic_sql.yaml` - LinkML source schema (edit this)
 * `project` - derived files (do not edit these directly, they are derived from the LinkML)
 * `src/docs` - source markdown for documentation
 * `docs` - derived docs - do not edit these directly
 * `src/data/examples/{valid,invalid}` - example data files
    * always include positive examples of each class in the `valid` subfolder
    * include negative examples for unit tests and to help illustrate pitfalls
    * format is `ClassName-{SOMENAME}.yaml`
 * `examples` - derived examples. Do not edit these directly

Building and testing:

* `just --list` to see all commands
* `just gen-project` to generate `project` files
* `just test` to test schema and pos/neg examples
* `just lint` analogous to ruff for python

These are wrappers on top of existing linkml commands such as `gen-project`, `linkml-convert`, `linkml-run-examples`.
You can run the underlying commands (with `uv run ...`) but in general justfile targets should be favored.

Best practice:

* For full documentation, see https://linkml.io/linkml/
* Follow LinkML naming conventions (CamelCase for classes, snake_case for slots/attributes)
* For schemas with polymorphism, consider using field `type` marked as a `type_designator: true`
* Include meaningful descriptions of each element
* map to standards where appropriate (e.g. dcterms)
* Never guess OBO term IDs. Always use the OLS MCP to look for relevant ontology terms
* be proactive in using due diligence to do deep research on the domain, and look at existing standards## This is a Python repository

Layout:

 * `src/semantic_sql/` - Code goes here
 * `docs` - mkdocs docs
 * `mkdocs.yml` - index of docs
 * `tests/input` - example files

Building and testing:

* `just --list` to see all commands
* `just test` performs unit tests, doctests, ruff/liniting
* `just test-full` as above plus integration tests

You can run the underlying commands (with `uv run ...`) but in general justfile targets should be favored.

Best practice:

* Use doctests liberally - these serve as both explanatory examples for humans and as unit tests
* For longer examples, write pytest tests
* always write pytest functional style rather than unittest OO style
* use modern pytest idioms, including `@pytest.mark.parametrize` to test for combinations of inputs
* NEVER write mock tests unless requested. I need to rely on tests to know if something breaks
* For tests that have external dependencies, you can do `@pytest.mark.integration`
* Do not "fix" issues by changing or weakening test conditions. Try harder, or ask questions if a test fails.
* Avoid try/except blocks, these can mask bugs
* Fail fast is a good principle
* Follow the DRY principle
* Avoid repeating chunks of code, but also avoid premature over-abstraction
* Pydantic or LinkML is favored for data objects
* For state in engine-style OO classes, dataclasses is favored
* Declarative principles are favored
* Always use type hints, always document methods and classes