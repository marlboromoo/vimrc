#!/bin/bash
if [[ ! -z "$1" ]]; then
    ./make_doc.sh
    git add .
    git commit -m "$1"
    git push -u origin master --force
else
    echo 'need a comment!'
fi
