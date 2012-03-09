ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"

DISABLE_AUTO_UPDATE="true"

plugins=(brew cake gem git git-flow github heroku npm osx powder rails3 rvm vagrant)

source $ZSH/oh-my-zsh.sh

#
# Paths
#
export JAVA_HOME=$(/usr/libexec/java_home)
export TOMCAT_HOME=/usr/local/Cellar/apache-tomcat/6.0.35/bin
export WORDNET_HOME=/usr/local/Cellar/wordnet/3.0/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=$PATH:$HOME/.rvm/bin:$HOME/bin:$JAVA_HOME:$TOMCAT_HOME:$WORDNET_HOME
