#!/bin/bash
GITHUB_URL='https://github.com'
GITHUB_API_BASE='https://api.github.com/repos'
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

function get_author_name() {
    AUTHOR=$(echo $1 | cut -sd '/' -f 1)
    if [[ -z "$AUTHOR" ]]; then
        AUTHOR=$(echo $BASE_REPO | cut -d '/' -f 2)
    fi
    echo $AUTHOR
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
    url=$GITHUB_API_BASE/$1/$2
    DESC=$(curl --insecure -u $USERNAME:$PASSWORD -s $url | grep -i 'description' | \
        cut -d ':' -f 2 | sed -e 's/"//g' -e 's/,$//g')
    echo $DESC
}

function gen_plugin_md() {
    PLUGIN=$(get_plugin_name $1)
    AUTHOR=$(get_author_name $1)
    URL=$(get_plugin_url $1)
    DESC=$(get_plugin_desc $AUTHOR $PLUGIN)
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

function get_usrpwd_for_github(){
    read -p "GITHUB Username: " USERNAME
    read -s -p "GITHUB Password: " PASSWORD
}

### main
case $1 in
    cache)
        gen_md_from_cache
        ;;
    update)
        get_usrpwd_for_github
        PLUGINS=$(get_plugins_from_vimrc)
        gen_md "$PLUGINS"
        ;;
    *)
        echo "USEAGE:$0 {cache|update}"
        ;;
esac
