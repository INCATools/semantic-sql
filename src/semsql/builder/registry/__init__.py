from pathlib import Path

this_path = Path(__file__).parent


def path_to_ontology_registry() -> Path:
    """
    Returns path to the registry file

    :return:
    """
    return this_path / "ontologies.yaml"
