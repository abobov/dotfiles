#!/usr/bin/env python3
import os
import re
import sys
from glob import glob
from os.path import isfile, splitext

try:
    from hunspell import HunSpell
    from tasklib import Task
except ImportError as e:
    print(e)
    sys.exit(0)

DICT_PATH = "/usr/share/hunspell/"
LANGS = ["en_US", "ru_RU"]
ENV_SKIP = "TW_IGNORE_SPELL"


def spellcheck(text):
    spells = []
    for dic in glob(DICT_PATH + "*.dic"):
        aff = splitext(dic)[0] + ".aff"
        if isfile(dic) and isfile(aff):
            spells.append(HunSpell(dic, aff))

    if len(spells) == 0:
        return

    errors = []

    for word in re.findall(r"\w+", text):
        ok = False
        for spell in spells:
            if spell.spell(word):
                ok = True
                break
        if not ok:
            errors.append(word)

    return errors


def should_run_spellcheck(task):
    if len(sys.argv) > 1:
        opts = dict(arg.split(":", 1) for arg in sys.argv[1:])
        command = opts["command"]
        return command in ["add", "append", "log", "modify", "prepend"]
    return False


task = Task.from_input()
if should_run_spellcheck(task):
    errors = spellcheck(task["description"])
    if len(errors) > 0:
        print("Spell errors:", ", ".join(errors))
        if ENV_SKIP not in os.environ:
            sys.exit(1)
print(task.export_data())
