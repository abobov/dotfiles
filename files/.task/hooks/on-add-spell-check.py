#!/usr/bin/env python3
from glob import glob
from os.path import isfile, splitext
import os
import re
import sys

try:
    from hunspell import HunSpell
    from tasklib import Task, local_zone
except ImportError as e:
    print(e)
    sys.exit(0)


DICT_PATH = '/usr/share/hunspell/'
LANGS = ['en_US', 'ru_RU']
ENV_SKIP = 'TW_IGNORE_SPELL'


def spellcheck(text):
    spells = []
    for dic in glob(DICT_PATH + '*.dic'):
        aff = splitext(dic)[0] + '.aff'
        if isfile(dic) and isfile(aff):
            spells.append(HunSpell(dic, aff))

    if len(spells) == 0:
        return

    errors = []

    for word in re.findall(r'\w+', text):
        ok = False
        for spell in spells:
            if spell.spell(word):
                ok = True
                break
        if not ok:
            errors.append(word)

    return errors

task = Task.from_input()
errors = spellcheck(task['description'])
if len(errors) > 0:
    print('Spell errors:', ', '.join(errors))
    if not ENV_SKIP in os.environ:
        sys.exit(1)
print(task.export_data())
