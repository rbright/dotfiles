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
