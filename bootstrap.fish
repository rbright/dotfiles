#!/usr/bin/env fish

###############################################################################
# MACOS BOOTSTRAP
#
# This script installs all dependencies needed for a new macOS installation.
# It also sets various macOS configurations.
###############################################################################

################################################################
# INIT
################################################################

set_color yellow; echo "Initializing macOS bootstrap"; set_color normal

################################################################
# CORE
################################################################

# XCode CLI Tools
set_color blue; echo "Installing Xcode CLI Tools"; set_color normal
xcode-select --install

# Homebrew
set_color blue; echo "Installing Homebrew"; set_color normal
/bin/bash -c "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

################################################################
# GIT
################################################################

# Git
set_color blue; echo "Installing Git from Homebrew"; set_color normal
brew install git

# Git LFS
set_color blue; echo "Installing Git LFS from Homebrew"; set_color normal
brew install git-lfs

# GitHub CLI
set_color blue; echo "Installing GitHub CLI from Homebrew"; set_color normal
brew install gh

################################################################
# FISH SHELL
################################################################

set_color blue; echo "Installing Fish shell and plugins"; set_color normal

# fish
brew install fish

# fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install catppuccin/fish
fisher install edc/bass
fisher install jorgebucaran/nvm.fish
fisher install PatrickF1/fzf.fish

set_color green; echo "Installed Fish shell and plugins"; set_color normal

################################################################
# NUSHELL
################################################################

set_color blue; echo "Installing nushell"; set_color normal
brew install nushell
set_color green; echo "Installed nushell"; set_color normal

################################################################
# TERMINAL
################################################################

set_color blue; echo "Installing terminal utilities from Homebrew"; set_color normal

# Terminal utilities
brew install btop
brew install fzf
brew install --cask ghostty
brew install jq
brew install mkcert
brew install starship
brew install wget
brew install woff2
brew install yq
brew install zoxide

set_color green; echo "Installed terminal utilities from Homebrew"; set_color normal

################################################################
# TEXT EDITING
################################################################

set_color blue; echo "Installing text editing utilities from Homebrew"; set_color normal

brew install hadolint
brew install neovim
brew install shellcheck

set_color green; echo "Installed text editing utilities from Homebrew"; set_color normal

################################################################
# GPG
################################################################

set_color blue; echo "Installing GPG utilities from Homebrew"; set_color normal

brew install gnupg
brew install gnutls
brew install pinentry
brew install pinentry-mac

set_color green; echo "Installed GPG utilities from Homebrew"; set_color normal

################################################################
# LANGUAGE TOOLS
################################################################

set_color blue; echo "Installing language tools from Homebrew"; set_color normal

# Go
brew install go

# Node.js
curl -fsSL https://get.pnpm.io/install.sh | sh -
brew install watchman

# Python
curl -LsSf https://astral.sh/uv/install.sh | sh

# ngrok
brew install ngrok

set_color green; echo "Installed language tools from Homebrew"; set_color normal

################################################################
# MOBILE DEVELOPMENT
################################################################

set_color blue; echo "Installing mobile development tools from Homebrew"; set_color normal

brew install cocoapods
brew install fastlane
brew install --cask zulu17

set_color green; echo "Installed iOS & Android development tools from Homebrew"; set_color normal

################################################################
# KUBERNETES
################################################################

set_color blue; echo "Installing Kubernetes tools from Homebrew"; set_color normal
brew install k3d
brew install kubernetes-cli
brew install helm
brew install chart-testing
brew install tilt

################################################################
# CLOUD INFRASTRUCTURE
################################################################

set_color blue; echo "Installing cloud infrastructure tools from Homebrew"; set_color normal
brew tap hashicorp/tap
brew install awscli
brew install opentofu
brew install hashicorp/tap/terraform
brew install tilt-dev/tap/tilt
brew install --cask google-cloud-sdk

################################################################
# DATA MANAGEMENT
################################################################

set_color blue; echo "Installing data management tools from Homebrew"; set_color normal
brew install atlas
brew install libpq
brew install nats

set_color green; echo "Finished installing Homebrew packages"; set_color normal

################################################################
# MACOS CONFIG - FILES
################################################################

set_color blue; echo "Showing all filename extensions"; set_color normal
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

set_color blue; echo "Hiding hidden files"; set_color normal
defaults write com.apple.finder AppleShowAllFiles false

set_color blue; echo "Hiding full path in Finder title bar"; set_color normal
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

################################################################
# MACOS CONFIG - FIREWALL
################################################################

set_color blue; echo "Enabling firewall with logging and stealth mode"; set_color normal
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

set_color blue; echo "Preventing built-in software as well as code-signed, downloaded software from being whitelisted automatically"; set_color normal
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

################################################################
# MACOS CONFIG - MISCELLANEOUS
################################################################

set_color blue; echo "Disabling crash reporter"; set_color normal
defaults write com.apple.CrashReporter DialogType none

set_color blue; echo "Disabling \"Downloaded from Internet warnings\" in macOS"; set_color normal
defaults write com.apple.LaunchServices LSQuarantine -bool NO

set_color blue; echo "Enabling key repeat for all apps"; set_color normal
defaults write -g ApplePressAndHoldEnabled -bool false

################################################################
# COMPLETION
################################################################

set_color yellow; echo "Completed macOS bootstrap"; set_color normal