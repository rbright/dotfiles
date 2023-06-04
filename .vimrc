let mapleader = ","
nnoremap ; :

"================================================================
" PLUGINS
"================================================================

call plug#begin('~/.vim/plugged')

"================
" General
"================

Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'tomasr/molokai'
Plug 'vim-scripts/netrw.vim' | Plug 'tpope/vim-vinegar'
Plug 'rust-lang/rust.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'

"================
" Languages
"================

Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'

call plug#end()

""================================================================
" PLUGIN SETTINGS
""================================================================

"================
" Ack
"================

cnoreabbrev Ack Ack!
nnoremap <leader>f :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

"================
" Autocompletion
"================

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

"================
" CtrlP
"================

map <leader>p :CtrlP<cr>
map <F5> :call :CtrlPClearAllCaches<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = 'node_modules\|mysql-data\|DS_Store\|git'

"================
" delimitMate
"================

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

"================
" neovim
"================

let g:python_host_prog = "/opt/homebrew/bin/python3"
let g:python3_host_prog = "/opt/homebrew/bin/python3"

"================
" netrw
"================

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3

"================
" Rust
"================

let g:rust_clip_command = 'pbcopy'

"================================================================
" SETTINGS
"================================================================

" Colors
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
syntax on

" Fonts
set gfn=Menlo\ Regular:h15
set shellpipe=>

" Convert tabs to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Handle long lines appropriately
set formatoptions=qrn1
set textwidth=79

" Show whitespace characters for tabs and spaces
set list
set listchars=tab:▸\ ,trail:·

" Setup indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Use 'normal' regex handling in searches
nnoremap / /\v
vnoremap / /\v

set autoindent
set autowrite
set backspace=indent,eol,start
set copyindent
set colorcolumn=80
set complete-=i
set cursorline
set encoding=utf-8
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modelines=0
set nobackup
set nocompatible
set noerrorbells
set noswapfile
set nowrap
set relativenumber
set ruler
set scrolloff=3
set shell=/bin/zsh
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=100
set ttyfast
set undofile
set undolevels=1000
set updatetime=100
set vb t_vb=
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=list:longest

if has('gui_running')
  set guioptions=aAce
endif


"================================================================
" MAPPINGS
"================================================================

" Remap ESC to jj
imap jj <ESC>

" Ignore F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Ctrl-a and Ctrl-D to split and vertical split
nnoremap <C-d> :split<cr>
nnoremap <C-a> :vsplit<cr>

" Leader-w to save
map <leader>w :w!<cr>

" Leader-q to quit
map <leader>q :q<cr>

" Leader-/ to clear the search buffer
nmap <silent> <leader>/ :nohlsearch<cr>

" Leader-y to toggle relative numbering
function ToggleNumbering()
  if (&number)
    set nonumber
    set relativenumber
  else
    set norelativenumber
    set number
  endif
endfunction
nnoremap <leader>y :call ToggleNumbering()<cr><cr>

" Leader-W to remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Q to execute the recorded macro
nmap Q @q

" Z to format the current paragraph or selection
vmap Z gq
nmap Z gqap

" Ctrl-h does not work in neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" w!! to save a file with sudo
cmap w!! w !sudo tee % >/dev/null

if has('gui_running')
  " Command-D and Command-d for split/vsplit
  nnoremap <D-D> :split<cr>
  nnoremap <D-d> :vsplit<cr>

  " Command-Option-Arrows for switching between splits
  map <D-M-Down> <C-W>j
  map <D-M-Up> <C-W>k
  map <D-M-Right> <C-W>l
  map <D-M-Left> <C-W>h

  " Command-W to close a buffer
  nnoremap <D-w> :q!<cr>
endif
