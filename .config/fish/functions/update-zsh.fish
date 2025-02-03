# Update oh-my-zsh
function update-zsh
  pushd "$HOME/.oh-my-zsh";
    git pull origin master;
  popd;
end