#!/bin/bash

case $1 in
    *.xml)
        if [ -x "$(command -v xmlstarlet)" ]; then
            exec xmlstarlet fo "$1"
        fi
        ;;
    *.json)
        if [ -x "$(command -v jq)" ]; then
            exec jq -C . "$1"
        elif [ -x "$(command -v python)" ] ; then
            exec python -m json.tool "$1"
        fi
        ;;
    *.md)
        if [ -x "$(command -v pandoc)" ]; then
            exec pandoc -t plain "$1"
        fi
        ;;
    *.csv)
        exec column -t -s, "$1"
        ;;
    *)
        exec /bin/lesspipe "$1"
        ;;
esac

exit 1
