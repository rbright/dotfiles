ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(bundler django docker docker-compose git golang pip)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/development

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export NPM_PATH="/usr/local/share/npm/bin"
export YARN_PATH="$HOME/.yarn/bin"
export RBENV_PATH="$HOME/.rbenv/bin"
export PATH="$HOME/bin:$GOPATH/bin:$GOROOT/bin:$NPM_PATH:$YARN_PATH:$RBENV_PATH:$PATH"

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
