#!/bin/bash

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

create_windows_link() {
    fp=$1
    tp=$2
    opt=""
    if [ -d "$fp" ] ; then
        opt="/D"
    fi
    if [[ 1 = $OVERRIDE ]] ; then
        rm --recursive --force "$tp"
    else
        rm --force "$tp"
    fi
    $CMD /c mklink $opt $(cygpath --windows "$tp") $(cygpath --windows "$fp") >/dev/null
}

create_link() {
    while read fp tp ; do
        case "$os" in
            "Cygwin") create_windows_link "$fp" "$tp" ;;
            *) ln --symbolic --force --no-target-directory "$fp" "$tp" ;;
        esac
    done
}

after_install() {
    mkdir -p $HOME/tmp/vim-undo $HOME/tmp/vim-backup
    mkdir -p $HOME/.mutt/cache
    touch $HOME/.mutt/aliases
    if ! which ctags >/dev/null 2>&1; then
        echo 'No ctags.' >&2
    fi
    cd $HOME/.vim/bundle/Command-T/ruby/command-t && make >/dev/null
}

check_override() {
    while read filename ; do
        fp=$dir/files/$filename
        tp=$HOME/$filename
        if [[ 1 != $OVERRIDE ]] ; then
            rp=$(readlink -f "$tp")
            if [[ -e "$rp" && "$rp" != "$fp" ]] ; then
                echo "Skip: $filename" >&2
                continue
            fi
        fi
        echo "$fp" "$tp"
    done
}

if [[ "-f" = "$1" ]] ; then
    OVERRIDE=1
fi

cd && \
    ( ls --format=single-column --almost-all "$dir/files" | check_override | create_link ) && \
    after_install
