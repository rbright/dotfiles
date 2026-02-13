################################################################################
# Safety & Performance Options
################################################################################

# History options
setopt HIST_VERIFY        # Show command with history expansion before running it
setopt HIST_IGNORE_DUPS   # Don't record duplicate entries
setopt HIST_IGNORE_SPACE  # Don't record entries starting with a space

# Directory & navigation options
setopt AUTO_CD            # If command is a directory, cd into it
setopt CORRECT            # Try to correct misspellings
setopt EXTENDED_GLOB      # More powerful globbing

################################################################################
# Settings
################################################################################

export EDITOR="$HOME/.nix-profile/bin/nvim"
export LANG=en_US.UTF-8

is_darwin=false
if [[ "$OSTYPE" == darwin* ]]; then
  is_darwin=true
fi

################################################################################
# Development Tools
################################################################################

# Android + Java (macOS only)
if "$is_darwin"; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
fi

# Go
export GOPATH="$HOME/go"

# Node.js - bun
export BUN_INSTALL="$HOME/.bun"

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
  "/run/wrappers/bin"
  "/run/current-system/sw/bin"

  # Go
  $GOPATH/bin

  # Node.js - bun
  $BUN_INSTALL/bin

  # Node.js - npm
  $HOME/.npm-global/bin

  # opencode
  $HOME/.opencode/bin

  # Add system PATH
  $path
)

if "$is_darwin"; then
  # Homebrew + Android tools are macOS-specific.
  path+=(
    "/opt/homebrew/bin"
    $ANDROID_HOME/{emulator,platform-tools}
  )
fi

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

# Atuin
eval "$(atuin init zsh)"

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

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

if [ -f "$HOME/.local/bin/env" ]; then
  . "$HOME/.local/bin/env"
fi
