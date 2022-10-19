#!/usr/bin/python
import os
import subprocess
from ast import literal_eval

from ansible.module_utils.basic import AnsibleModule

EPSILON = 1e-10


def is_equal(val1: str, val2: str):
    """
    We need to be smart when comparing values with type "double".

    $ gsettings set some.schema some-key-with-type-double 0.1
    $ gsettings get some.schema some-key-with-type-double
    0.10000000000000001
    """
    try:
        val1_int = int(val1)
        val2_int = int(val2)
        return val1_int == val2_int
    except ValueError:
        pass
    try:
        val1_float = float(val1)
        val2_float = float(val2)
        return abs(val1_float - val2_float) < EPSILON
    except ValueError:
        pass
    return val1 == val2


def parse_value(value: str):
    if value.startswith("'") or value.startswith('"'):
        return literal_eval(value)
    return value


def set_value(schemadir, schema, key, value):
    command = ["/usr/bin/gsettings"]
    if schemadir:
        command.extend(["--schemadir", schemadir])
    command.extend(["set", schema, key, value])

    return subprocess.check_output(command).decode().strip()


def get_value(schemadir, schema, key):
    command = ["/usr/bin/gsettings"]
    if schemadir:
        command.extend(["--schemadir", schemadir])
    command.extend(["get", schema, key])

    return parse_value(subprocess.check_output(command).decode().strip())


def main():

    module = AnsibleModule(
        argument_spec={
            "schemadir": {"type": "path", "required": False},
            "schema": {"type": "str", "required": False},
            "key": {"type": "str", "required": True},
            "value": {"type": "str", "required": False},
        },
        supports_check_mode=True,
    )

    schemadir = (
        os.path.expanduser(module.params["schemadir"])
        if module.params["schemadir"]
        else None
    )
    schema = module.params["schema"]
    key = module.params["key"]
    value = module.params["value"]

    old_value = get_value(schemadir, schema, key)

    changed = not is_equal(old_value, value)

    if changed and not module.check_mode:
        set_value(schemadir, schema, key, value)

    module.exit_json(changed=changed)


if __name__ == "__main__":
    main()
