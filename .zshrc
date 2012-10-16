ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(brew cake gem git github heroku node npm osx rails3 rbenv vagrant zeus)

export EDITOR="vim"

source $ZSH/oh-my-zsh.sh

#
# Paths
#

export HEROKU_PATH=/usr/local/heroku/bin
export NPM_PATH=/usr/local/share/npm/lib:/usr/local/share/npm/lib/node_modules/handlebars/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export TOMCAT_HOME=/usr/local/Cellar/apache-tomcat/6.0.35/bin
export WORDNET_HOME=/usr/local/Cellar/wordnet/3.0/
export PATH=$PATH:/usr/local/sbin:$HOME/bin:$NPM_PATH:$HEROKU_PATH:$JAVA_HOME:$TOMCAT_HOME:$WORDNET_HOME

#
# Aliases
#

alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias git="hub"
alias gcl="git clone"
alias grb="git rebase"
alias r="rails"
alias watch="watchr ~/.watchr/rails.rb"
alias z="zeus"

#
# Functions
#
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

#
# tmux
#
export TERM="xterm-256color"
alias tmux="tmux -2"

source $HOME/.zshdev
