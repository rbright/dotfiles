ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(git rails3)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zshdev
source $HOME/.zshaliases
source $HOME/.zshfunctions

export HEROKU_PATH=/usr/local/heroku/bin
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export LATEX_PATH=/usr/local/texlive/2013/bin/x86_64-darwin
export NPM_PATH=/usr/local/share/npm/bin
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$NPM_PATH:$HEROKU_PATH:$JAVA_HOME:$LATEX_PATH:$PATH
