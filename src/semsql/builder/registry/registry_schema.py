# Auto generated from registry_schema.yaml by pythongen.py version: 0.9.0
# Generation date: 2022-09-05T18:53:50
# Schema: ontology_registry
#
# id: https://w3id.org/semsql/registry
# description: Ontology Registry
# license: https://creativecommons.org/publicdomain/zero/1.0/

import dataclasses
import sys
import re
from jsonasobj2 import JsonObj, as_dict
from typing import Optional, List, Union, Dict, ClassVar, Any
from dataclasses import dataclass
from linkml_runtime.linkml_model.meta import EnumDefinition, PermissibleValue, PvFormulaOptions

from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.metamodelcore import empty_list, empty_dict, bnode
from linkml_runtime.utils.yamlutils import YAMLRoot, extended_str, extended_float, extended_int
from linkml_runtime.utils.dataclass_extensions_376 import dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.formatutils import camelcase, underscore, sfx
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from rdflib import Namespace, URIRef
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.linkml_model.types import Integer, String

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
LINKML = CurieNamespace('linkml', 'https://w3id.org/linkml/')
SEMSQL_REGISTRY = CurieNamespace('semsql_registry', 'https://w3id.org/semsql/registry')
XSD = CurieNamespace('xsd', 'http://www.w3.org/2001/XMLSchema#')
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
    has_imports: Optional[int] = None
    jsonld_context: Optional[Union[str, HttpsIdentifier]] = None
    prefixmap: Optional[Union[Union[str, PrefixMapPrefix], List[Union[str, PrefixMapPrefix]]]] = empty_list()
    named_prefixmaps: Optional[Union[str, List[str]]] = empty_list()
    format: Optional[str] = None
    compression: Optional[Union[str, "CompressionEnum"]] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, OntologyId):
            self.id = OntologyId(self.id)

        if self.description is not None and not isinstance(self.description, str):
            self.description = str(self.description)

        if self.url is not None and not isinstance(self.url, Identifier):
            self.url = Identifier(self.url)

        if self.has_imports is not None and not isinstance(self.has_imports, int):
            self.has_imports = int(self.has_imports)

        if self.jsonld_context is not None and not isinstance(self.jsonld_context, HttpsIdentifier):
            self.jsonld_context = HttpsIdentifier(self.jsonld_context)

        if not isinstance(self.prefixmap, list):
            self.prefixmap = [self.prefixmap] if self.prefixmap is not None else []
        self.prefixmap = [v if isinstance(v, PrefixMapPrefix) else PrefixMapPrefix(v) for v in self.prefixmap]

        if not isinstance(self.named_prefixmaps, list):
            self.named_prefixmaps = [self.named_prefixmaps] if self.named_prefixmaps is not None else []
        self.named_prefixmaps = [v if isinstance(v, str) else str(v) for v in self.named_prefixmaps]

        if self.format is not None and not isinstance(self.format, str):
            self.format = str(self.format)

        if self.compression is not None and not isinstance(self.compression, CompressionEnum):
            self.compression = CompressionEnum(self.compression)

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

        if self.prefix_value is not None and not isinstance(self.prefix_value, HttpIdentifier):
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
    ontologies: Optional[Union[Dict[Union[str, OntologyId], Union[dict, Ontology]], List[Union[dict, Ontology]]]] = empty_dict()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, RegistryId):
            self.id = RegistryId(self.id)

        if self.description is not None and not isinstance(self.description, str):
            self.description = str(self.description)

        if self.license is not None and not isinstance(self.license, str):
            self.license = str(self.license)

        self._normalize_inlined_as_dict(slot_name="ontologies", slot_type=Ontology, key_name="id", keyed=True)

        super().__post_init__(**kwargs)


# Enumerations
class FormatEnum(EnumDefinitionImpl):

    n3 = PermissibleValue(text="n3",
                           description="n3")

    _defn = EnumDefinition(
        name="FormatEnum",
    )

