#!/bin/bash
GITHUB_URL='https://github.com'
BASE_REPO=$GITHUB_URL'/vim-scripts'
README_BASE="README.draft"
README="README.md"

function get_plugins_from_vimrc(){
    echo $(cat ~/.vimrc | grep ^Bundle | sed "s/Bundle '//g" | sed "s/'//g")
}

function generate_markdown() {
    PLUGIN=$(echo $1 | cut -sd '/' -f 2)
    if [[ ! -z "$PLUGIN" ]]; then
            URL=$GITHUB_URL'/'$1
        else
            URL=$BASE_REPO'/'$1
            PLUGIN=$1
        fi
    #DESC=$(curl -s $URL | grep 'og:description' | grep -o 'content=".*"' | sed -e 's/content=//g' -e 's/^"//g' -e 's/"$//g')
    DESC=$(curl -s $URL | grep 'repo_description' | grep -o 'value=".*" placeholder' \
        | sed 's/value="//g' | sed 's/" placeholder//g')
    echo '* ['$PLUGIN']''('$URL'): '$DESC
}

function generate_md() {
    cat $README_BASE > $README
    for plugin in $1
    do
        generate_markdown $plugin >> $README
    done
}

### main
PLUGINS=$(get_plugins_from_vimrc)
generate_md "$PLUGINS"

