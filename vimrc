" ------ Index ------
" Misc. options
" Search options
" Lines wraping
" Indenting
" Vundle
" Bundles
" Key mappings
" AutoCmd
" Colors & GUI



" ------ Misc. options ------

syntax on
set nocompatible
set number
set encoding=utf-8
set scrolloff=4
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest,list
set wildignore+=*.pyc,*.jpg,*.png,*.swp,*.tmp
set wildignore+=.git,.svn,tmp
set wildignore+=.gitignore
set novisualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

" ------ Search options ------
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set nohlsearch
set showmatch
nnoremap <F9> :set hlsearch<CR>
nnoremap <F10> :set nohlsearch<CR>
set tags=./tags,tags
set tagrelative

" ------ Lines wraping ------
set wrap
set formatoptions=crqn1
" set colorcolumn=80

" ------ Indenting ------

set shiftwidth=4
set tabstop=4
set tabstop=4
set textwidth=100
set autoindent
set expandtab
set list listchars=tab:▸\ ,extends:¬,trail:∎


" ------ Vundle ------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" ------ Bundles ------

Bundle 'gmarik/vundle'
Bundle 'L9'

Bundle 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_enable_fugitive=0
"let g:airline_enable_syntastic=0

Bundle 'ervandew/supertab'

" Disabled bundles
Bundle 'airblade/vim-gitgutter'

" TODO: Read docs / start using :)
"Bundle 'Lokaltog/vim-easymotion'
" Bundle 'fs111/pydoc.vim'
" Bundle 'vim-scripts/TaskList.vim'
" Bundle 'amitdev/vimpy'
" Bundle 'scrooloose/syntastic'
" Bundle 'xolox/vim-easytags'


" Bundle 'msanders/snipmate.vim'
"inoremap <c-j> <c-r>=TriggerSnippet()<cr>
"snoremap <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>


" Languages

" JS
" fixes js indenting
Bundle 'pangloss/vim-javascript'
Bundle 'walm/jshint.vim'
Bundle 'vim-scripts/vim-coffee-script'

" CSS
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'

" Python
"Bundle 'klen/python-mode'
"let g:pymode_folding = 0
"let g:pymode_rope_extended_complete=1
"let g:pymode_lint_ignore = 'E501,W901,W404,E128'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'davidhalter/jedi-vim'
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#popup_on_dot = 0

" HTML
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'

" Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'Raimondi/delimitMate'

" Colorschemes
Bundle 'sjl/badwolf'
Bundle 'shawncplus/skittles_berry'
Bundle 'hukl/Smyck-Color-Scheme'
Bundle 'tomasr/molokai'
Bundle 'veloce/vim-aldmeris'
Bundle 'vim-scripts/IDLE'
Bundle 'therubymug/vim-pyte'


" -- required --
filetype plugin indent on


" ------ Key mappings ------

" make Y compatible with C, D...
nnoremap Y y$

" reselect visual block after (un)indent
vnoremap < <gv
vnoremap > >gv

" create splits
nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>

" jump between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" switch between buffers
nnoremap <silent> <C-Left> :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
" switch between tabs
nnoremap <silent> <C-Down> :tabnext<CR>
nnoremap <silent> <C-Up> :tabprev<CR>

" perserve column
nnoremap j gj
nnoremap k gk

nnoremap ; :
nnoremap : ;
vmap ; :


function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <silent> <F5> :call NumberToggle()<cr>
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" ------ AutoCmd ------

autocmd FileType python setlocal sw=4 sts=4 ts=8 tw=79 ai et wrap
autocmd FileType python setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.tpl,*.html setlocal ft=htmldjango
" HTML indent fix (http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html)
autocmd FileType html setlocal indentkeys-=*<Return>

" cursorline only in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" ------ Colors & GUI ------

" colorscheme default
set t_Co=256
colorscheme aldmeris

if has('gui_running')
  " colorscheme badwolf
  "colorscheme molokai

  set guifont=Consolas\ 10
  "set guifont=M+1mn\ 11
  set lsp=-2

  " hide menu and toolbar
  set guioptions-=m
  set guioptions-=T

  " disable scrollbars
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
endif
"2345678912345678912345678912345678912345678912345678912345678900000001234567890
