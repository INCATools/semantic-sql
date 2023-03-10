# Auto generated from registry_schema.yaml by pythongen.py version: 0.9.0
# Generation date: 2022-11-13T13:16:23
# Schema: ontology_registry
#
# id: https://w3id.org/semsql/registry
# description: Ontology Registry
# license: https://creativecommons.org/publicdomain/zero/1.0/

import dataclasses
from dataclasses import dataclass
from typing import Any, ClassVar, Dict, List, Optional, Union

from jsonasobj2 import JsonObj, as_dict
from linkml_runtime.linkml_model.meta import (EnumDefinition, PermissibleValue,
                                              PvFormulaOptions)
from linkml_runtime.linkml_model.types import (Boolean, Integer, String,
                                               Uriorcurie)
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.utils.dataclass_extensions_376 import \
    dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from linkml_runtime.utils.formatutils import camelcase, sfx, underscore
from linkml_runtime.utils.metamodelcore import (Bool, URIorCURIE, bnode,
                                                empty_dict, empty_list)
from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.yamlutils import (YAMLRoot, extended_float,
                                            extended_int, extended_str)
from rdflib import Namespace, URIRef

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
LINKML = CurieNamespace("linkml", "https://w3id.org/linkml/")
SEMSQL_REGISTRY = CurieNamespace("semsql_registry", "https://w3id.org/semsql/registry")
XSD = CurieNamespace("xsd", "http://www.w3.org/2001/XMLSchema#")
DEFAULT_ = SEMSQL_REGISTRY


# Types
class Identifier(String):
    type_class_uri = XSD.string
    type_class_curie = "xsd:string"
    type_name = "identifier"
    type_model_uri = SEMSQL_REGISTRY.Identifier


class HttpsIdentifier(String):
    type_class_uri = XSD.string
    type_class_curie = "xsd:string"
    type_name = "https identifier"
    type_model_uri = SEMSQL_REGISTRY.HttpsIdentifier


class HttpIdentifier(String):
    type_class_uri = XSD.string
    type_class_curie = "xsd:string"
    type_name = "http identifier"
    type_model_uri = SEMSQL_REGISTRY.HttpIdentifier


# Class references
class OntologyId(extended_str):
    pass


class PrefixMapPrefix(extended_str):
    pass


class RegistryId(extended_str):
    pass


@dataclass
class Ontology(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Ontology
    class_class_curie: ClassVar[str] = "semsql_registry:Ontology"
    class_name: ClassVar[str] = "Ontology"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Ontology

    id: Union[str, OntologyId] = None
    description: Optional[str] = None
    url: Optional[Union[str, Identifier]] = None
    sha256: Optional[str] = None
    local_path: Optional[str] = None
    has_imports: Optional[int] = None
    jsonld_context: Optional[Union[str, HttpsIdentifier]] = None
    prefixmap: Optional[
        Union[
            Dict[Union[str, PrefixMapPrefix], Union[dict, "PrefixMap"]],
            List[Union[dict, "PrefixMap"]],
        ]
    ] = empty_dict()
    named_prefixmaps: Optional[Union[str, List[str]]] = empty_list()
    format: Optional[str] = None
    compression: Optional[Union[str, "CompressionEnum"]] = None
    suppress: Optional[Union[bool, Bool]] = None
    relation_graph_settings: Optional[Union[dict, "RelationGraphConfiguration"]] = None
    zip_extract_file: Optional[str] = None
    build_command: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, OntologyId):
            self.id = OntologyId(self.id)

        if self.description is not None and not isinstance(self.description, str):
            self.description = str(self.description)

        if self.url is not None and not isinstance(self.url, Identifier):
            self.url = Identifier(self.url)

        if self.sha256 is not None and not isinstance(self.sha256, str):
            self.sha256 = str(self.sha256)

        if self.local_path is not None and not isinstance(self.local_path, str):
            self.local_path = str(self.local_path)

        if self.has_imports is not None and not isinstance(self.has_imports, int):
            self.has_imports = int(self.has_imports)

        if self.jsonld_context is not None and not isinstance(
            self.jsonld_context, HttpsIdentifier
        ):
            self.jsonld_context = HttpsIdentifier(self.jsonld_context)

        self._normalize_inlined_as_dict(
            slot_name="prefixmap", slot_type=PrefixMap, key_name="prefix", keyed=True
        )

        if not isinstance(self.named_prefixmaps, list):
            self.named_prefixmaps = (
                [self.named_prefixmaps] if self.named_prefixmaps is not None else []
            )
        self.named_prefixmaps = [
            v if isinstance(v, str) else str(v) for v in self.named_prefixmaps
        ]

        if self.format is not None and not isinstance(self.format, str):
            self.format = str(self.format)

        if self.compression is not None and not isinstance(
            self.compression, CompressionEnum
        ):
            self.compression = CompressionEnum(self.compression)

        if self.suppress is not None and not isinstance(self.suppress, Bool):
            self.suppress = Bool(self.suppress)

        if self.relation_graph_settings is not None and not isinstance(
            self.relation_graph_settings, RelationGraphConfiguration
        ):
            self.relation_graph_settings = RelationGraphConfiguration(
                **as_dict(self.relation_graph_settings)
            )

        if self.zip_extract_file is not None and not isinstance(
            self.zip_extract_file, str
        ):
            self.zip_extract_file = str(self.zip_extract_file)

        if self.build_command is not None and not isinstance(self.build_command, str):
            self.build_command = str(self.build_command)

        super().__post_init__(**kwargs)


