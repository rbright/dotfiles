set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle "VundleVim/Vundle.vim"
Bundle "mileszs/ack.vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle "rizzatti/dash.vim"
Bundle "Raimondi/delimitMate"
Bundle "ekalinin/Dockerfile.vim"
Bundle "mattn/emmet-vim"
Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "Shougo/neocomplete.vim"
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

" Ack
" Leader-f to search within files
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" CtrlP
" Leader-t to search file names
map <leader>t :CtrlP<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Gist
let g:gist_detect_filetype = 1

" Jedi
"let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ""
let g:jedi#goto_definitions_command = "<leader>g"

" Load NERDTree at startup and move the cursor to the main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l"

" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

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
let g:rspec_command = "compiler rspec | set makeprg=spring | Make rspec {spec}"
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
let g:syntastic_python_checkers = ['flake8']
