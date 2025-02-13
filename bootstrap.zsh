#!/usr/bin/env zsh

###############################################################################
# MACOS BOOTSTRAP
#
# This script installs all dependencies needed for a new macOS installation.
# It also sets various macOS configurations.
###############################################################################

################################################################
# INIT
################################################################

print -P "%F{yellow}Initializing macOS bootstrap%f"

################################################################
# CORE
################################################################

# XCode CLI Tools
print -P "%F{blue}Installing Xcode CLI Tools%f"
xcode-select --install

# Homebrew
print -P "%F{blue}Installing Homebrew%f"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# NixOS
print -P "%F{blue}Installing NixOS%f"
sh <(curl -L https://nixos.org/nix/install)

################################################################
# GIT
################################################################

# Git
print -P "%F{blue}Installing Git from Homebrew%f"
brew install git

# Git LFS
print -P "%F{blue}Installing Git LFS from Homebrew%f"
brew install git-lfs

# GitHub CLI
print -P "%F{blue}Installing GitHub CLI from Homebrew%f"
brew install gh

################################################################
# SHELL SETUP
################################################################

print -P "%F{blue}Installing shell utilities%f"

# Install zsh plugins using oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

print -P "%F{green}Installed shell utilities%f"

################################################################
# NUSHELL
################################################################

print -P "%F{blue}Installing nushell%f"
brew install nushell
print -P "%F{green}Installed nushell%f"

################################################################
# TERMINAL
################################################################

print -P "%F{blue}Installing terminal utilities from Homebrew%f"

# Terminal utilities
brew install btop
brew install fzf
brew install --cask ghostty
brew install jq
brew install mkcert
brew install starship
brew install stow
brew install wget
brew install woff2
brew install yq
brew install zoxide

print -P "%F{green}Installed terminal utilities from Homebrew%f"

################################################################
# TEXT EDITING
################################################################

print -P "%F{blue}Installing text editing utilities from Homebrew%f"

brew install hadolint
brew install neovim
brew install shellcheck

print -P "%F{green}Installed text editing utilities from Homebrew%f"

################################################################
# GPG
################################################################

print -P "%F{blue}Installing GPG utilities from Homebrew%f"

brew install gnupg
brew install gnutls
brew install pinentry
brew install pinentry-mac

print -P "%F{green}Installed GPG utilities from Homebrew%f"

################################################################
# LANGUAGE TOOLS
################################################################

print -P "%F{blue}Installing language tools from Homebrew%f"

# Go
brew install go

# Node.js
curl -fsSL https://get.pnpm.io/install.sh | sh -
brew install watchman

# Python
curl -LsSf https://astral.sh/uv/install.sh | sh

# ngrok
brew install ngrok

print -P "%F{green}Installed language tools from Homebrew%f"

################################################################
# MOBILE DEVELOPMENT
################################################################

print -P "%F{blue}Installing mobile development tools from Homebrew%f"

brew install cocoapods
brew install fastlane
brew install --cask zulu17

print -P "%F{green}Installed iOS & Android development tools from Homebrew%f"

################################################################
# KUBERNETES
################################################################

print -P "%F{blue}Installing Kubernetes tools from Homebrew%f"
brew install k3d
brew install kubernetes-cli
brew install helm
brew install chart-testing
brew install tilt

################################################################
# CLOUD INFRASTRUCTURE
################################################################

print -P "%F{blue}Installing cloud infrastructure tools from Homebrew%f"
brew tap hashicorp/tap
brew install awscli
brew install opentofu
brew install hashicorp/tap/terraform
brew install tilt-dev/tap/tilt
brew install --cask google-cloud-sdk

################################################################
# DATA MANAGEMENT
################################################################

print -P "%F{blue}Installing data management tools from Homebrew%f"
brew install atlas
brew install libpq
brew install nats

print -P "%F{green}Finished installing Homebrew packages%f"

################################################################
# MACOS CONFIG - FILES
################################################################

print -P "%F{blue}Showing all filename extensions%f"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

print -P "%F{blue}Hiding hidden files%f"
defaults write com.apple.finder AppleShowAllFiles false

print -P "%F{blue}Hiding full path in Finder title bar%f"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

################################################################
# MACOS CONFIG - FIREWALL
################################################################

print -P "%F{blue}Enabling firewall with logging and stealth mode%f"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

print -P "%F{blue}Preventing built-in software as well as code-signed, downloaded software from being whitelisted automatically%f"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

################################################################
# MACOS CONFIG - MISCELLANEOUS
################################################################

print -P "%F{blue}Disabling crash reporter%f"
defaults write com.apple.CrashReporter DialogType none

print -P "%F{blue}Disabling \"Downloaded from Internet warnings\" in macOS%f"
defaults write com.apple.LaunchServices LSQuarantine -bool NO

print -P "%F{blue}Enabling key repeat for all apps%f"
defaults write -g ApplePressAndHoldEnabled -bool false

################################################################
# COMPLETION
################################################################

print -P "%F{yellow}Completed macOS bootstrap%f"