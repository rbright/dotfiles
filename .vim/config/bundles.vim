set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle "VundleVim/Vundle.vim"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "Raimondi/delimitMate"
Bundle "ekalinin/Dockerfile.vim"
Bundle "tomasr/molokai"
Bundle "scrooloose/nerdtree"
Bundle "ervandew/supertab"
Bundle "scrooloose/syntastic"
Bundle "tomtom/tlib_vim"
Bundle "SirVer/ultisnips.git"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-dispatch"
Bundle 'elixir-lang/vim-elixir'
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "fatih/vim-go"
Bundle "wgibbs/vim-irblack"
Bundle "rbright/vim-javascript"
Bundle "tpope/vim-markdown"
Bundle "sickill/vim-monokai"
Bundle "avdgaag/vim-phoenix"
Bundle "tpope/vim-projectionist"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-surround"
Bundle "christoomey/vim-tmux-navigator"
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

" Gist
let g:gist_detect_filetype = 1

" Load NERDTree at startup and move the cursor to the main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l"

" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic Checkers
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_python_checkers = ['flake8']
