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
set novisualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set tabline=0
" keep temporary files in tempdir
set backupdir=/tmp
set directory=/tmp

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

Bundle 'ctrlpvim/ctrlp.vim'
set rtp^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode="w"
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Bundle 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_enable_fugitive=0
"let g:airline_enable_syntastic=0

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
noremap <Leader>n :NERDTreeToggle<CR>

Bundle 'ervandew/supertab'
"Bundle 'airblade/vim-gitgutter'
Plugin 'MarcWeber/vim-addon-local-vimrc'
" add column highlight when on paren
Plugin 'chreekat/vim-paren-crosshairs'
" guess file indentation style
Plugin 'conormcd/matchindent.vim'
" ececute buffer / selection
Plugin 'JarrodCTaylor/vim-shell-executor'
" swap windows with \ww
Plugin 'wesQ3/vim-windowswap'

"Plugin 'kien/rainbow_parentheses.vim'
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces


" Languages

" Python
Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'django-custom'

" JS
" fixes js indenting
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/vim-coffee-script'
Bundle 'mxw/vim-jsx'
"Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,react'

" CSS
"Bundle 'ap/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'

" HTML
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Plugin 'gregsexton/MatchTag'
"Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mattn/emmet-vim'

" Clojure
"Plugin 'VimClojure'
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
"Bundle 'Raimondi/delimitMate'
Plugin 'amdt/vim-niji'
"Plugin 'guns/vim-clojure-highlight'

" PHP
Plugin 'xsbeats/vim-blade'
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=blade | set omnifunc=htmlcomplete#CompleteTags " Fix blade auto-indent
"patched ctags
"https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags
Bundle 'shawncplus/phpcomplete.vim'
let g:phpcomplete_parse_docblock_comments = 1

" markdown
"requires: $ npm -g install instant-markdown-d
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0
noremap <Leader>md :InstantMarkdownPreview<CR>


" Colorschemes
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'veloce/vim-aldmeris'


" -- required --
filetype plugin indent on

" enable omnicompletion
set omnifunc=syntaxcomplete#Complete

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

autocmd FileType python setlocal sw=4 sts=4 ts=4 ai et wrap
autocmd FileType python setlocal colorcolumn=80
autocmd FileType html,htmldjango setlocal sw=2 ts=2 sts=2
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.tpl,*.html setlocal ft=htmldjango
" HTML indent fix (http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html)
autocmd FileType html setlocal indentkeys-=*<Return>

" cursorline only in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" ------ Colors & GUI ------

" colorscheme default
set t_Co=256
set background=dark
colorscheme aldmeris

"colorscheme kalisi
"highlight ColorColumn ctermbg=8 guibg=gray22

