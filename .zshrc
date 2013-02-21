ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(brew bundler capistrano coffee gem git osx rails3 rbenv vundle)

export EDITOR="vim"

source $ZSH/oh-my-zsh.sh

#
# Paths
#

export HEROKU_PATH=/usr/local/heroku/bin
export NPM_PATH=/usr/local/share/npm/lib:/usr/local/share/npm/lib/node_modules/handlebars/bin
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export TOMCAT_HOME=/usr/local/Cellar/apache-tomcat/6.0.35/bin
export WORDNET_HOME=/usr/local/Cellar/wordnet/3.0
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$NPM_PATH:$HEROKU_PATH:$JAVA_HOME:$TOMCAT_HOME:$WORDNET_HOME:$PATH

#
# Aliases
#

alias git="hub"
alias gcl="git clone"
alias ggpl="ggpull"
alias ggpsh="ggpush"
alias grb="git rebase"
alias gdpr="git difftool origin/master...origin/$(current_branch)"
alias gt="gittower"
alias gts="gittower --status"
alias hgpr="g pull-request"
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
