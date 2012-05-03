"=========================================================================================
" vim basic settings
"=========================================================================================
set t_Co=256
set fileencodings=ucs-bom,utf-8,cp936,big5
set enc=utf-8
set tenc=utf-8
set nowb
set backspace=start,indent,eol
set nu!
set autoindent
set smartindent
set wrap
set hlsearch
set noerrorbells
set novisualbell
set ruler
set gfn=terminus\ Regular\ 11
syntax on
set pastetoggle=<F3>

"=========================================================================================
" vim other settings
"=========================================================================================
" >>> list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" >>> debuger
"map <buffer> <S-p> :w<CR>:!clear;/usr/bin/env php % <CR>
map <buffer> <S-y> :w<CR>:!clear;/usr/bin/env python % <CR>

" >>> python pep8
set shiftwidth=4
set softtabstop=4
set tabstop=8
"set textwidth=79
set smarttab
set expandtab
set fileformat=unix

"=========================================================================================
" vundle: the plug-in manager for Vim, https://github.com/gmarik/vundle
"
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" 
" NOTE: comments after Bundle command are not allowed..
"=========================================================================================
" >>> basic settings
set nocompatible
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" >>> bundles 
Bundle 'gmarik/vundle' 
Bundle 'snipmate-snippets'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tmhedberg/SimpylFold'
Bundle 'indentpython.vim'
Bundle 'hallison/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'

" >>> themes
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'github-theme'
Bundle 'darkspectrum'

" >>> other settings
filetype plugin indent on " required!

"=========================================================================================
"" vim color settings, set after bundle load
"=========================================================================================
"colorscheme vombato
"colorscheme github
"colorscheme molokai
colorscheme darkspectrum

"=========================================================================================
" minibufexpl: Elegant buffer explorer, https://github.com/fholgado/minibufexpl.vim
"=========================================================================================
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 

"=========================================================================================
" tagbar: displays tags in a window, https://github.com/majutsushi/tagbar
"=========================================================================================
map <C-t> :TagbarToggle<cr>

"=========================================================================================
" NERDTree: A tree explorer plugin for vim, https://github.com/scrooloose/nerdtree
"=========================================================================================
"map <C-t> :TagbarToggle<cr>
"
"=========================================================================================
" vim-nerdtree-tabs: NERDTree and tabs together, https://github.com/jistr/vim-nerdtree-tabs
"=========================================================================================
map <C-n> :NERDTreeTabsToggle<cr>

"=========================================================================================
" syntastic: Syntax checking hacks for vim, https://github.com/scrooloose/syntastic
"=========================================================================================
map <S-s> :SyntasticCheck<CR>
let g:syntastic_auto_loc_list = 1
