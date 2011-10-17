#!/bin/bash

# Based on file from https://github.com/benhoskings/dot-files

set -e
dir="$(cd "$(dirname "$0")" && pwd)"
os=$(uname -o)
ignore="$dir/ignore-$(/bin/hostname)"

filter() {
    fname="$(basename "$@")"
    if [[ "$fname" == "." || "$fname" == ".." ]] ; then
        return 0
    fi
    return $(grep -x -F "$fname" "$ignore" >/dev/null 2>&1)
}

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
ls --format=single-column --directory "$dir"/files/.* | while read f ; do
    filter "$f" ||
    create_link "$f" .
done
