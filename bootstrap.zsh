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

# Xcode CLI Tools
print -P "%F{blue}Installing Xcode CLI Tools%f"
xcode-select --install

# NixOS
print -P "%F{blue}Installing NixOS%f"
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

################################################################
# SHELL SETUP
################################################################

print -P "%F{blue}Installing shell utilities%f"

# Install zsh plugins using oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

print -P "%F{green}Installed shell utilities%f"

################################################################
# LANGUAGE TOOLS
################################################################

print -P "%F{blue}Installing language tools%f"

# Node.js
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Python
curl -LsSf https://astral.sh/uv/install.sh | sh

print -P "%F{green}Installed language tools%f"

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