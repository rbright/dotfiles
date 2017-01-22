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
Plug 'mattn/gist-vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/netrw.vim' | Plug 'tpope/vim-vinegar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/webapi-vim'

"================
" Languages
"================
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
Plug 'zchee/deoplete-jedi', { 'for': ['python', 'python3'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'rbright/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }
Plug 'tpope/vim-rails'
Plug 'justinj/vim-react-snippets'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'

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
  let g:deoplete#enable_at_startup = 0
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file']
  let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
  let g:deoplete#sources#go#align_class = 1

  " Close popup and save indent
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
  endfunction
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
" Dash
"================
nmap <silent> <leader>d <Plug>DashSearch

"================
" delimitMate
"================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

"================
" Fugitive
"================
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

"================
" Gist
"================
let g:gist_detect_filetype = 1

"================
" Golang
"================
let g:go_async_run = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

"================
" Goyo
"================
au FileType markdown nmap <leader>e :Goyo<CR>

"================
" JSX
"================
let g:jsx_ext_required = 0

"================
" Lightline
"================

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark' ],
      \             [ 'go'] ],
      \   'right': [ [ 'lineinfo' ], 
      \              [ 'percent' ], 
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'go'] ],
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'go': 'LightLineGo',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  " return ''
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

"================
" Markdown
"================
au FileType markdown nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

"================
" neovim
"================
let g:python_host_prog = "/usr/local/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3"

"================
" neosnippet
"================
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" TAB should trigger neosnippet when available
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    neosnippet#mappings#expand_or_jump_impl() : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\    neosnippet#mappings#expand_or_jump_impl() : "\<TAB>"V

"================
" netrw
"================
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3

"================
" Rails
"================
map <leader>r :!ruby %<cr>
nnoremap <leader>m :Emodel<space>
nnoremap <leader>c :Econtroller<space>
nnoremap <leader>sr :Eserializer<space>
nnoremap <leader>sp :Espec<space>
nnoremap <leader>v :Eview<space>

"================
" RSpec
"================
let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
au FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>tn :call RunNearestSpec()<CR>
au FileType ruby map <Leader>tl :call RunLastSpec()<CR>
au FileType ruby map <Leader>ta :call RunAllSpecs()<CR>

"================
" Syntastic
"================
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

"================
" Tagbar
"================
let g:tagbar_compact = 1
autocmd VimEnter * TagbarOpen


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