@dataclass
class PrefixMap(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.PrefixMap
    class_class_curie: ClassVar[str] = "semsql_registry:PrefixMap"
    class_name: ClassVar[str] = "PrefixMap"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.PrefixMap

    prefix: Union[str, PrefixMapPrefix] = None
    prefix_value: Optional[Union[str, HttpIdentifier]] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.prefix):
            self.MissingRequiredField("prefix")
        if not isinstance(self.prefix, PrefixMapPrefix):
            self.prefix = PrefixMapPrefix(self.prefix)

        if self.prefix_value is not None and not isinstance(
            self.prefix_value, HttpIdentifier
        ):
            self.prefix_value = HttpIdentifier(self.prefix_value)

        super().__post_init__(**kwargs)


@dataclass
class Registry(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Registry
    class_class_curie: ClassVar[str] = "semsql_registry:Registry"
    class_name: ClassVar[str] = "Registry"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Registry

    id: Union[str, RegistryId] = None
    description: Optional[str] = None
    license: Optional[str] = None
    ontologies: Optional[
        Union[
            Dict[Union[str, OntologyId], Union[dict, Ontology]],
            List[Union[dict, Ontology]],
        ]
    ] = empty_dict()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, RegistryId):
            self.id = RegistryId(self.id)

        if self.description is not None and not isinstance(self.description, str):
            self.description = str(self.description)

        if self.license is not None and not isinstance(self.license, str):
            self.license = str(self.license)

        self._normalize_inlined_as_dict(
            slot_name="ontologies", slot_type=Ontology, key_name="id", keyed=True
        )

        super().__post_init__(**kwargs)


