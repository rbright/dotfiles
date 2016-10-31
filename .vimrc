let mapleader = ","
nnoremap ; :

"================================================================
" PLUGINS
"================================================================

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/netrw.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'wgibbs/vim-irblack'
Plug 'rbright/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-markdown'
Plug 'sickill/vim-monokai'
Plug 'avdgaag/vim-phoenix'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'justinj/vim-react-snippets'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'mattn/webapi-vim'

call plug#end()

""================================================================
" PLUGIN SETTINGS
""================================================================

"================
" Ack
"================
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

"================
" Autocompletion
"================
if has('nvim')
  let g:deoplete#enable_at_startup = 1
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
else
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Close popup and save indent
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  endfunction

  " Close popup and delete backword character
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  " Omnicompletion
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif

"================
" CtrlP
"================
map <leader>p :CtrlP<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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
let g:go_auto_type_info = 0
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

"================
" Jedi
"================
"let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ""
let g:jedi#goto_definitions_command = "<leader>g"

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
" Neovim
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
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>rs :Eserializer<space>
nnoremap <leader>rt :Espec<space>
nnoremap <leader>rv :Eview<space>
nnoremap <leader>rg :Rgenerate<space>
vnoremap <leader>rp :Rextract<space>
nnoremap <leader>rk :Rake<space>

"================
" RSpec
"================
let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
set vb t_vb=
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=list:longest

if has('gui_running')
  " Start without scrollbars.
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
