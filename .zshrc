ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(git rails3)

export EDITOR="vim"
export TERM="xterm-256color" # for tmux

source $ZSH/oh-my-zsh.sh
source $HOME/.zshdev
source $HOME/.zshaliases
source $HOME/.zshfunctions

export HEROKU_PATH=/usr/local/heroku/bin
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JULIA_PATH=$HOME/Development/julia/bin
export NPM_PATH=/usr/local/share/npm/lib:/usr/local/share/npm/lib/node_modules/handlebars/bin
export WORDNET_HOME=/usr/local/Cellar/wordnet/3.0
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$NPM_PATH:$HEROKU_PATH:$JAVA_HOME:$JULIA_PATH:$WORDNET_HOME:$PATH
