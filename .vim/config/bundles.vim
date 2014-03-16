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
Bundle "tomtom/tlib_vim"
Bundle "jgdavey/tslime.vim"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "kchmck/vim-coffee-script"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-dispatch"
Bundle "heartsentwined/vim-emblem.git"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "nono/vim-handlebars"
Bundle "wgibbs/vim-irblack"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
Bundle "thoughtbot/vim-rspec"
Bundle "vim-ruby/vim-ruby"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-surround"
Bundle "christoomey/vim-tmux-navigator"
Bundle "mattn/webapi-vim"
filetype plugin indent on

" Ack
" Leader-f to search within files
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Commentary
" Command-/ to comment a line or block
nmap <C-/> <Plug>CommentaryLine
vmap <C-/> <Plug>Commentary

" CtrlP
" Leader-t to search file names
map <leader>t :CtrlP<cr>
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

" Load NERDTree at startup and move the cursor to the main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l"

" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

" RSpec
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
