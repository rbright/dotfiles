# Display man pages in vim for syntax highlighting
function man
    command man $argv | col -b | vim -R -c 'set ft=man nomod nolist' -
end