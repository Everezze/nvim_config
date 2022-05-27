"MAIN CONFIG FILE FOR NVIM

set encoding=utf-8
scriptencoding=utf-8
"language messages English_United States
set langmenu=en_US.UTF-8  

set lines =50
set columns =120
set textwidth=80
set linebreak
set wrapmargin=0
set formatoptions=cqt
set wildmenu
set splitbelow splitright
"set list
"set listchars=tab:>-,trail:.
set noundofile
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=r                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
filetype plugin indent on   "allow auto-indenting depending on file type
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
set cc=200                  " set an 200 column border for good coding style
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
"set clipboard=unnamed       " using system clipboard
set showcmd
set hidden
set nohlsearch
set complete+=kspell
set completeopt=menuone,noinsert
set spell spelllang=en_us
set spellsuggest=best,9
set noswapfile
set timeoutlen=400
set cursorline
set cursorlineopt=both

if (has("termguicolors"))
 set termguicolors
endif
"----------------------- SOME SPECIFIC TWEAKS -----------------------------

"opening windows easily
let mapleader= ' '
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>c :wincmd c<CR>
nnoremap <silent> <leader>wj :wincmd J<CR>
nnoremap <silent> <leader>wl :wincmd L<CR>
"inoremap kj <Esc> removed because autohotkey script remaps Caps to Esc

"unsetting/setting relative number for focus and insert mode 
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END



