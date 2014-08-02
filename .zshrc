ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(git github heroku rails rbenv)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/development
source $HOME/.zsh/aliases
source $HOME/.zsh/functions

HEROKU_PATH=/usr/local/heroku/bin
JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
NPM_PATH=/usr/local/share/npm/bin
RBENV_PATH=/usr/local/opt/rbenv
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$NPM_PATH:$HEROKU_PATH:$JAVA_HOME:$PATH

export PATH="$RBENV_PATH/bin:$RBENV_PATH/shims:$PATH"
eval "$(rbenv init -)"
