ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(git)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/development
source $HOME/.zsh/aliases
source $HOME/.zsh/functions

NPM_PATH=/usr/local/share/npm/bin
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$NPM_PATH:$PATH

RBENV_PATH=/usr/local/opt/rbenv
export PATH="$RBENV_PATH/bin:$RBENV_PATH/shims:$PATH"

export GOPATH="$HOME/Dropbox/projects/go"
export PATH="$PATH:$GOPATH/bin"

eval "$(rbenv init -)"
