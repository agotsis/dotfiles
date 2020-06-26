"Alex Gotsis' (agotsis) vimrc

"Start with all of the options
set nocompatible "forget vi backwards compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

set number "Show line numbers
" set relativenumber "Show relative line numbers too
set cursorline "Highlight current line
set textwidth=80 "Highlight after this many characters
set colorcolumn=80

"Indent 2 spaces by default
set tabstop=2  "2 space tabs
set shiftwidth=2  "2 space shift
set softtabstop=2  "Tab spaces in no hard tab mode
set expandtab  "Expand tabs into spaces
set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set ruler  "Show bottom ruler

set equalalways  "Split windows equal size

set formatoptions=croq  "Enable comment line auto formatting
set comments=sl:/*,mb:*,elx:*/
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc "Ignore junk files
set title  "Set window title to file
set hlsearch  "Highlight on search
set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcasexr: - case sensitive when use capital letters
set incsearch  "Start searching immediately
set showcmd
set incsearch
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set breakindent
set breakindentopt=sbr
set showbreak=↪
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set virtualedit=block "allow virtual block editing
set autowrite "Automatically save before commands like :next and :make

"use an undo file
set undofile
"set a directory to store the undo history
set undodir=$HOME/.vim/.vimundo/

"create editor backups
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set backup

"mouse options
if has('mouse')
  set mouse=a
endif

"remappings...
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"exit insert mode easily
imap jk <Esc>
imap kj <Esc>
imap jj <esc>
imap Jj <esc>
imap jJ <esc>
imap JJ <esc>

"put SOL and EOL and end next to each other
nnoremap - $

let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>
nnoremap <Leader>n :wn<CR>
nnoremap <Leader>= ggVG=

"splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "":registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>"

"Block editing, does not conflict with paste
noremap q <c-v>

"Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

" sudo write
command Swrite w !sudo tee %

"Plugin updating and installation
command! PU PlugUpdate | PlugUpgrade

nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

"Strip whitespace from end of lines when writing file
augroup strip_white
  augroup! strip_white
  "autocmd BufWritePre * let w:wv = winsaveview() | %s/\s\+$//e | call winrestview(w:wv)
augroup END

"Map <F5> to trim whitespace manually
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"highlight trailing whitespace
augroup high_white
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

nnoremap <Leader>hw :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>hn :match<CR>

"TODO ?
imap <c-k> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-k> [s1z=<c-o>]`]

" FileType setting commands
augroup vsv_type
  autocmd BufNewFile,BufRead *.{v,sv} set syntax=verilog_systemverilog
augroup END

augroup scons_type
  autocmd BufNewFile,BufRead *.sc set syntax=python
augroup EWD

augroup perfile_local
  "per FileType options
  "turn on spellchecking for commits
  autocmd FileType gitcommit,conf autocmd! high_white
  autocmd FileType gitcommit,conf setlocal spell
  autocmd FileType gitcommit,conf hi clear ExtraWhitespace

  "turn on tabs for perforce
  autocmd FileType perforce setlocal spell ts=2 sw=2 sts=0 noexpandtab list
augroup END

nnoremap <F7> :setlocal spell ts=2 sw=2 sts=0 noexpandtab list<CR>

"Syntax highlighting and stuff - also implemented by Plug
syntax on
filetype plugin indent on

"VimPlug plugin manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
  "Color scheme
  Plug 'tomasr/molokai', { 'dir': '~/.vim/colors/molokai'}
  "commenting
  Plug 'scrooloose/nerdcommenter'
  "Tree explorer
  Plug 'scrooloose/nerdtree'
  "alternate files with :A
  "Plug 'agotsis/a.vim'
  "git status in gutter
  Plug 'airblade/vim-gitgutter'
  "git from vim
  "Plug 'tpope/vim-fugitive'
  "delimiter changing
  Plug 'tpope/vim-surround'
  "delimiter autocompletion
  "Plug 'Raimondi/delimitMate'
  "Plug 'jiangmiao/auto-pairs'
  Plug 'vim-syntastic/syntastic'
  "tab completion
  Plug 'ervandew/supertab'
  "SystemVerilog
  "Plug 'vhda/verilog_systemverilog.vim'
  "Automatic set paste
  Plug 'conradirwin/vim-bracketed-paste'
  " vim-perforce integration
  Plug 'nfvs/vim-perforce'
  " cscope vim
  Plug 'chazy/cscope_maps'
call plug#end()

"for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"

"for vim-perforce
let g:perforce_open_on_change = 1

"for NERDtree
nmap <F6> NERDTreeToggle<CR>

"colorscheme
colorscheme molokai

set pastetoggle=<F>
