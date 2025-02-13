# Remove vim plugins not included in vimrc
function clean-vim
  vim -c "execute \"PlugClean!\" | q | q"
end