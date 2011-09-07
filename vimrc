" ------ Misc. options ------

set nocompatible
" set number
set relativenumber
set encoding=utf-8
set scrolloff=4
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set novisualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
" set undodir=.
            
" ------ Search options ------
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set nohlsearch
set showmatch
nnoremap <F9> :hlsearch<CR>
nnoremap <F10> :nohlsearch<CR>
nnoremap <Tab> %
vnoremap <Tab> %

" ------ Lines wraping ------
set wrap
set formatoptions=crqn1
set colorcolumn=80

" ------ Indenting ------

set shiftwidth=4
set tabstop=4
set tabstop=4
set textwidth=79
set autoindent
set expandtab
set listchars=tab:▸\ ,eol:¬


" ------ Vundle ------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" ------ Bundles ------

Bundle 'gmarik/vundle'

Bundle 'L9'

Bundle 'FuzzyFinder'
nnoremap <Leader>b :FufBuffer<CR>
nnoremap <Leader>f :FufFile<CR>
nnoremap <Leader>F :FufFileWithFullCwd<CR>

Bundle 'scrooloose/nerdtree'
nnoremap <Leader>p :NERDTreeToggle<CR>

Bundle 'msanders/snipmate.vim'
" TODO read docs
Bundle 'vim-scripts/TaskList.vim' 
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
" TODO read docs
Bundle 'rstacruz/sparkup'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/ShowMarks'

" -- required --
filetype plugin indent on


" ------ Key mappings ------

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk


" ------ AutoCmd ------

autocmd FileType python setlocal sw=4 sts=4 ts=8 tw=79 ai et


" ------ Colors & GUI ------

let moria_style='dark'
colorscheme moria

if has('gui_running')
  set guifont=Monaco\ 10
endif

