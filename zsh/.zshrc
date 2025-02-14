################################################################################
# oh-my-zsh
################################################################################

export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE="true"

source "${ZSH}/oh-my-zsh.sh"

################################################################################
# Settings
################################################################################

export EDITOR="$HOME/.nix-profile/bin/nvim"
export LANG=en_US.UTF-8

# Homebrew Security Options
# export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

################################################################################
# Development Tools
################################################################################

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Go
export GOPATH="$HOME/go"
export GOROOT="/opt/homebrew/opt/go/libexec"

# Google Cloud SDK
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# Node (nvm)
export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="$HOME/.nix-profile/bin/pnpm"
[ -s "$PNPM_HOME/pnpm.sh" ] && source "$PNPM_HOME/pnpm.sh"

################################################################################
# Path Management
################################################################################

typeset -U path
path=(
  # User paths
  $HOME/{.local/bin}

  # NixOS
  $HOME/.nix-profile/bin

  # Android
  $ANDROID_HOME/{emulator,platform-tools}

  # Go
  $GOPATH/bin
  $GOROOT/bin

  # Node (pnpm)
  $PNPM_HOME

  # Postgres
  "/opt/homebrew/opt/libpq/bin"

  # Add system PATH
  $path
)

export PATH

# Source all .zsh files in the main zsh directory
for file in "${HOME}/.zsh"/*.zsh(N); do
  source "$file"
done

# Source all .zsh files in the functions directory
if [ -d "${HOME}/.zsh/functions" ]; then
  for file in "${HOME}/.zsh/functions"/*.zsh(N); do
    source "$file"
  done
fi

################################################################################
# Shell Integration
################################################################################

# Starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# Node (nvm)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Nix
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
fi

export XDG_CONFIG_HOME="$HOME/.config"
