#!/bin/bash

# Based on file from https://github.com/benhoskings/dot-files

set -e
dir="$(cd "$(dirname "$0")" && pwd)"
os=$(uname --operating-system)
CMD=$SYSTEMROOT/System32/cmd.exe

filter() {
    fname="files/$(basename "$@")"
    if [[ "$fname" == "files/." || "$fname" == "files/.." ]] ; then
        return 0
    fi
    return 1
}

create_windows_link()
{
    target=$target/$(basename "$link")
    rm -rvf "$target"
    if [ -d "$link" ] ; then
        $CMD /c mklink /D $(cygpath --windows "$target") $(cygpath --windows "$link")
    else
        $CMD /c mklink $(cygpath --windows "$target") $(cygpath --windows "$link")
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
ls --format=single-column --directory "$dir"/files/.* "$dir"/files/bin | while read f ; do
    filter "$f" ||
    create_link "$f" .
done
