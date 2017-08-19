ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(bundler docker docker-compose git rails react-native redis-cli)

export EDITOR="vim"
export LANGUAGE=en_US.UTF
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # for tmux

# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export NPM_PATH="/usr/local/share/npm/bin"
export NVM_DIR="$HOME/.nvm"
export YARN_PATH="$HOME/.yarn/bin"
export PYTHON_PATH="$HOME/Library/Python/2.7/bin"
export RBENV_PATH="$HOME/.rbenv/bin"
export ANDROID_HOME=$HOME/Library/Android/sdk
export FASTLANE_PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/bin:$GOPATH/bin:$GOROOT/bin:$NPM_PATH:$NVM_PATH:$YARN_PATH:$PYTHON_PATH:$RBENV_PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$FASTLANE_PATH:$PATH"


# Homebrew Security Options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/development

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
