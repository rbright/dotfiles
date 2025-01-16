#!/usr/bin/env zsh
set -euo pipefail

###############################################################################
# MACOS BOOTSTRAP
#
# This script installs all dependencies needed for a new macOS installation.
# It also sets various macOS configurations.
###############################################################################

################################################################
# INIT
################################################################

print -P '%F{yellow}Initializing macOS bootstrap%f'

################################################################
# CORE
################################################################

# XCode CLI Tools
# https://developer.apple.com/xcode/
print -P '%F{blue}Installing Xcode CLI Tools%f'
xcode-select --install

# Homebrew
# https://brew.sh/
#
# Package manager for macOS
print -P '%F{blue}Installing Homebrew%f'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

################################################################
# GIT
################################################################

# Git
# https://git-scm.com/
print -P '%F{blue}Installing Git from Homebrew%f'
brew install git

# Git LFS
# https://git-lfs.github.com/
#
# Manage large files with Git
print -P '%F{blue}Installing Git LFS from Homebrew%f'
brew install git-lfs

# GitHub CLI
# https://cli.github.com/
print -P '%F{blue}Installing GitHub CLI from Homebrew%f'
brew install gh

################################################################
# TERMINAL
################################################################

print -P '%F{blue}Installing terminal utilities from Homebrew%f'

# btop
# https://github.com/aristocratos/btop
#
# System monitoring tool
print -P '%F{blue}Installing btop from Homebrew%f'
brew install btop

# fzf
# https://github.com/junegunn/fzf
#
# Command-line fuzzy finder
print -P '%F{blue}Installing fzf from Homebrew%f'
brew install fzf

# jq
# https://github.com/jqlang/jq
#
# Run JSON queries from the command line
print -P '%F{blue}Installing jq from Homebrew%f'
brew install jq

# mkcert
# https://github.com/FiloSottile/mkcert
#
# Create local TLS certificates
print -P '%F{blue}Installing mkcert from Homebrew%f'
brew install mkcert

# starship
# https://starship.rs/
#
# Shell prompt
print -P '%F{blue}Installing starship from Homebrew%f'
brew install starship

# wget
# https://www.gnu.org/software/wget/
#
# Download files from the web
print -P '%F{blue}Installing wget from Homebrew%f'
brew install wget

# woff2
# https://github.com/google/woff2
#
# Web font compression
print -P '%F{blue}Installing woff2 from Homebrew%f'
brew install woff2

# yq
# https://github.com/mikefarah/yq
#
# Run YAML queries from the command line
print -P '%F{blue}Installing yq from Homebrew%f'
brew install yq

# zoxide
# https://github.com/ajeetdsouza/zoxide
print -P '%F{blue}Installing zoxide from Homebrew%f'
brew install zoxide

print -P '%F{green}Installed terminal utilities from Homebrew%f'

################################################################
# TEXT EDITING
################################################################

print -P '%F{blue}Installing text editing utilities from Homebrew%f'

# Hadolint
# https://github.com/hadolint/hadolint
#
# Dockerfile linting tool
print -P '%F{blue}Installing Hadolint from Homebrew%f'
brew install hadolint

# Neovim
# https://neovim.io/
#
# Modern text editor
print -P '%F{blue}Installing Neovim from Homebrew%f'
brew install neovim

# ShellCheck
# https://www.shellcheck.net/
#
# Shell script analysis tool
print -P '%F{blue}Installing ShellCheck from Homebrew%f'
brew install shellcheck

print -P '%F{green}Installed text editing utilities from Homebrew%f'

################################################################
# GPG
################################################################

print -P '%F{blue}Installing GPG utilities from Homebrew%f'

# GnuPG
# https://gnupg.org/
#
# Manage OpenPGP keys
print -P '%F{blue}Installing GnuPG from Homebrew%f'
brew install gnupg

# GnuTLS
# https://www.gnutls.org/
print -P '%F{blue}Installing GnuTLS from Homebrew%f'
brew install gnutls

