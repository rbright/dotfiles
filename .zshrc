################################################################
# ZSH
################################################################

# oh-my-zsh
#
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

# nvm
export NVM_COMPLETION=true

# oh-my-zsh Plugins
#
plugins+=(
  adb
  argocd
  brew
  docker
  gcloud
  git
  github
  golang
  helm
  kubectl
  nats
  nmap
  npm
  nvm
  react-native
  zsh-nvm
)

# zsh Configuration
source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.zsh/aliases
source ${HOME}/.zsh/functions
source ${HOME}/.zsh/development

################################################################
# SHELL SETTINGS
################################################################

export EDITOR="vim"
export GPG_TTY=$(tty)        # fix for Keybase error
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # tmux colors

# Homebrew Security Options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# libsodium
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

# OpenSSL
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:${PATH}"
export PATH="${HOME}/bin:$PATH"

################################################################
# SHELL INTEGRATIONS
################################################################

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Visual Studio Code
export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

################################################################
# LANGUAGE TOOLS
################################################################

# Android
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export PATH="${PATH}:${ANDROID_HOME}/emulator"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# Go
export GOPATH="${HOME}/go"
export GOROOT="/opt/homebrew/opt/go/libexec"
export PATH="${PATH}:${GOPATH}/bin:${GOROOT}/bin"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
