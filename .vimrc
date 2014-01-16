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
"set gfn=terminus\ Regular\ 11
set gfn=Terminess\ Powerline
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

" >>> Avoid the escape key
imap ii <Esc>

" >>> Shortcut to close the window, e.g., help window.
nmap q :q<CR>

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
Bundle 'Valloric/YouCompleteMe'
"Bundle 'mhinz/vim-startify'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'TagmaTasks'
Bundle 'marlboromoo/vim-copycat'
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'dgryski/vim-godef'
"Bundle 'edkolev/tmuxline.vim'
Bundle 'benmills/vimux'
Bundle 'fs111/pydoc.vim'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'tpope/vim-vinegar'

" >>> bundles - snippets
Bundle 'SirVer/ultisnips'

" >>> bundles - color scheme
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'Wombat'
Bundle 'marlboromoo/Toy-Chest-Theme', {'rtp': 'themes/Vim/'}
Bundle 'marlboromoo/vim-vitamins'
Bundle 'marlboromoo/mustang-vim'
Bundle 'zeis/vim-kolor'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" >>> bundles - doc
Bundle 'dahu/LearnVim'

" >>> other settings
filetype plugin indent on " required!

"==============================================================================
" Vundle
"==============================================================================
let g:vundle_default_git_proto = 'http'

"==============================================================================
" vim color scheme settings, set after bundle load
"==============================================================================
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929
colorscheme jellybeans

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
let g:syntastic_auto_loc_list = 2
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_python_checkers=['pyflakes']
"let g:syntastic_python_checkers=['pylint']
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_java_checkers = []

"==============================================================================
" vim-powerline
"==============================================================================
set laststatus=2

"==============================================================================
" eclim
"==============================================================================
let g:EclimCompletionMethod = 'omnifunc'
au Filetype java nnoremap <silent> <buffer> <S-k> :JavaDocSearch -x declarations<cr>

func! JavaFormatter()
    % JavaFormat
    set ft=java
endfunc
"au FileType java au BufWritePre <buffer> :call JavaFormatter()

"==============================================================================
" jedi
"==============================================================================
let g:jedi#completions_enabled = 0

"==============================================================================
" YouCompleteMe
"==============================================================================
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
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
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#eclim#enabled = 1

"==============================================================================
" vim-flavored-markdown
"==============================================================================
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

"==============================================================================
" vim-golang
"==============================================================================
au FileType go au BufWritePre <buffer> Fmt
au Filetype go nmap <silent> <s-k> :Godoc<CR>
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

"==============================================================================
" vim-godef
"==============================================================================
"g:godef_split=0
"g:godef_same_file_in_same_window=1

"==============================================================================
" ctags
"==============================================================================
"au BufWritePost *.go silent! !ctags -R *.go &
"au BufWritePost *.py silent! !ctags -R *.py &

"==============================================================================
" vimux
"==============================================================================
 " Prompt for a command to run
 map <Leader>tp :VimuxPromptCommand<CR>
 " Run last command executed by VimuxRunCommand
 map <Leader>tl :VimuxRunLastCommand<CR>
 " Inspect runner pane
 map <Leader>ti :VimuxInspectRunner<CR>
 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>tq :VimuxCloseRunner<CR>
 " Interrupt any command running in the runner pane
 map <Leader>tx :VimuxInterruptRunner<CR>
