#!/bin/bash
VUNDLE_PATH=~/.vim/bundle/vundle
VUNDLE_REPO=http://github.com/gmarik/vundle.git
FILES='.vim .vimrc .gvimrc'
CWD=$(cd $(dirname $0) && pwd)

for file in $FILES
do
    mv ~/$file ~/$file.$(date +"%s") 2>/dev/null
    ln -s $CWD/$file ~/
done
rm -rf $VUNDLE_PATH
git clone $VUNDLE_REPO $VUNDLE_PATH


