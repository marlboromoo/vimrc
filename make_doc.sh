#!/bin/bash
GITHUB_URL='https://github.com'
GITHUB_API_BASE='https://api.github.com'
BASE_REPO=$GITHUB_URL'/vim-scripts'
README_BASE="README.base"
README_PLUGINS="README.plugins"
README="README.md"

function get_plugins_from_vimrc(){
    echo $(cat ~/.vimrc | grep ^Bundle | sed "s/Bundle '//g" | sed "s/'//g" | \
        sed "s/\.git$//g" | cut -d ',' -f 1)
}

function get_plugin_name() {
    plugin=$(echo $1 | cut -sd '/' -f 2)
    if [[ -z "$plugin" ]]; then
        plugin=$1
    fi
    echo $plugin
}

function get_author_name() {
    author=$(echo $1 | cut -sd '/' -f 1)
    if [[ -z "$author" ]]; then
        author=$(basename $BASE_REPO)
    fi
    echo $author
}

function get_plugin_url() {
    echo "$GITHUB_URL/$1/$2"
}

function get_plugin_desc() {
    url=$GITHUB_API_BASE/repos/$1/$2
    desc=$(curl --insecure -u $USERNAME:$PASSWORD -s $url | \
        grep -i 'description' | head -n1 | cut -d ':' -f 2 | \
        sed -e 's/"//g' -e 's/,$//g')
    echo $desc
}

function gen_plugin_md() {
    plugin=$(get_plugin_name $1)
    author=$(get_author_name $1)
    url=$(get_plugin_url $author $plugin)
    desc=$(get_plugin_desc $author $plugin)
    echo '* ['$plugin']''('$url'): '$desc
}

function count(){
    i=0
    for x in $1;
    do
        i=$(($i+1))
    done
    echo $i
}

function merge_plugins_md() {
    head -n+1 $README_PLUGINS >> $README
    tail -n+2 $README_PLUGINS | sort >> $README
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
    merge_plugins_md
}

function gen_md_from_cache() {
    cat $README_BASE > $README
    merge_plugins_md
}

function get_usrpwd_for_github(){
    read -p "GITHUB Username: " USERNAME
    read -s -p "GITHUB Password: " PASSWORD
    echo ''
}

function check_usrpwd_for_github(){
    message=$(curl -s --insecure -u $USERNAME:$PASSWORD \
    $GITHUB_API_BASE/rate_limit | grep -i message)
    if [[ ! -z $message ]]; then
        echo "Bad credentials for Github!"
        exit 1
    fi
}

### main
case $1 in
    cache)
        gen_md_from_cache
        ;;
    update)
        get_usrpwd_for_github
        check_usrpwd_for_github
        PLUGINS=$(get_plugins_from_vimrc)
        gen_md "$PLUGINS"
        ;;
    *)
        echo "USEAGE:$0 {cache|update}"
        ;;
esac
