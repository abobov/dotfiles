#!/bin/bash

set -e

DEFAULT_MODULE_NAME="vim/"
DEFAULT_MODULE_PATH="files/.vim/bundle/"

read -p "Enter module git source: " MODULE_SOURCE

if [[ "$MODULE_SOURCE" == *"//github.com/"* ]] ; then
    DEFAULT_MODULE_NAME="$DEFAULT_MODULE_NAME${MODULE_SOURCE##*\/}"
fi

read -p "Enter module name (ex: vim/ledger): " -i "$DEFAULT_MODULE_NAME" -e MODULE_NAME
read -p "Enter module path: " -i "$DEFAULT_MODULE_PATH${MODULE_NAME#*\/}" -e MODULE_PATH


cat <<EOM
Check module options:

    URL : $MODULE_SOURCE
    Name: $MODULE_NAME
    Path: $MODULE_PATH

EOM

read -p "Add module? (y/N) " -e ADD_ANSWER

if [[ "$ADD_ANSWER" == "y" ]] ; then
    git submodule add --name "$MODULE_NAME" "$MODULE_SOURCE" "$MODULE_PATH"
fi