# Pinentry
# https://www.gnupg.org/related_software/pinentry/index.en.html
#
# GPG password entry dialog
print -P '%F{blue}Installing Pinentry from Homebrew%f'
brew install pinentry
brew install pinentry-mac

print -P '%F{green}Installed GPG utilities from Homebrew%f'

################################################################
# LANGUAGE TOOLS
################################################################

print -P '%F{blue}Installed language tools from Homebrew%f'

# Go
# https://go.dev/
print -P '%F{blue}Installing Go development tools from Homebrew%f'
brew install go

# Node.js
# https://nodejs.org/
print -P '%F{blue}Installing Node.js development tools from Homebrew%f'
brew install pnpm
brew install watchman

# Python
# https://www.python.org/
print -P '%F{blue}Installing Python development tools from Homebrew%f'
brew install pipx
brew install pyenv

# ngrok
# https://ngrok.com/
print -P '%F{blue}Installing ngrok from Homebrew%f'
brew install ngrok/ngrok/ngrok

print -P '%F{green}Installed language tools from Homebrew%f'

################################################################
# MOBILE DEVELOPMENT
################################################################

print -P '%F{blue}Installing mobile development tools from Homebrew%f'

# CocoaPods
# https://cocoapods.org/
#
# Dependency manager for Cocoa projects
print -P '%F{blue}Installing CocoaPods from Homebrew%f'
brew install cocoapods

# Fastlane
# https://fastlane.tools/
#
# Build, test, and release your iOS and Android apps
print -P '%F{blue}Installing Fastlane from Homebrew%f'
brew install fastlane

# Zulu JDK 17
# https://www.azul.com/downloads/?package=jdk-17-bundle-macos
#
# OpenJDK 17 distribution
print -P '%F{blue}Installing Zulu OpenJDK from Homebrew%f'
brew install --cask zulu17

print -P '%F{green}Installed iOS & Android development tools from Homebrew%f'

################################################################
# KUBERNETES
################################################################

print -P '%F{blue}Installing Kubernetes tools from Homebrew%f'
brew install k3d
brew install kubernetes-cli
brew install helm
brew install chart-testing
brew install tilt

################################################################
# CLOUD INFRASTRUCTURE
################################################################

print -P '%F{blue}Installing cloud infrastructure tools from Homebrew%f'
brew tap hashicorp/tap
brew install awscli
brew install opentofu
brew install hashicorp/tap/terraform
brew install tilt-dev/tap/tilt
brew install --cask google-cloud-sdk

################################################################
# DATA MANAGEMENT
################################################################

print -P '%F{blue}Installing data management tools from Homebrew%f'
brew install atlas
brew install libpq
brew install nats

print -P '%F{green}Finished installing Homebrew packages%f'

################################################################
# MACOS CONFIG - FILES
################################################################

print -P '%F{blue}Showing all filename extensions%f'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

print -P '%F{blue}Hiding hidden files%f'
defaults write com.apple.finder AppleShowAllFiles false

print -P '%F{blue}Hiding full path in Finder title bar%f'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

################################################################
# MACOS CONFIG - FIREWALL
################################################################

print -P '%F{blue}Enabling firewall with logging and stealth mode%f'
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

print -P '%F{blue}Preventing built-in software as well as code-signed, downloaded software from being whitelisted automatically%f'
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

################################################################
# MACOS CONFIG - MISCELLANEOUS
################################################################

print -P '%F{blue}Disabling crash reporter%f'
defaults write com.apple.CrashReporter DialogType none

print -P '%F{blue}Disabling "Downloaded from Internet warnings" in macOS%f'
defaults write com.apple.LaunchServices LSQuarantine -bool NO

print -P '%F{blue}Enabling key repeat for all apps%f'
defaults write -g ApplePressAndHoldEnabled -bool false

################################################################
# COMPLETION
################################################################

print -P '%F{yellow}Completed macOS bootstrap%f'
