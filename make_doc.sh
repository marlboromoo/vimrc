#!/bin/bash
GITHUB_URL='https://github.com'
BASE_REPO=$GITHUB_URL'/vim-scripts'
README_BASE="README.base"
README_PLUGINS="README.plugins"
README="README.md"

function get_plugins_from_vimrc(){
    echo $(cat ~/.vimrc | grep ^Bundle | sed "s/Bundle '//g" | sed "s/'//g")
}

function get_plugin_name() {
    PLUGIN=$(echo $1 | cut -sd '/' -f 2)
    if [[ -z "$PLUGIN" ]]; then
        PLUGIN=$1
    fi
    echo $PLUGIN
}

function get_plugin_url() {
    PLUGIN=$(echo $1 | cut -sd '/' -f 2)
    if [[ ! -z "$PLUGIN" ]]; then
            URL=$GITHUB_URL'/'$1
        else
            URL=$BASE_REPO'/'$1
            PLUGIN=$1
    fi
    echo $URL
}

function get_plugin_desc() {
    #DESC=$(curl -s $URL | grep 'og:description' | grep -o 'content=".*"' | sed -e 's/content=//g' -e 's/^"//g' -e 's/"$//g')
    DESC=$(curl -s $1 | grep 'repo_description' | grep -o 'value=".*" placeholder' \
        | sed 's/value="//g' | sed 's/" placeholder//g')
    echo $DESC
}


function gen_plugin_md() {
    PLUGIN=$(get_plugin_name $1)
    URL=$(get_plugin_url $1)
    DESC=$(get_plugin_desc $URL)
    echo '* ['$PLUGIN']''('$URL'): '$DESC
}

function gen_md() {
    #. base
    cat $README_BASE > $README
    #. plugins
    echo '## Plugins' > $README_PLUGINS
    for plugin in $1
    do
        gen_plugin_md $plugin >> $README_PLUGINS
    done
    #. merge
    cat $README_PLUGINS >> $README
}

function gen_md_from_cache() {
    cat $README_BASE > $README
    cat $README_PLUGINS >> $README
}

### main
case $1 in
    cache)
        gen_md_from_cache
        ;;
    update)
        PLUGINS=$(get_plugins_from_vimrc)
        gen_md "$PLUGINS"
        ;;
    *)
        echo "USEAGE:$0 {cache|update}"
        ;;
esac
