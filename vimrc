call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set viminfo='100,h,n~/.vim/viminfo

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set autoindent
set smartindent

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

"" Visual
syntax enable
set ruler
set number
set relativenumber
set background=dark
set t_Co=256
set mouse=a
set scrolloff=3
set sidescrolloff=5
set laststatus=2

"" Keep swap files isolated to their own directory
let homeswapdir=$HOME.'/.vim/swp'
if !isdirectory(homeswapdir)
  call mkdir(homeswapdir)
endif
execute "set directory=".homeswapdir

"" Map leader to ,
let mapleader=','

"" Search mappings: center on result when jumping
nnoremap n nzzzv
nnoremap N Nzzzv

"" Maintain Visual Mode after shifting
vmap < <gv
vmap > >gv

"" Custom mappings
nnoremap <leader>v :Vex<CR>
nnoremap <leader>s :Sex<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <leader>A :set relativenumber!<CR>
