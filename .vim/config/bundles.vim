set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "tpope/vim-fugitive"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "Raimondi/delimitMate"
Bundle "mattn/gist-vim"
Bundle "tomasr/molokai"
Bundle "scrooloose/nerdtree"
Bundle "ervandew/supertab"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "tomtom/tlib_vim"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "kchmck/vim-coffee-script"
Bundle "tpope/vim-commentary"
Bundle "Lokaltog/vim-easymotion"
Bundle "heartsentwined/vim-emblem.git"
Bundle "tpope/vim-endwise"
Bundle "nono/vim-handlebars"
Bundle "wgibbs/vim-irblack"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
Bundle "vim-ruby/vim-ruby"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-surround"
Bundle "mattn/webapi-vim"
filetype plugin indent on

" Ack
" Leader-f to search within files
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Commentary
" Command-/ to comment a line or block
nmap <D-/> <Plug>CommentaryLine
vmap <D-/> <Plug>Commentary

" CtrlP
" Leader-t to search file names
nnoremap <leader>t :CtrlP<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Gist
let g:gist_detect_filetype = 1

" Rails
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>rs :Eserializer<space>
nnoremap <leader>rt :Espec<space>
nnoremap <leader>rv :Eview<space>
nnoremap <leader>rg :Rgenerate<space>
vnoremap <leader>rp :Rextract<space>
nnoremap <leader>rk :Rake<space>

" Ember.js
nnoremap <leader>em :Eemmodel<space>
nnoremap <leader>ec :Eemcontroller<space>
nnoremap <leader>er :Eemroute<space>
nnoremap <leader>err :Eemrouter<space>
nnoremap <leader>es :Eemspec<space>
nnoremap <leader>et :Eemtemplate<space>
nnoremap <leader>ev :Eemview<space>

" Tagbar
" Leader-rt to toggle the sidebar
nnoremap <leader>rt :TagbarToggle<cr><C-w>
