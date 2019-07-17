# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

# zsh Plugins
plugins=(docker docker-compose git react-native redis-cli)

export EDITOR="vim"
export GPG_TTY=$(tty)        # fix for Keybase error
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # tmux colors

# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export RBENV_PATH="$HOME/.rbenv/bin"
export PATH="$HOME/bin:$RBENV_PATH:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Homebrew Security Options
export HOMEBREW_NO_ANALYTICSzs=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# OpenSSL
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

# zsh Configuration
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/development

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Load rbenv
eval "$(rbenv init -)"
