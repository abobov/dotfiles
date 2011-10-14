#!/bin/bash

# Based on file from https://github.com/benhoskings/dot-files

set -e
dir="$(cd "$(dirname "$0")" && pwd)/files"
os=$(uname -o)

create_windows_link()
{
    target=$target/$(basename "$link")
    rm -rvf "$target"
    if [ -d "$link" ] ; then
        cmd /c mklink /D $(cygpath -w "$target") $(cygpath -w "$link")
    else
        cmd /c mklink $(cygpath -w "$target") $(cygpath -w "$link")
    fi
}

create_link()
{
    local link=$(echo "$1" | sed "s#^$HOME/##")
    local target="$2"
    case "$os" in
        "Cygwin") create_windows_link ;;
        *) ln --verbose --symbolic --force "$link" "$target" ;;
    esac
}

cd &&
ls --format=single-column --directory "$dir"/.* | while read f ; do
    [ "$f" == "$dir/." ] ||
    [ "$f" == "$dir/.." ] ||
    create_link "$f" .
done
