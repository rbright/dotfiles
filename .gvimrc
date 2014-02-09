" Start without scrollbars.
set guioptions=aAce
set transparency=10

" Load NERDTree and Tagbar at startup and move the cursor to the main window
autocmd VimEnter * NERDTree
autocmd VimEnter * TagbarOpen
autocmd VimEnter * wincmd l"

" Allow NERDTree to expand directories and open files with a single click
let NERDTreeMouseMode = 3

" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

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
