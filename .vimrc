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
"let mapleader = ","

"=========================================================================================
" vim other settings
"=========================================================================================
"" >>> column line
set colorcolumn=80
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929

"" >>> list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" >>> debuger
"map <buffer> <S-p> :w<CR>:!clear;/usr/bin/env php % <CR>
"map <buffer> <S-y> :w<CR>:!clear;/usr/bin/env python % <CR>

" >>> python pep8
set shiftwidth=4
set softtabstop=4
set tabstop=8
"set textwidth=79
set smarttab
set expandtab
set fileformat=unix

" >>> filetype
au BufRead,BufNewFile *.wiki set filetype=wiki

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
Bundle 'marlboromoo/snipmate-snippets'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/vim-statline'
"Bundle 'millermedeiros/vim-statline'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tmhedberg/SimpylFold'
Bundle 'indentpython.vim'
Bundle 'hallison/vim-markdown'
"Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-fugitive'

" >>> trac ui
"Bundle 'nsmgr8/vitra'
"Bundle 'vim-scripts/Align'
"Bundle 'vim-scripts/tracwiki'
Bundle 'vim-scripts/Trac-Wikimarkup'

" >>> themes
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'Wombat'

" >>> other settings
filetype plugin indent on " required!

"=========================================================================================
" Vundle, the plug-in manager for Vim, https://github.com/gmarik/vundle
"=========================================================================================
let g:vundle_default_git_proto = 'http'

"=========================================================================================
" vim color settings, set after bundle load
"=========================================================================================
colorscheme molokai
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929 

"=========================================================================================
" snipmate: Plugin for using TextMate-style snippets in Vim.
"=========================================================================================
let g:snips_author = 'Timothy Lee' 

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
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.pyd$', '\~$', '\.swp$', '\.swo$']
"=========================================================================================
" vim-nerdtree-tabs: NERDTree and tabs together, https://github.com/jistr/vim-nerdtree-tabs
"=========================================================================================
map <C-n> :NERDTreeTabsToggle<cr>

"=========================================================================================
" syntastic: Syntax checking hacks for vim, https://github.com/scrooloose/syntastic
"=========================================================================================
""map <S-s> :SyntasticCheck<CR>
let g:syntastic_auto_loc_list = 1

"=========================================================================================
" vitra : Vim client for Trac, https://github.com/nsmgr8/vitra
"=========================================================================================
"let g:tracServerList = {}
"let g:tracServerList['PDC00'] = {
"    \ 'scheme': 'http',
"    \ 'auth': 'vimadmin:1qaz2wsx:trac.104cloud.com.tw',
"    \ 'server': 'trac.104cloud.com.tw/PDC00',
"    \ 'rpc_path': '/login/rpc',
"    \ 'auth_type': 'digest',
"    \ }
"let g:tracServerList['OpenPlatform'] = {
"    \ 'scheme': 'http',
"    \ 'auth': 'vimadmin:1qaz2wsx:trac.104cloud.com.tw',
"    \ 'server': 'trac.104cloud.com.tw/OpenPlatform',
"    \ 'rpc_path': '/login/rpc',
"    \ 'auth_type': 'digest',
"    \ }
"let g:tracDefaultServer = 'PDC00'

"=========================================================================================
" vim-powerline : The ultimate vim statusline utility, https://github.com/Lokaltog/vim-powerline
"=========================================================================================
set laststatus=2

"=========================================================================================
" auto-pairs : Insert or delete brackets, parens, quotes in pair, https://github.com/jiangmiao/auto-pairs
"=========================================================================================