class CompressionEnum(EnumDefinitionImpl):

    gzip = PermissibleValue(text="gzip",
                               description="gzip")

    _defn = EnumDefinition(
        name="CompressionEnum",
    )

# Slots
class slots:
    pass

slots.description = Slot(uri=SEMSQL_REGISTRY.description, name="description", curie=SEMSQL_REGISTRY.curie('description'),
                   model_uri=SEMSQL_REGISTRY.description, domain=None, range=Optional[str])

slots.url = Slot(uri=SEMSQL_REGISTRY.url, name="url", curie=SEMSQL_REGISTRY.curie('url'),
                   model_uri=SEMSQL_REGISTRY.url, domain=None, range=Optional[Union[str, Identifier]])

slots.id = Slot(uri=SEMSQL_REGISTRY.id, name="id", curie=SEMSQL_REGISTRY.curie('id'),
                   model_uri=SEMSQL_REGISTRY.id, domain=None, range=URIRef)

slots.has_imports = Slot(uri=SEMSQL_REGISTRY.has_imports, name="has_imports", curie=SEMSQL_REGISTRY.curie('has_imports'),
                   model_uri=SEMSQL_REGISTRY.has_imports, domain=None, range=Optional[int])

slots.jsonld_context = Slot(uri=SEMSQL_REGISTRY.jsonld_context, name="jsonld_context", curie=SEMSQL_REGISTRY.curie('jsonld_context'),
                   model_uri=SEMSQL_REGISTRY.jsonld_context, domain=None, range=Optional[Union[str, HttpsIdentifier]])

slots.prefixmap = Slot(uri=SEMSQL_REGISTRY.prefixmap, name="prefixmap", curie=SEMSQL_REGISTRY.curie('prefixmap'),
                   model_uri=SEMSQL_REGISTRY.prefixmap, domain=None, range=Optional[Union[Union[str, PrefixMapPrefix], List[Union[str, PrefixMapPrefix]]]])

slots.named_prefixmaps = Slot(uri=SEMSQL_REGISTRY.named_prefixmaps, name="named_prefixmaps", curie=SEMSQL_REGISTRY.curie('named_prefixmaps'),
                   model_uri=SEMSQL_REGISTRY.named_prefixmaps, domain=None, range=Optional[Union[str, List[str]]])

slots.format = Slot(uri=SEMSQL_REGISTRY.format, name="format", curie=SEMSQL_REGISTRY.curie('format'),
                   model_uri=SEMSQL_REGISTRY.format, domain=None, range=Optional[str])

slots.compression = Slot(uri=SEMSQL_REGISTRY.compression, name="compression", curie=SEMSQL_REGISTRY.curie('compression'),
                   model_uri=SEMSQL_REGISTRY.compression, domain=None, range=Optional[Union[str, "CompressionEnum"]])

slots.prefix = Slot(uri=SEMSQL_REGISTRY.prefix, name="prefix", curie=SEMSQL_REGISTRY.curie('prefix'),
                   model_uri=SEMSQL_REGISTRY.prefix, domain=None, range=URIRef)

slots.prefix_value = Slot(uri=SEMSQL_REGISTRY.prefix_value, name="prefix_value", curie=SEMSQL_REGISTRY.curie('prefix_value'),
                   model_uri=SEMSQL_REGISTRY.prefix_value, domain=None, range=Optional[Union[str, HttpIdentifier]])

slots.license = Slot(uri=SEMSQL_REGISTRY.license, name="license", curie=SEMSQL_REGISTRY.curie('license'),
                   model_uri=SEMSQL_REGISTRY.license, domain=None, range=Optional[str])

slots.ontologies = Slot(uri=SEMSQL_REGISTRY.ontologies, name="ontologies", curie=SEMSQL_REGISTRY.curie('ontologies'),
                   model_uri=SEMSQL_REGISTRY.ontologies, domain=None, range=Optional[Union[Dict[Union[str, OntologyId], Union[dict, Ontology]], List[Union[dict, Ontology]]]])
