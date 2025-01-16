#!/bin/bash

dotfiles=(
  ".curlrc"
  ".gitconfig"
  ".htoprc"
  ".inputrc"
  ".profile"
  ".tmux.conf"
  ".tmuxinator"
  ".vim"
  ".vimrc"
  ".zprofile"
  ".zsh"
  ".zshenv"
  ".zshrc"
)

# Symlink dotfiles from Google Drive
for dotfile in "${dotfiles[@]}"; do
    rm -f "${HOME}/${dotfile}"
    ln -s "${HOME}/Google Drive/My Drive/Projects/dotfiles/${dotfile}" "${HOME}/${dotfile}"
    echo "Created symlink for ${dotfile}"
done

# Symlink global gitignore
ln -s "${HOME}/Google Drive/My Drive/Projects/dotfiles/gitignore" "${HOME}/.gitignore"