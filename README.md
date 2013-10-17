# Marlboromoo's vimrc
Personal settings/plugins for vim/gvim.

## Installation

### Dependency
```
sudo apt-get install \
build-essential cmake python-dev python-pip python-setuptools xclip
sudo easy_install copycat copycat-clipboard
```

### With Vundle
```
cd ~/
git clone http://marlboromoo@github.com/marlboromoo/vimrc.git
bash ./vimrc/init.sh
vim +BundleInstall +qall
#. Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

### By Hand
Please refer to the document listed below.
* [eclim](http://eclim.org/)

## Key Bindings
`N` : Normal mode, `V` : Virtual mode, `I` : Insert mode

### Navigation
 - `N` `<C-k>` : select the up split
 - `N` `<C-j>` : select the down split
 - `N` `<C-h>` : select the left split
 - `N` `<C-l>` : select the right split
 - `N` `<S-h>` : select the left tab
 - `N` `<S-l>` : select the right tab

### vim-copycat
 - `V` `<C-c>c` : copy into system clipboard or copycat reg 0
 - `I` `<C-c>p` : paste with system clipboard or copycat reg 0
 - `V` `<C-c>C` : like <C-c>c but copy into set reg
 - `I` `<C-c>P` : like <C-c>p but paste from reg
 - `N` `<C-c>l` : show copycat data
 - `N` `<C-c>d` : type reg name then remove copycat reg

### Drawit
 - `N` `<leader>di` : to start **DrawIt**
 - `N` `<leader>ds` : to stop **DrawIt**

### surround.vim
 - `N` `cs`char : change surroundings
 - `N` `ysiw`char : surround a word
 - `N` `yss`char : surround a line
 - `N` `ds`char : delete surroundings

### UltiSnips
 - `I` `<tab>` : expand
 - `I` `<c-tab>` : list snippets (gvim only?)
 - `I` `<c-j>` : jump forward
 - `I` `<c-k>` : jump backward

### MISC
 - `N` `<S-k>` : show python documentation
 - `N` `<C-p>` : toggle **ctrlp.vim** window
 - `N` `<leader>l` : toggle the list options(to show the custome characters)
 - `N` `<leader>ta` : toggle the **tagbar** window
 - `N` `<leader>tr` : toggle the **NERDTree** window
 - `N` `<leader><leader>w` : trigger the **vim-easymotion**.
 - `N` `.` : repeat the last command

## Plugins
* [auto-pairs](https://github.com/jiangmiao/auto-pairs): Vim plugin, insert or delete brackets, parens, quotes in pair
* [ctrlp.vim](https://github.com/kien/ctrlp.vim): Fuzzy file, buffer, mru, tag, etc finder.
* [DrawIt](https://github.com/vim-scripts/DrawIt): Ascii drawing plugin
* [indentLine](https://github.com/Yggdroot/indentLine): A vim plugin to display the indention levels with thin vertical lines
* [indentpython.vim](https://github.com/vim-scripts/indentpython.vim): An alternative indentation script for python
* [jedi-vim](https://github.com/davidhalter/jedi-vim): Using the jedi autocompletion library for VIM.
* [molokai](https://github.com/tomasr/molokai): Molokai color scheme for Vim
* [nerdtree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim.
* [rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim): Better Rainbow Parentheses
* [SimpylFold](https://github.com/tmhedberg/SimpylFold): No-BS Python code folding for Vim
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim
* [tagbar](https://github.com/majutsushi/tagbar): Vim plugin that displays tags in a window, ordered by class etc.
* [TagmaTasks](https://github.com/vim-scripts/TagmaTasks): IDE like Task List for Vim buffers.
* [Toy-Chest-Theme](https://github.com/marlboromoo/Toy-Chest-Theme): A \Flat-UI\ color scheme for programmers who like to play.
* [ultisnips](https://github.com/SirVer/ultisnips): Official Mirror of UltiSnips trunk on LaunchPad. Send pull requests to SirVer/ultisnips!
* [vim-airline](https://github.com/bling/vim-airline): lean & mean status/tabline for vim that's light as air
* [vim-copycat](https://github.com/georgefs/vim-copycat): 
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion): Vim motions on speed!
* [vim-flavored-markdown](https://github.com/jtratner/vim-flavored-markdown): null
* [vim-fugitive](https://github.com/tpope/vim-fugitive): fugitive.vim
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs): NERDTree and tabs together in Vim, painlessly
* [vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim
* [vim-surround](https://github.com/tpope/vim-surround): surround.vim
* [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace): Highlights trailing whitespace in red and provides
* [vim-vombato-colorscheme](https://github.com/molok/vim-vombato-colorscheme): Colorscheme forked from Wombat, much more complete than the original
* [vundle](https://github.com/gmarik/vundle): Vundle, the plug-in manager for Vim
* [Wombat](https://github.com/vim-scripts/Wombat): Dark gray color scheme sharing some similarities with Desert
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): A code-completion engine for Vim
