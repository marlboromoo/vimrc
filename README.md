# Marlboromoo's vimrc
Personal settings/plugins for vim/gvim.

## Install
```
cd ~/
git clone http://marlboromoo@github.com/marlboromoo/vimrc.git
FILES='.vim .vimrc .gvimrc'
for file in $FILES
do
    mv ~/$file{,.bak} 2>/dev/null
    ln -s ./vimrc/$file ./
done
bash ./vimrc/init_vundle.sh
```
type **BundleInstall** in vim's command line 
```
:BundleInstall
```

## Plugins
* [vundle](https://github.com/gmarik/vundle): Vundle, the plug-in manager for Vim
* [snipmate-snippets](https://github.com/marlboromoo/snipmate-snippets): snippets for snipmate
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides): A Vim plugin for visually displaying indent levels in code
* [tlib_vim](https://github.com/tomtom/tlib_vim): Some utility functions for VIM
* [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils): vim: interpret a file by function and cache file automatically
* [vim-snipmate](https://github.com/garbas/vim-snipmate): snipMate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim.
* [tagbar](https://github.com/majutsushi/tagbar): Vim plugin that displays tags in a window, ordered by class etc.
* [nerdtree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim.
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter): Vim plugin for intensely orgasmic commenting
* [vim-statline](https://github.com/millermedeiros/vim-statline): Add useful informations to Vim statusline
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs): NERDTree and tabs together in Vim, painlessly
* [SimpylFold](https://github.com/tmhedberg/SimpylFold): No-BS Python code folding for Vim
* [indentpython.vim](https://github.com/vim-scripts/indentpython.vim): An alternative indentation script for python
* [vim-markdown](https://github.com/hallison/vim-markdown): Markdown syntax highlight for Vim editor with snippets support
* [vim-surround](https://github.com/tpope/vim-surround): surround.vim: quoting/parenthesizing made simple
* [vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with &quot;.&quot;
* [auto-pairs](https://github.com/jiangmiao/auto-pairs): Vim plugin, insert or delete brackets, parens, quotes in pair
* [Trac-Wikimarkup](https://github.com/vim-scripts/Trac-Wikimarkup): Better syntax highlighting for Trac wikimarkup
* [vim-vombato-colorscheme](https://github.com/molok/vim-vombato-colorscheme): Colorscheme forked from Wombat, much more complete than the original
* [molokai](https://github.com/tomasr/molokai): Molokai color scheme for Vim
* [Wombat](https://github.com/vim-scripts/Wombat): Dark gray color scheme sharing some similarities with Desert
