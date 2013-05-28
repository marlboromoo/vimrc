#!/bin/bash
VUNDLE_PATH=~/.vim/bundle/vundle
VUNDLE_REPO=http://github.com/gmarik/vundle.git
FILES='.vim .vimrc .gvimrc'
CWD=$(dirname $0)

for file in $FILES
do
    mv ~/$file{,.bak} 2>/dev/null
    ln -s $CWD/$file ~/
done
rm -rf $VUNDLE_PATH
git clone $VUNDLE_REPO $VUNDLE_PATH


