"MAIN CONFIG FILE FOR NVIM

set encoding=utf-8
scriptencoding=utf-8
language messages English_United States
set langmenu=en_US.UTF-8  


set lines =50
set columns =120
set textwidth=80
set linebreak
set wrapmargin=0
set formatoptions=cqt
set wildmenu
set splitbelow splitright
set list
set listchars=tab:>-,trail:.
set noundofile
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
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
"----------------------- MY PLUGINS -----------------------------

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-css-color'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'neovim/nvim-lspconfig'

    "Snippet plugin for creating snippets and customize them
    Plug 'L3MON4D3/LuaSnip'

    "Classifying auto-completion engine and sources subject to the classification
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'f3fora/cmp-spell'

    "for a better syntax highlighting
    "Plug 'sheerun/vim-polyglot'
call plug#end()


"----------------------- THEME SETUP -----------------------------

set background=dark
colorscheme palenight

let g:airline_left_sep = ''
let g:airline_right_sep = ''
"----------------------- SOME SPECIFIC TWEAKS -----------------------------

"opening windows easily
let mapleader= " "
nnoremap <silent> <leader>h :wincmd h<CR>
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

lua << EOF
 require(my_lsp_config')
EOF


lua << EOF
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
local cmp = require('~/.local/share/nvim/plugged/nvim-cmp/lua/cmp/init.lua')

  -- Setup nvim-cmp.
  cmp.setup{
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer'},
      { name ='spell', keyword_length=5},
    },

    formatting={
        fields= {"abbr","kind","menu"},
        format = function(entry, vim_item)
            vim_item.kind=string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu= ({
                nvim_lsp=' ',
                luasnip='',
                buffer=' ',
                path='ﱮ ',
                spell='暈',
            })[entry.source.name]
            return vim_item
        end,
    }

  }
EOF


"---------macro assignment and changing surroundings---------
"function! AssignCharToMacro()
    "let chr =""
    "let action= getchar()
    "let oldchar= getchar()
    "let newchar= getchar()
    "echom action,oldchar,newchar
"endfunction
