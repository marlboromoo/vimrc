#!/bin/bash
if [[ ! -z "$1" ]]; then
    read -p 'Create document? (y/n)' ANSWER
    if [[ "$ANSWER" == 'y' ]]; then
        ./make_doc.sh
    fi
    git add .
    git commit -m "$1"
    read -p 'Push to GitHub? (y/n)' ANSWER
    if [[ "$ANSWER" == 'y' ]]; then
        git push -u origin master --force
    fi
else
    echo 'Need a comment!'
fi
