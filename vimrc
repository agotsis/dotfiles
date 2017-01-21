set nocompatible  "Kill vi-compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

" Indent 3 spaces
set tabstop=3  "3 space tabs
set shiftwidth=3  "3 space shift
set softtabstop=3  "Tab spaces in no hard tab mode
set expandtab  "Expand tabs into spaces
set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set ruler  "Show bottom ruler

set equalalways  "Split windows equal size

set formatoptions=croq  "Enable comment line auto formatting

set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately

set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
"set number "show line numbers

"mouse options"
if has('mouse')
   set mouse=a
endif
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set paste

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

"colorscheme
colorscheme monokai

" Syntax highlighting and stuff
syntax on
filetype plugin indent on

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
call plug#end()
