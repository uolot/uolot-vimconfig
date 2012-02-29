" ------ Misc. options ------

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

Bundle 'msanders/snipmate.vim'
inoremap <c-j> <c-r>=TriggerSnippet()<cr>
snoremap <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

" TODO read docs
" Bundle 'vim-scripts/TaskList.vim'

Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'

" TODO read docs
" Bundle 'rstacruz/sparkup'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" TODO read docs
" Bundle 'fs111/pydoc.vim'

" TODO read docs
Bundle 'amitdev/vimpy'

Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/vim-coffee-script'
" fixes js indenting
Bundle 'pangloss/vim-javascript'
Bundle 'alfredodeza/konira.vim'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'

"Bundle 'scrooloose/syntastic'

" Colorscheme
Bundle 'sjl/badwolf'

" -- required --
filetype plugin indent on


" ------ Key mappings ------

inoremap ;; <Esc>

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
nnoremap <silent> <C-PageUp> :bp<CR>
nnoremap <silent> <C-PageDown> :bn<CR>

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

autocmd FileType python setlocal sw=4 sts=4 ts=8 tw=79 ai et
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal omnifunc=python#Python
autocmd BufRead,BufNewFile *.tpl setlocal ft=htmldjango

" cursorline only in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" ------ Colors & GUI ------

colorscheme default

if has('gui_running')
  colorscheme badwolf

  set guifont=UbuntuMono\ 11

  " hide menu- and toolbar
  set guioptions-=m
  set guioptions-=T
endif

