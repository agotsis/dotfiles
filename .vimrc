" Alex Gotsis (agotsis) vimrc

" Start with all of the options
set nocompatible " forget vi backwards compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

set number "Show line numbers
set cursorline "Highlight current line
set textwidth=120 " Highlight after this many characters

" Indent 2 spaces
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
set autowrite " Automatically save before commands like :next and :make

" mouse options
if has('mouse')
   set mouse=a
endif

" remappings...
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

let mapleader = "\\"
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>e :wq<CR>
nnoremap <Space>n :wn<CR>
nnoremap <Space>= ggVG=
nmap <Space><Space> V

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>"

" Block editing, does not conflict with paste
noremap q <c-v>

" Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

set pastetoggle=<F3>

" Strip whitespace from end of lines when writing file
" autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType gitcommit setlocal spell "turn on spellchecking for commits

nnoremap <silent> <c-0> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen"

" highlight trailing whitespace
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

imap <c-k> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-k> [s1z=<c-o>]`]

" check for lines that are too long!
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=$HOME/.vim/.vimundo/

" create editor backups
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set backup

" colorscheme
colorscheme molokai

" Syntax highlighting and stuff
syntax on
filetype plugin indent on

autocmd BufNewFile,BufRead *.vx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vcp set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vxctx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vcpctx set syntax=verilog_systemverilog
autocmd BufNewFile,BufRead *.vxh set syntax=verilog_systemverilog

autocmd FileType perforce setlocal spell "turn on spellchecking for perforce
autocmd FileType perforce setlocal noexpandtab "turn on tabs for perforce
autocmd FileType perforce setlocal list "turn on tabs for perforce

" for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/vim-scripts/a.vim.git'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
Plug 'vhda/verilog_systemverilog.vim'
call plug#end()




