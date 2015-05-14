#!/usr/bin/env bash

while IFS=, read source path
do
    if [ -d "$path" ]; then
        cd $path
        git pull
        cd -
    else
        git clone --depth 1 $source $path
        cd $path
        git config core.sparsecheckout true
        echo docs/ > .git/info/sparse-checkout
        echo README.rst >> .git/info/sparse-checkout
        echo CHANGES.rst >> .git/info/sparse-checkout
        git read-tree -m -u HEAD
        cd -
    fi
done < externals.txt
find . -type l -exec test ! -e {} \; -delete
