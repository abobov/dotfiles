#!/bin/bash

# Based on file from https://github.com/benhoskings/dot-files

set -e
dir=dot-files/files

cd &&
ls --format=single-column --directory $dir/{,.}* | while read f ; do
    [ "$f" == "$dir/." ] ||
    [ "$f" == "$dir/.." ] ||
    ln --verbose --symbolic --force "$f" ~/test/
done
