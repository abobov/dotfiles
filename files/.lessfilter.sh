#!/bin/sh

case $1 in
    *.xml) if [ -x `which xmlstarlet 2>/dev/null` ]; then exec xmlstarlet fo "$1"; fi ;;
    *.json) if [ -x `which jq 2>/dev/null` ]; then exec jq -C . "$1"; fi ;;
    *.md) if [ -x `which pandoc 2>/dev/null` ]; then exec pandoc -t plain "$1"; fi ;;
    *) exec /bin/lesspipe "$1";;
esac

exit 1
