################################################################
# ZSH
################################################################

# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="amuse"
DISABLE_AUTO_UPDATE="true"

# oh-my-zsh Plugins
plugins=(
  1password
  argocd
  aws
  brew
  docker
  docker-compose
  fzf
  gcloud
  gh
  git
  git-commit
  git-lfs
  github
  golang
  helm
  kubectl
  nats
  ngrok
  nmap
  node
  npm
  nvm
  opentofu
  pip
  postgres
  python
  react-native
  terraform
  uv
  zoxide
  zsh-nvm
)

# zsh Configuration
source "${ZSH}/oh-my-zsh.sh"

################################################################
# SHELL SETTINGS
################################################################

export EDITOR="vim"
export GPG_TTY=$(tty)        # fix for Keybase error
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color" # tmux colors

# Homebrew Security Options
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# OpenSSL
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"

################################################################
# DEVELOPMENT TOOLS
################################################################

# Android
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Go
export GOPATH="${HOME}/go"
export GOROOT="/opt/homebrew/opt/go/libexec"

# Google Cloud SDK
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# Node (nvm)
export NVM_DIR="${HOME}/.nvm"
export NVM_COMPLETION=true
[ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"

# pnpm
export PNPM_HOME="/Users/rbright/Library/pnpm"
[ -s "$PNPM_HOME/pnpm.sh" ] && source "$PNPM_HOME/pnpm.sh"

################################################################
# Path Management
################################################################

typeset -U path
path=(
  # Homebrew paths
  /opt/homebrew/{bin,sbin}

  # User paths
  $HOME/{.local/bin}

  # Android
  ${ANDROID_HOME}/{emulator,platform-tools}

  # Go
  ${GOPATH}/bin
  ${GOROOT}/bin

  # Node (pnpm)
  ${PNPM_HOME}

  # Postgres
  "/opt/homebrew/opt/libpq/bin"

  # Add system PATH
  $path
)

export PATH

################################################################################
# Shell Integration
################################################################################

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# Node (nvm)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
