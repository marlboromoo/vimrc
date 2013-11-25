"
"
"    ___  ___           _ _                    ___  ___            
"    |  \/  |          | | |                   |  \/  |            
"    | .  . | __ _ _ __| | |__   ___  _ __ ___ | .  . | ___   ___  
"    | |\/| |/ _` | '__| | '_ \ / _ \| '__/ _ \| |\/| |/ _ \ / _ \ 
"    | |  | | (_| | |  | | |_) | (_) | | | (_) | |  | | (_) | (_) |
"    \_|  |_/\__,_|_|  |_|_.__/ \___/|_|  \___/\_|  |_/\___/ \___/ 's vimrc
"
"
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
let mapleader = ","

"==============================================================================
" vim other settings
"==============================================================================
" >>> copy/paste, ref:http://superuser.com/questions/214715/map-shift-insert-in-vim
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" >>> column line
set colorcolumn=80
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929

" >>> complete
"set completeopt=menu,preview
set completeopt=menu,longest,menuone

" >>> list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" >>> folding
set nofoldenable

" >>> python pep8
set shiftwidth=4
set softtabstop=4
set tabstop=8
"set textwidth=79
set smarttab
set expandtab
set fileformat=unix

" >>> Easier split navigation - Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" >>> Easier tab navigation - Use shift-[hl] to select the tab!
nnoremap <S-h> gT
nnoremap <S-l> gt

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
Bundle 'Yggdroot/indentLine'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tmhedberg/SimpylFold'
Bundle 'indentpython.vim'
"Bundle 'hallison/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/DrawIt'
Bundle 'davidhalter/jedi-vim'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'javacomplete'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'mhinz/vim-startify'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'TagmaTasks'
Bundle 'marlboromoo/vim-copycat'
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" >>> bundles - snippets
Bundle 'SirVer/ultisnips'

" >>> bundles - color scheme
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'Wombat'
Bundle 'marlboromoo/Toy-Chest-Theme', {'rtp': 'Vim/'}

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
map <leader>ta :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_map_help = '?'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"==============================================================================
" NERDTree
"==============================================================================
let NERDTreeIgnore=[
            \ '\.pyc$', '\.pyo$', '\.pyd$',
            \ '\~$', '\.swp$', '\.swo$', '\.class$']

"==============================================================================
" vim-nerdtree-tabs
"==============================================================================
map <leader>tr :NERDTreeTabsToggle<cr>

"==============================================================================
" syntastic
"==============================================================================
"map <S-s> :SyntasticCheck<CR>
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers=['pyflakes']
"let g:syntastic_python_checkers=['pylint']

"==============================================================================
" vim-powerline
"==============================================================================
set laststatus=2

"==============================================================================
" javacomplete
"==============================================================================
"if has("autocmd")
"  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"  autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
"endif

"==============================================================================
" eclim
"==============================================================================
let g:EclimCompletionMethod = 'omnifunc'
if has("autocmd")
  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
endif

"==============================================================================
" jedi
"==============================================================================
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0

"==============================================================================
" YouCompleteMe
"==============================================================================
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_cache_omnifunc = 1

"==============================================================================
" ultisnips
"==============================================================================
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"==============================================================================
" airline
"==============================================================================
let g:airline#extensions#syntastic#enabled = 0

"==============================================================================
" vim-flavored-markdown
"==============================================================================
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

"==============================================================================
" vim-golang
"==============================================================================
"au FileType go au BufWritePre <buffer> Fmt

"==============================================================================
" ctags
"==============================================================================
"au BufWritePost *.go silent! !ctags -R *.go &
"au BufWritePost *.py silent! !ctags -R *.py &

