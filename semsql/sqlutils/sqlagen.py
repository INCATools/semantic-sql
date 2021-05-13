import os
from typing import Union, TextIO, Dict, List, Tuple

import click
import logging

from sqlalchemy import *
from linkml_model.meta import ClassDefinition, SlotDefinition, SchemaDefinition, ClassDefinitionName, SlotDefinitionName
from linkml_model.types import NCName, URIorCURIE
from linkml.utils.formatutils import underscore, camelcase
from linkml.utils.generator import Generator, shared_arguments
from linkml.generators.sqlddlgen import RANGEMAP

CLASS_SLOT_PAIR = Tuple[ClassDefinitionName, SlotDefinitionName]

class SQLAlchemyGenerator(Generator):
    """
    A `Generator` for creating SQL Alchemy
    """
    generatorname = os.path.basename(__file__)
    valid_formats = ["sqla"]
    visit_all_class_slots: bool = True
    generatorversion = "0.1.1"
    primary_key_map: Dict[ClassDefinitionName, List[SlotDefinitionName]] = {}
    foreign_key_map: Dict[CLASS_SLOT_PAIR, CLASS_SLOT_PAIR] = {}
    foreign_key_backref_map: Dict[CLASS_SLOT_PAIR, CLASS_SLOT_PAIR] = {}

    def __init__(self, schema: Union[str, TextIO, SchemaDefinition], **kwargs) -> None:
        super().__init__(schema, **kwargs)
        print('from sqlalchemy import *')
        print('from sqlalchemy.sql.sqltypes import NullType')
        print('from sqlalchemy.ext.declarative import declarative_base')
        print('')
        print('Base = declarative_base()')
        print('metadata = Base.metadata')
        schema = self.schema
        for cn, c in schema.classes.items():
            slots = [schema.slots[sn] for sn in c.slots]
            pks = [s.name for s in slots if s.identifier]
            if len(pks) == 0:
                pks = [s for s in slots if s.key]
                if len(pks) == 0:
                    pks = c.slots
            elif len(pks) > 1:
                pks = pks[0]
            self.primary_key_map[cn] = pks
        for cn, c in schema.classes.items():
            for sn in c.slots:
                slot = schema.slots[sn]
                range = slot.range
                if range in self.schema.classes:
                    rc = self.schema.classes[range]
                    fk_slots = self.primary_key_map[range]
                    if len(fk_slots) == 1:
                        rkey = fk_slots[0]
                        print(f'## {cn}.{sn} REF ')
                        self.foreign_key_map[(cn,sn)] = (range, rkey)
                        self.foreign_key_backref_map[(range,rkey)] = (cn,sn)
                    else:
                        raise Exception(f'Cannot get id for slot {sn} range = {range}')

    def _is_hidden(self, cls: ClassDefinition) -> bool:
        if cls.mixin or cls.abstract or not cls.slots:
            return False

    def _tbl_name(self, cn: ClassDefinitionName) -> str:
        """
        https://stackoverflow.com/questions/1881123/table-naming-underscore-vs-camelcase-namespaces-singular-vs-plural
        """
        return underscore(cn)

    def _slot_name(self, sn: SlotDefinitionName) -> str:
        """
        use underscore by default
        """
        return underscore(sn)

    def visit_class(self, cls: ClassDefinition) -> bool:
        if self._is_hidden(cls):
            return False
        if len(cls.slots) == 0:
            return False
        t = self._tbl_name(cls.name)
        print(f'class {camelcase(t)}(Base):')
        if cls.description:
            print(f'    """')
            print(f'    {cls.description}')
            print(f'    """')
        print(f"    __tablename__ = '{t}'")
        print('    __mapper_args__ = {')
        print("          'concrete': True")
        print('    }')
        return True

    def visit_class_slot(self, cls: ClassDefinition, aliased_slot_name: str, slot: SlotDefinition) -> None:
        range = slot.range
        fk = None
        sql_range = None
        if range in self.schema.classes:
            if (cls.name, slot.name) in self.foreign_key_map:
                _,fk_slot = self.foreign_key_map[(cls.name, slot.name)]
                fk = f"ForeignKey('{range}.{fk_slot}'"
        elif range in self.schema.types:
            range = self.schema.types[range].base

        if range in RANGEMAP:
            sql_range = str(RANGEMAP[range])
        else:
            sql_range = 'Text'
        args = [sql_range]
        if fk is not None:
            args.append(fk)
        if slot.name in self.primary_key_map[cls.name]:
            args.append('primary_key=True')
        argstr = ", ".join(args)
        print(f'    {underscore(aliased_slot_name)} = Column({argstr})')

@shared_arguments(SQLAlchemyGenerator)
@click.command()
def cli(yamlfile, **args):
    """ Generate SQL Alchemy Model """
    gen = SQLAlchemyGenerator(yamlfile, **args)
    print(gen.serialize(**args))

if __name__ == '__main__':
    cli()
