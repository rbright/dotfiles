" Start without scrollbars.
set guioptions=aAce

" Command-D and Command-d for split/vsplit
nnoremap <D-D> :split<cr>
nnoremap <D-d> :vsplit<cr>

" Command-Option-hjkl for switching between splits
map <D-M-j> <C-W>j<C-W>_
map <D-M-k> <C-W>k<C-W>_
map <D-M-l> <C-W>l<C-W>_
map <D-M-h> <C-W>h<C-W>_

" Command-W to close a buffer
nnoremap <D-w> :q!<cr>
