" Start without scrollbars.
set guioptions=aAce

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
