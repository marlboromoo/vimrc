"==============================================================================
" vim basic settings
"==============================================================================
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

"==============================================================================
" vim other settings
"==============================================================================
"" >>> column line
set colorcolumn=80
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929

"" >>> list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" >>> python pep8
set shiftwidth=4
set softtabstop=4
set tabstop=8
"set textwidth=79
set smarttab
set expandtab
set fileformat=unix

"==============================================================================
" vundle: the plug-in manager for Vim, https://github.com/gmarik/vundle
"
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" 
" NOTE: comments after Bundle command are not allowed..
"==============================================================================
" >>> basic settings
set nocompatible
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" >>> bundles 
Bundle 'gmarik/vundle' 
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tmhedberg/SimpylFold'
Bundle 'indentpython.vim'
Bundle 'hallison/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/DrawIt'
Bundle 'davidhalter/jedi-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'vim-scripts/Trac-Wikimarkup'
Bundle 'javacomplete'

" >>> themes
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'Wombat'

" >>> other settings
filetype plugin indent on " required!

"==============================================================================
" Vundle
"==============================================================================
let g:vundle_default_git_proto = 'http'

"==============================================================================
" vim color scheme settings, set after bundle load
"==============================================================================
colorscheme molokai
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929 

"==============================================================================
" snipmate
"==============================================================================
" let g:snips_author = 'Timothy Lee' 

"==============================================================================
" minibufexpl
"==============================================================================
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 

"==============================================================================
" tagbar
"==============================================================================
map <C-t> :TagbarToggle<cr>

"==============================================================================
" NERDTree
"==============================================================================
"map <C-t> :TagbarToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.pyd$', '\~$', '\.swp$', '\.swo$']

"==============================================================================
" vim-nerdtree-tabs
"==============================================================================
map <C-n> :NERDTreeTabsToggle<cr>

"==============================================================================
" syntastic
"==============================================================================
"map <S-s> :SyntasticCheck<CR>
let g:syntastic_auto_loc_list = 1

"==============================================================================
" vim-powerline
"==============================================================================
set laststatus=2

"==============================================================================
" Trac-Wikimarkup
"==============================================================================
au BufRead,BufNewFile *.wiki set filetype=wiki

"==============================================================================
" javacomplete
"==============================================================================
if has("autocmd") 
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
  autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
endif
