"Alex Gotsis' (agotsis) vimrc

"Start with all of the options
set nocompatible "forget vi backwards compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

set number "Show line numbers
set relativenumber "Show relative line numbers too
set cursorline "Highlight current line
set textwidth=120 "Highlight after this many characters

"Indent 2 spaces
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

"Plugin updating and installation
command! PU PlugUpdate | PlugUpgrade

set pastetoggle=<F3>

"Strip whitespace from end of lines when writing file
"autocmd BufWritePre * :%s/\s\+$//e

nnoremap <silent> <c-0> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"highlight trailing whitespace
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <Leader>hw :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>hn :match<CR>

imap <c-k> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-k> [s1z=<c-o>]`]

"check for lines that are too long!
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"tell it to use an undo file
set undofile
"set a directory to store the undo history
set undodir=$HOME/.vim/.vimundo/

"create editor backups
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set backup

"Syntax highlighting and stuff - also implemented by Plug
syntax on
filetype plugin indent on

"per FileType options
autocmd FileType gitcommit setlocal spell "turn on spellchecking for commits

autocmd BufNewFile,BufRead *.vx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vcp set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vxctx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vcpctx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vxh set syntax=verilog_systemverilog

autocmd FileType perforce setlocal spell "turn on spellchecking for perforce
autocmd FileType perforce setlocal noexpandtab "turn on tabs for perforce
autocmd FileType perforce setlocal list "turn on tabs for perforce

"VimPlug plugin manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
"Color scheme
Plug 'tomasr/molokai', { 'dir': '~/.vim/colors/molokai'}
"commenting
Plug 'scrooloose/nerdcommenter'
"Tree explorer
Plug 'scrooloose/nerdtree'
"alternate files with :A
Plug 'agotsis/a.vim'
"git status in gutter
Plug 'airblade/vim-gitgutter'
"git from vim
Plug 'tpope/vim-fugitive'
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
call plug#end()

"for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"

let g:airline_theme='molokai'

"colorscheme
colorscheme molokai

