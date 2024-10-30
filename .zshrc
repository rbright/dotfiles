################################################################
# ZSH
################################################################

# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="amuse"
DISABLE_AUTO_UPDATE="true"

# oh-my-zsh Plugins
plugins=(
  argocd
  brew
  docker
  fzf
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
  pip
  python
  react-native
  zoxide
  zsh-nvm
)

# zsh Configuration
source "${ZSH}/oh-my-zsh.sh"
for file in "${HOME}/.zsh"/{aliases,functions,development}; do
  [ -r "$file" ] && source "$file"
done

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
[ -s "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion"

# pnpm
export PNPM_HOME="/Users/rbright/Library/pnpm"
[ -s "$PNPM_HOME/pnpm.sh" ] && source "$PNPM_HOME/pnpm.sh"

################################################################
# PATH MANAGEMENT
################################################################

typeset -U path
path=(
  # System paths
  /usr/local/{bin,sbin}
  $HOME/{bin,.local/bin}

  # Android
  ${ANDROID_HOME}/{emulator,platform-tools}

  # Go
  ${GOPATH}/bin
  ${GOROOT}/bin

  # Node (pnpm)
  ${PNPM_HOME}

  # Visual Studio Code
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # Include existing PATH
  $path
)

export PATH

################################################################
# SHELL INTEGRATION
################################################################

# iTerm2
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"
