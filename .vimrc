let mapleader = ","
nnoremap ; :

"=================================
" PLUGINS
"=================================

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle "VundleVim/Vundle.vim"
Bundle "mileszs/ack.vim"
Bundle "maralla/completor.vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle "rizzatti/dash.vim"
Bundle "Raimondi/delimitMate"
Bundle "Shougo/deoplete.nvim"
Bundle "zchee/deoplete-go", { 'do': 'make'}
Bundle "zchee/deoplete-jedi"
Bundle "ekalinin/Dockerfile.vim"
Bundle "mattn/emmet-vim"
Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "vim-scripts/netrw.vim"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "tomtom/tlib_vim"
Bundle "SirVer/ultisnips.git"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-dispatch"
Bundle 'elixir-lang/vim-elixir'
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"
Bundle "fatih/vim-go"
Bundle "wgibbs/vim-irblack"
Bundle "rbright/vim-javascript"
Bundle "mxw/vim-jsx"
Bundle "tpope/vim-markdown"
Bundle "sickill/vim-monokai"
Bundle "avdgaag/vim-phoenix"
Bundle "tpope/vim-projectionist"
Bundle "tpope/vim-rails"
Bundle "justinj/vim-react-snippets"
Bundle "tpope/vim-repeat"
Bundle "thoughtbot/vim-rspec"
Bundle "ngmy/vim-rubocop"
Bundle "vim-ruby/vim-ruby"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-surround"
Bundle "christoomey/vim-tmux-navigator"
Bundle "tpope/vim-vinegar"
Bundle "mattn/webapi-vim"

call vundle#end()            " required
filetype plugin indent on    " required

"=================================
" PLUGIN SETTINGS
"=================================

" Ack
" Leader-f to search within files
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Autocompletion
if has('nvim')
  let g:deoplete#enable_at_startup = 1
else
  let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
  let g:completor_disable_filename = 1
  let g:completor_disable_buffer = 1
endif

" CtrlP
" Leader-t to search file names
map <leader>p :CtrlP<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Gist
let g:gist_detect_filetype = 1

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

" Jedi
"let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ""
let g:jedi#goto_definitions_command = "<leader>g"

" JSX
let g:jsx_ext_required = 0

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3

" Rails
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>rs :Eserializer<space>
nnoremap <leader>rt :Espec<space>
nnoremap <leader>rv :Eview<space>
nnoremap <leader>rg :Rgenerate<space>
vnoremap <leader>rp :Rextract<space>
nnoremap <leader>rk :Rake<space>

" RSpec
let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic Checkers
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

" Tagbar
autocmd VimEnter * TagbarOpen


"=================================
" SETTINGS
"=================================

" Fonts
set gfn=Menlo\ Regular:h15
color molokai
syntax on

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
set vb t_vb=
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=list:longest


"=================================
" MAPPINGS
"=================================

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

" Leader-m to open the current file in Marked
nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

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

" w!! to save a file with sudo
cmap w!! w !sudo tee % >/dev/null
