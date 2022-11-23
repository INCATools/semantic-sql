from semsql.builder.registry.registry_schema import Makefile, MakefileRule


def makerule_to_string(makerule: MakefileRule) -> str:
    """
    Convert a MakeRule to a string

    :param makerule:
    :return:
    """
    dependencies_str = " ".join(makerule.dependencies)
    commands_str = "".join([f"\t{c}\n" for c in makerule.commands])
    as_str = f"{makerule.target}: {dependencies_str}\n{commands_str}"
    if makerule.precious:
        as_str = f"{as_str}\n.PRECIOUS: {makerule.target}"
    return f"{as_str}\n"


def makefile_to_string(makefile: Makefile) -> str:
    """
    Convert a Makefile to a string

    :param makefile:
    :return:
    """
    return "\n".join([makerule_to_string(m) for m in makefile.rules])
