#!/bin/bash

FILES='.vim .vimrc .gvimrc'
for file in $FILES
do
    mv ~/$file{,.bak} 2>/dev/null
    ln -s ./vimrc/$file ./
done
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


