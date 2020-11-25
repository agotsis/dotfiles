"Alex Gotsis' (agotsis) vimrc

"Start with all of the options
set nocompatible "forget vi backwards compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

set number "Show line numbers
set relativenumber "Show relative line numbers too
set cursorline "Highlight current line
set textwidth=80 "Highlight after this many characters
set colorcolumn=80

"Indent 3 spaces by default
set tabstop=8  "8 space tabs for actual tabs
set shiftwidth=3  "3 space shift
set softtabstop=3  "Tab spaces in no hard tab mode
set expandtab  "Expand tabs into spaces
set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set ruler  "Show bottom ruler

set equalalways  "Split windows equal size
set splitright  "Split to the right

set formatoptions+=croqt  "Enable comment line auto formatting
set formatprg=par\ -w72rq
set comments=sl:/*,mb:*,elx:*/
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:⏎

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

"timeout settings
set ttimeout
set ttimeoutlen=250

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

"cosmetics
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

"remappings...
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"exit insert mode easily
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <esc>
inoremap Jj <esc>
inoremap jJ <esc>
inoremap JJ <esc>

"exit visual mode easily too
vnoremap hj <Esc>
vnoremap lk <Esc>

"Make basic movements work better with wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

"So I can move around in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

"So I can move around in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-p> <Up>
cnoremap <C-j> <Down>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

"map fzf things
nnoremap ? :BLines<CR>
nnoremap <C-o> :Files<CR>

nnoremap <C-x> :Files /t/agotsis-dvx-0/dvx-bora/<CR>

"open last pane
nmap <C-S-p> :vs<bar>:b#<CR>

"Get rid of pesky "ex mode"
nnoremap Q <nop>

"put SOL and EOL and end next to each other
nnoremap - $

let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>
nnoremap <Leader>n :wn<CR>
nnoremap <Leader>= ggVG=
nnoremap <Leader>p gqip
" Shortcut to rapidly toggle `set list`
nnoremap <Leader>l :set list!<CR>
" Shortcut to format everything
nnoremap <Leader>f gqip

"splits navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "":registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>"

"Block editing, does not conflict with paste
noremap q <C-v>

"Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

nnoremap H gT
nnoremap L gt
nnoremap <C-q><k> :tabr<CR>
nnoremap <C-q><j> :tabl<CR>
nnoremap <C-q><h> :tabp<CR>
nnoremap <C-q><l> :tabn<CR>

" sudo write
command Swrite w !sudo tee %

"Plugin updating and installation
command! PU PlugUpdate | PlugUpgrade

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"Strip whitespace from end of lines when writing file
augroup strip_white
  " augroup! strip_white
  "autocmd BufWritePre * let w:wv = winsaveview() | %s/\s\+$//e | call winrestview(w:wv)
augroup END

"Map <F5> to trim whitespace manually
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Map <F9> to set par to 72 chars
nnoremap <F9> :set formatprg=par\ -w72rq <CR>

"Map <F10> to set par to 72 chars
nnoremap <F10> :set formatprg=par\ -w80rq <CR>

"Map <F3> to a spellchecking toggle
nnoremap <F3> :set spell! <CR>

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

" TODO, spellchecking commands
" inoremap <C-k> <C-g>u<Esc>[s1z=`]a<C-g>u
" nnoremap <C-k> [s1z=<C-o>]`]

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

  "turn on spellchecking for mail
  autocmd FileType mail setlocal spell
  autocmd FileType mail %s/^> $//eg | call setpos('.', getpos("''"))
  autocmd FileType mail %s/> >/>>/eg | call setpos('.', getpos("''"))

  "turn on tabs for perforce
  autocmd FileType perforce setlocal spell ts=8 sw=8 sts=0 noexpandtab list colorcolumn=72
augroup END

nnoremap <F7> :setlocal spell ts=8 sw=8 sts=0 noexpandtab list colorcolumn=72<CR>

"Automagically resize splits when the host is resized
autocmd VimResized * wincmd =

if filereadable("~/.vimlcl")
   source ~/.vimlcl
endif

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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " fzf plugin
  Plug 'junegunn/fzf.vim'
call plug#end()

"for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"

"for vim-perforce
let g:perforce_open_on_change = 0

"for NERDtree
nmap <F2> :NERDTreeToggle<CR>

let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"colorscheme
colorscheme molokai

"Invisible character colors
highlight NonText guifg=#999580
highlight SpecialKey guifg=#999580

" vim: softtabstop=2 shiftwidth=2 expandtab
