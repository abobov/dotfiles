#!/usr/bin/env python3
# Adopted from  https://github.com/tbabej/task.default-date-time
from datetime import time
from tasklib import Task


DEFAULT_TIME = time(22, 0, 0)


def is_local_midnight(timestamp):
    return timestamp.astimezone().time() == time(0, 0, 0)


def set_default_time(timestamp):
    return timestamp.astimezone().replace(
        hour=DEFAULT_TIME.hour, minute=DEFAULT_TIME.minute, second=DEFAULT_TIME.second
    )


task = Task.from_input()
if task["due"] and is_local_midnight(task["due"]):
    task["due"] = set_default_time(task["due"])
    print("Default due time has been set.")

print(task.export_data())
