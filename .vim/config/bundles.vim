set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
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
Bundle "tpope/vim-endwise"
Bundle "nono/vim-handlebars"
Bundle "wgibbs/vim-irblack"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
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
" Leader-rm to edit the specified model
" Leader-rc to edit the specified controller
" Leader-rv to edit the specified view
" Leader-rg to run the specified generator
" Leader-rp to extract the selected snippet into the specified partial
" Leader-rk to run the specified Rake task
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>rv :Eview<space>
nnoremap <leader>rs :Espec<space>
nnoremap <leader>rsm :Espec models/
nnoremap <leader>rsc :Espec controllers/
nnoremap <leader>rsr :Espec requests/
nnoremap <leader>rg :Rgenerate<space>
vnoremap <leader>rp :Rextract<space>
nnoremap <leader>rk :Rake<space>

" Tagbar
" Leader-rt to toggle the sidebar
nnoremap <leader>rt :TagbarToggle<cr><C-w>
