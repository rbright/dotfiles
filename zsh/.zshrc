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

################################################################################
# Development Tools
################################################################################

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Go
export GOPATH="$HOME/go"

# Node.js - pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
[ -s "$PNPM_HOME/pnpm.sh" ] && source "$PNPM_HOME/pnpm.sh"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

################################################################################
# Path Management
################################################################################

typeset -U path

path=(
  # User
  $HOME/{.local/bin}

  # Nix
  $HOME/.nix-profile/bin
  "/nix/var/nix/profiles/default/bin"
  "/run/current-system/sw/bin"

  # Homebrew
  "/opt/homebrew/bin"

  # Android
  $ANDROID_HOME/{emulator,platform-tools}

  # Go
  $GOPATH/bin

  # Node.js - npm
  $HOME/.npm-global/bin

  # Node.js - pnpm
  $PNPM_HOME

  # Add system PATH
  $path
)

export PATH

################################################################################
# Imports
################################################################################

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

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Nix
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
fi

# Starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"
