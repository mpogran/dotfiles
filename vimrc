call plug#begin(expand('~/.vim/plugged'))

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CSApprox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'

call plug#end()

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
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
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

"" Visual
syntax on
set ruler
set number
set relativenumber
let no_buffers_menu=1

let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

set mousemodel=popup
set mouse=a
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  colorscheme palenight
  set background=dark
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
  endif
else
  syntax enable

  let g:airline_solarized_bg='dark'
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '¦'
  let g:indentLine_faster = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif


if &term =~ '256color'
  set t_ut=
endif

"" Map leader to ,
let mapleader=','

set scrolloff=3
set sidescrolloff=5
set laststatus=2

"" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Fuzzy file finder
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

"" Airline
let g:airline#extensions#ale#enabled = 1

"" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 1

"" Keep swap files isolated to their own directory
:let homeswapdir=$HOME.'/.vim/swp'
if !isdirectory(homeswapdir)
  call mkdir(homeswapdir)
  endif
  execute "set directory=".homeswapdir

"" ListChars
set listchars=tab:▸\ ,eol:¬,space:•

"" Custom mappings
nnoremap <leader>v :Vex<CR>
nnoremap <leader>s :Sex<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>A :set relativenumber!<CR>
xnoremap <leader>tb :Tabularize<space>/
nnoremap <leader>Pm :CtrlP ~/Repositories/elledock/ellevest_models<CR>
nnoremap <leader>Pc :CtrlP ~/Repositories/elledock/ClientApplication<CR>
nnoremap <leader>Pb :CtrlP ~/Repositories/elledock/BackofficeApplication<CR>
