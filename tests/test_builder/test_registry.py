import re

import pytest

from semsql.builder import builder
from semsql.builder.registry import path_to_ontology_registry


@pytest.fixture(scope="module")
def registry_makefile() -> str:
    return builder.compile_registry(str(path_to_ontology_registry()))


@pytest.mark.parametrize(
    ("ontology_id", "url"),
    [
        (
            "cepo",
            "https://raw.githubusercontent.com/OpenEnergyPlatform/ClimateEnergyPolicyOntology/production/src/ontology/cepo.owl",
        ),
        (
            "oto",
            "https://raw.githubusercontent.com/OpenEnergyPlatform/OpenTransportOntology/production/src/ontology/oto.ttl",
        ),
    ],
)
def test_enero_download_rules_present(registry_makefile: str, ontology_id: str, url: str):
    assert f"download/{ontology_id}.owl: STAMP" in registry_makefile
    assert f"curl -L -s {url} > $@.tmp" in registry_makefile


@pytest.mark.parametrize(
    ("ontology_id", "command"),
    [
        ("cepo", r"robot merge -i \$< -o \$@"),
        (
            "oto",
            r"perl -0pe 's@http://w3id.org/oto/develop/oto-shared.ttl@https://raw.githubusercontent.com/OpenEnergyPlatform/OpenTransportOntology/production/src/ontology/edits/oto-shared.ttl@g' \$< > \$@\.tmp\.ttl && robot merge -i \$@\.tmp\.ttl -o \$@ && rm \$@\.tmp\.ttl",
        ),
    ],
)
def test_enero_build_rules_present(
    registry_makefile: str, ontology_id: str, command: str
):
    pattern = rf"db/{ontology_id}\.owl: download/{ontology_id}\.owl\n\t{command}"
    assert re.search(pattern, registry_makefile)
