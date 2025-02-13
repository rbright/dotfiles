if status is-interactive
    # Commands to run in interactive sessions can go here
end

################################################################################
# Shell Settings
################################################################################

set -x EDITOR vim
set -x LANG en_US.UTF-8

# Homebrew Security Options
set -x HOMEBREW_CASK_OPTS --require-sha
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_INSECURE_REDIRECT 1

# OpenSSL
set -x CPPFLAGS "-I/usr/local/opt/openssl/include"
set -x LDFLAGS "-L/usr/local/opt/openssl/lib"

################################################################################
# Development Tools
################################################################################

# Android
set -x ANDROID_HOME {$HOME}/Library/Android/sdk
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Go
set -x GOPATH {$HOME}/go
set -x GOROOT /opt/homebrew/opt/go/libexec

# Google Cloud SDK
if test -f (brew --prefix)/share/google-cloud-sdk/path.fish
    source (brew --prefix)/share/google-cloud-sdk/path.fish
end

# pnpm
set -gx PNPM_HOME {$HOME}/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

################################################################################
# Path Management
################################################################################

# Reset path variable
set -e fish_user_paths
set -gx fish_user_paths

# Homebrew paths
set -ap fish_user_paths /opt/homebrew/bin
set -ap fish_user_paths /opt/homebrew/sbin

# User paths
set -ap fish_user_paths {$HOME}/.local/bin

# Android
set -ap fish_user_paths {$ANDROID_HOME}/emulator
set -ap fish_user_paths {$ANDROID_HOME}/platform-tools

# Go
set -ap fish_user_paths {$GOPATH}/bin
set -ap fish_user_paths {$GOROOT}/bin

# Node (pnpm)
set -ap fish_user_paths {$PNPM_HOME}

# Postgres
set -ap fish_user_paths /opt/homebrew/opt/libpq/bin

# Add system PATH
set -ap fish_user_paths $PATH

################################################################################
# Shell Integration
################################################################################

# starship
if type -q starship
    starship init fish | source
end

# fzf
if type -q fzf
    source (brew --prefix)/opt/fzf/shell/key-bindings.fish
end

# zoxide
if type -q zoxide
    zoxide init fish | source
end

# terraform
if type -q terraform
    complete -c terraform -f -a "(terraform completion fish)"
end

# Windsurf
fish_add_path /Users/rbright/.codeium/windsurf/bin