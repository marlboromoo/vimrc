#!/bin/bash
GITHUB_URL='https://github.com'
BASE_REPO=$GITHUB_URL'/vim-scripts'
README_BASE="README.base"
README_PLUGINS="README.plugins"
README="README.md"

function get_plugins_from_vimrc(){
    echo $(cat ~/.vimrc | grep ^Bundle | sed "s/Bundle '//g" | sed "s/'//g" | \
        sed "s/\.git$//g")
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
    DESC=$(curl --insecure -s $1 | grep 'repo_description' | \
        grep -o 'value=".*" placeholder' | sed 's/value="//g' | \
        sed 's/" placeholder//g')
    echo $DESC
}


function gen_plugin_md() {
    PLUGIN=$(get_plugin_name $1)
    URL=$(get_plugin_url $1)
    DESC=$(get_plugin_desc $URL)
    echo '* ['$PLUGIN']''('$URL'): '$DESC
}

function count(){
    i=0
    for x in $1;
    do
        i=$(($i+1))
    done
    echo $i
}

function gen_md() {
    echo "Please wait .."
    #. base
    cat $README_BASE > $README
    #. plugins
    echo '## Plugins' > $README_PLUGINS
    len=$(count "$1")
    echo "Fetch plugin info .."
    i=0
    for plugin in $1
    do
        i=$(($i+1))
        echo "[$i:$len] $plugin"
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