@dataclass
class RelationGraphConfiguration(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.RelationGraphConfiguration
    class_class_curie: ClassVar[str] = "semsql_registry:RelationGraphConfiguration"
    class_name: ClassVar[str] = "RelationGraphConfiguration"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.RelationGraphConfiguration

    properties: Optional[
        Union[Union[str, URIorCURIE], List[Union[str, URIorCURIE]]]
    ] = empty_list()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if not isinstance(self.properties, list):
            self.properties = [self.properties] if self.properties is not None else []
        self.properties = [
            v if isinstance(v, URIorCURIE) else URIorCURIE(v) for v in self.properties
        ]

        super().__post_init__(**kwargs)


@dataclass
class MakefileRule(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.MakefileRule
    class_class_curie: ClassVar[str] = "semsql_registry:MakefileRule"
    class_name: ClassVar[str] = "MakefileRule"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.MakefileRule

    target: Optional[str] = None
    dependencies: Optional[Union[str, List[str]]] = empty_list()
    commands: Optional[Union[str, List[str]]] = empty_list()
    comments: Optional[Union[str, List[str]]] = empty_list()
    precious: Optional[Union[bool, Bool]] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self.target is not None and not isinstance(self.target, str):
            self.target = str(self.target)

        if not isinstance(self.dependencies, list):
            self.dependencies = (
                [self.dependencies] if self.dependencies is not None else []
            )
        self.dependencies = [
            v if isinstance(v, str) else str(v) for v in self.dependencies
        ]

        if not isinstance(self.commands, list):
            self.commands = [self.commands] if self.commands is not None else []
        self.commands = [v if isinstance(v, str) else str(v) for v in self.commands]

        if not isinstance(self.comments, list):
            self.comments = [self.comments] if self.comments is not None else []
        self.comments = [v if isinstance(v, str) else str(v) for v in self.comments]

        if self.precious is not None and not isinstance(self.precious, Bool):
            self.precious = Bool(self.precious)

        super().__post_init__(**kwargs)


@dataclass
class Makefile(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Makefile
    class_class_curie: ClassVar[str] = "semsql_registry:Makefile"
    class_name: ClassVar[str] = "Makefile"
    class_model_uri: ClassVar[URIRef] = SEMSQL_REGISTRY.Makefile

    rules: Optional[
        Union[Union[dict, MakefileRule], List[Union[dict, MakefileRule]]]
    ] = empty_list()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if not isinstance(self.rules, list):
            self.rules = [self.rules] if self.rules is not None else []
        self.rules = [
            v if isinstance(v, MakefileRule) else MakefileRule(**as_dict(v))
            for v in self.rules
        ]

        super().__post_init__(**kwargs)


# Enumerations
class FormatEnum(EnumDefinitionImpl):
    n3 = PermissibleValue(text="n3", description="n3")

    _defn = EnumDefinition(
        name="FormatEnum",
    )


class CompressionEnum(EnumDefinitionImpl):
    gzip = PermissibleValue(text="gzip", description="gzip")

    _defn = EnumDefinition(
        name="CompressionEnum",
    )


# Slots
class slots:
    pass


slots.id = Slot(
    uri=SEMSQL_REGISTRY.id,
    name="id",
    curie=SEMSQL_REGISTRY.curie("id"),
    model_uri=SEMSQL_REGISTRY.id,
    domain=None,
    range=URIRef,
)

slots.description = Slot(
    uri=SEMSQL_REGISTRY.description,
    name="description",
    curie=SEMSQL_REGISTRY.curie("description"),
    model_uri=SEMSQL_REGISTRY.description,
    domain=None,
    range=Optional[str],
)

slots.url = Slot(
    uri=SEMSQL_REGISTRY.url,
    name="url",
    curie=SEMSQL_REGISTRY.curie("url"),
    model_uri=SEMSQL_REGISTRY.url,
    domain=None,
    range=Optional[Union[str, Identifier]],
)

slots.relation_graph_settings = Slot(
    uri=SEMSQL_REGISTRY.relation_graph_settings,
    name="relation_graph_settings",
    curie=SEMSQL_REGISTRY.curie("relation_graph_settings"),
    model_uri=SEMSQL_REGISTRY.relation_graph_settings,
    domain=None,
    range=Optional[Union[dict, RelationGraphConfiguration]],
)

slots.has_imports = Slot(
    uri=SEMSQL_REGISTRY.has_imports,
    name="has_imports",
    curie=SEMSQL_REGISTRY.curie("has_imports"),
    model_uri=SEMSQL_REGISTRY.has_imports,
    domain=None,
    range=Optional[int],
)

slots.jsonld_context = Slot(
    uri=SEMSQL_REGISTRY.jsonld_context,
    name="jsonld_context",
    curie=SEMSQL_REGISTRY.curie("jsonld_context"),
    model_uri=SEMSQL_REGISTRY.jsonld_context,
    domain=None,
    range=Optional[Union[str, HttpsIdentifier]],
)

slots.prefixmap = Slot(
    uri=SEMSQL_REGISTRY.prefixmap,
    name="prefixmap",
    curie=SEMSQL_REGISTRY.curie("prefixmap"),
    model_uri=SEMSQL_REGISTRY.prefixmap,
    domain=None,
    range=Optional[
        Union[
            Dict[Union[str, PrefixMapPrefix], Union[dict, PrefixMap]],
            List[Union[dict, PrefixMap]],
        ]
    ],
)

slots.zip_extract_file = Slot(
    uri=SEMSQL_REGISTRY.zip_extract_file,
    name="zip_extract_file",
    curie=SEMSQL_REGISTRY.curie("zip_extract_file"),
    model_uri=SEMSQL_REGISTRY.zip_extract_file,
    domain=None,
    range=Optional[str],
)

slots.named_prefixmaps = Slot(
    uri=SEMSQL_REGISTRY.named_prefixmaps,
    name="named_prefixmaps",
    curie=SEMSQL_REGISTRY.curie("named_prefixmaps"),
    model_uri=SEMSQL_REGISTRY.named_prefixmaps,
    domain=None,
    range=Optional[Union[str, List[str]]],
)

slots.format = Slot(
    uri=SEMSQL_REGISTRY.format,
    name="format",
    curie=SEMSQL_REGISTRY.curie("format"),
    model_uri=SEMSQL_REGISTRY.format,
    domain=None,
    range=Optional[str],
)

slots.build_command = Slot(
    uri=SEMSQL_REGISTRY.build_command,
    name="build_command",
    curie=SEMSQL_REGISTRY.curie("build_command"),
    model_uri=SEMSQL_REGISTRY.build_command,
    domain=None,
    range=Optional[str],
)

slots.sha256 = Slot(
    uri=SEMSQL_REGISTRY.sha256,
    name="sha256",
    curie=SEMSQL_REGISTRY.curie("sha256"),
    model_uri=SEMSQL_REGISTRY.sha256,
    domain=None,
    range=Optional[str],
)

slots.local_path = Slot(
    uri=SEMSQL_REGISTRY.local_path,
    name="local_path",
    curie=SEMSQL_REGISTRY.curie("local_path"),
    model_uri=SEMSQL_REGISTRY.local_path,
    domain=None,
    range=Optional[str],
)

slots.compression = Slot(
    uri=SEMSQL_REGISTRY.compression,
    name="compression",
    curie=SEMSQL_REGISTRY.curie("compression"),
    model_uri=SEMSQL_REGISTRY.compression,
    domain=None,
    range=Optional[Union[str, "CompressionEnum"]],
)

slots.prefix = Slot(
    uri=SEMSQL_REGISTRY.prefix,
    name="prefix",
    curie=SEMSQL_REGISTRY.curie("prefix"),
    model_uri=SEMSQL_REGISTRY.prefix,
    domain=None,
    range=URIRef,
)

slots.prefix_value = Slot(
    uri=SEMSQL_REGISTRY.prefix_value,
    name="prefix_value",
    curie=SEMSQL_REGISTRY.curie("prefix_value"),
    model_uri=SEMSQL_REGISTRY.prefix_value,
    domain=None,
    range=Optional[Union[str, HttpIdentifier]],
)

slots.license = Slot(
    uri=SEMSQL_REGISTRY.license,
    name="license",
    curie=SEMSQL_REGISTRY.curie("license"),
    model_uri=SEMSQL_REGISTRY.license,
    domain=None,
    range=Optional[str],
)

slots.ontologies = Slot(
    uri=SEMSQL_REGISTRY.ontologies,
    name="ontologies",
    curie=SEMSQL_REGISTRY.curie("ontologies"),
    model_uri=SEMSQL_REGISTRY.ontologies,
    domain=None,
    range=Optional[
        Union[
            Dict[Union[str, OntologyId], Union[dict, Ontology]],
            List[Union[dict, Ontology]],
        ]
    ],
)

slots.suppress = Slot(
    uri=SEMSQL_REGISTRY.suppress,
    name="suppress",
    curie=SEMSQL_REGISTRY.curie("suppress"),
    model_uri=SEMSQL_REGISTRY.suppress,
    domain=None,
    range=Optional[Union[bool, Bool]],
)

slots.relationGraphConfiguration__properties = Slot(
    uri=SEMSQL_REGISTRY.properties,
    name="relationGraphConfiguration__properties",
    curie=SEMSQL_REGISTRY.curie("properties"),
    model_uri=SEMSQL_REGISTRY.relationGraphConfiguration__properties,
    domain=None,
    range=Optional[Union[Union[str, URIorCURIE], List[Union[str, URIorCURIE]]]],
)

slots.makefileRule__target = Slot(
    uri=SEMSQL_REGISTRY.target,
    name="makefileRule__target",
    curie=SEMSQL_REGISTRY.curie("target"),
    model_uri=SEMSQL_REGISTRY.makefileRule__target,
    domain=None,
    range=Optional[str],
)

slots.makefileRule__dependencies = Slot(
    uri=SEMSQL_REGISTRY.dependencies,
    name="makefileRule__dependencies",
    curie=SEMSQL_REGISTRY.curie("dependencies"),
    model_uri=SEMSQL_REGISTRY.makefileRule__dependencies,
    domain=None,
    range=Optional[Union[str, List[str]]],
)

slots.makefileRule__commands = Slot(
    uri=SEMSQL_REGISTRY.commands,
    name="makefileRule__commands",
    curie=SEMSQL_REGISTRY.curie("commands"),
    model_uri=SEMSQL_REGISTRY.makefileRule__commands,
    domain=None,
    range=Optional[Union[str, List[str]]],
)

slots.makefileRule__comments = Slot(
    uri=SEMSQL_REGISTRY.comments,
    name="makefileRule__comments",
    curie=SEMSQL_REGISTRY.curie("comments"),
    model_uri=SEMSQL_REGISTRY.makefileRule__comments,
    domain=None,
    range=Optional[Union[str, List[str]]],
)

slots.makefileRule__precious = Slot(
    uri=SEMSQL_REGISTRY.precious,
    name="makefileRule__precious",
    curie=SEMSQL_REGISTRY.curie("precious"),
    model_uri=SEMSQL_REGISTRY.makefileRule__precious,
    domain=None,
    range=Optional[Union[bool, Bool]],
)

slots.makefile__rules = Slot(
    uri=SEMSQL_REGISTRY.rules,
    name="makefile__rules",
    curie=SEMSQL_REGISTRY.curie("rules"),
    model_uri=SEMSQL_REGISTRY.makefile__rules,
    domain=None,
    range=Optional[Union[Union[dict, MakefileRule], List[Union[dict, MakefileRule]]]],
)
