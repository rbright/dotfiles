ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(brew docker git httpie npm)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/development
source $HOME/.zsh/aliases
source $HOME/.zsh/functions

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"

NPM_PATH="/usr/local/share/npm/bin"
RBENV_PATH="$HOME/.rbenv/bin"

export PATH="$HOME/bin:$RBENV_PATH:$NPM_PATH:$PATH:$GOPATH/bin:$GOROOT/bin"

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
