from pathlib import Path

this_path = Path(__file__).parent


def path_to_schema(schema_name: str = "semsql") -> Path:
    """
    Returns path to the name of a schema

    :param schema_name: defaults to global schema (semsql)
    :return:
    """
    return this_path / f"{schema_name}.yaml"
