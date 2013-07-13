let mapleader = ","

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundles
Bundle "gmarik/vundle"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "Raimondi/delimitMate"
Bundle "mattn/gist-vim"
Bundle "tomasr/molokai"
Bundle "scrooloose/nerdtree"
Bundle "ervandew/screen.git"
Bundle "ervandew/supertab"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "tomtom/tlib_vim"
Bundle "vim-scripts/Vim-R-plugin"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "kchmck/vim-coffee-script"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-endwise"
Bundle "wgibbs/vim-irblack"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-surround"
Bundle "mattn/webapi-vim"
Bundle "mattn/zencoding-vim"
filetype plugin indent on

" Fonts
set gfn=Menlo\ Regular:h16
color molokai
syntax on

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

" C, C++, and Java files have 4 spaces per tab
for ext in ["c", "cpp", "java"]
  execute 'au FileType ' . ext . ' set expandtab'
  execute 'au FileType ' . ext . ' set shiftwidth=4'
  execute 'au FileType ' . ext . ' set softtabstop=4'
  execute 'au FileType ' . ext . ' set tabstop=4'
endfor

" Ctrl-a and Ctrl-D for split/vsplit
nnoremap <C-d> :split<cr>
nnoremap <C-a> :vsplit<cr>

" Ctrl-hjkl for switching between splits
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-h> <C-W>h<C-W>_

" Leader-tn to Toggle relative numbering.
function ToggleNumbering()
  if (&number)
    set relativenumber
  else
    set number
  endif
endfunction
nnoremap <leader>tn :call ToggleNumbering()<cr><cr>

" Clear the search buffer
nmap <silent> ,/ :nohlsearch<cr>

" Use 'normal' regex handling in searches
nnoremap / /\v
vnoremap / /\v

" Leader-t to use Ctrl-P for searching filenames
nnoremap <leader>t :CtrlP<cr>

" Leader-f to search files with Ack
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Leader-W to Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Use Q for executing the recorded macro
nmap Q @q

" Use Z for formatting the current paragraph (or selection)
vmap Z gq
nmap Z gqap

" Use Leader-ft to fold an HTML tag
nnoremap <leader>ft Vatzf

" Use Leader-S to sort CSS properties
nnoremap <leader>S ?{<cr>jV/^\s*\}?$<cr>k:sort<cr>:noh<cr>

set autoindent
set backspace=indent,eol,start
set copyindent
set colorcolumn=80
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
set noerrorbells
set noswapfile
set nowrap
set relativenumber
set ruler
set scrolloff=3
set showcmd
set showmatch
set showmode
set smartcase
set ttyfast
set undofile
set undolevels=1000
set vb t_vb=
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=list:longest

" Efficient shortcuts
nnoremap ; :

" Save a file with sudo
cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Destroy the F1 key. Who needs help?
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" rails.vim shortcuts
nnoremap <leader>rm :Rmodel<space>
nnoremap <leader>rc :Rcontroller<space>
nnoremap <leader>rv :Rview<space>
nnoremap <leader>rg :Rgenerate<space>
vnoremap <leader>rp :Rextract<space>

" Setup indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Zencoding
let g:user_zen_expandabbr_key = '<d-e>'
let g:use_zen_complete_tag = 1

" SparkUp
let g:sparkupNextMapping = '<leader>e'

" Tagbar
nnoremap <leader>rt :TagbarToggle<cr><C-w>200l

" Vroom
nnoremap <leader>R :VroomRunTestFile<cr>

" Commentary
nmap <D-/> <Plug>CommentaryLine
vmap <D-/> <Plug>Commentary

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Open the current file in Marked with Leader-m
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Open the current file in iA Writer with Leader-w
nnoremap <leader>w :silent !open -a iA\ Writer.app '%:p'<cr>
