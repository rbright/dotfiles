# env.nu
#
# Installed by:
# version = "0.102.0"
#
# https://www.nushell.sh/book/configuration.html
#
# This file is loaded before config.nu and login.nu
#
# View configuration options with:
# `help config env`

$env.EDITOR = "nvim"

################################################################################
# Prompt Command
################################################################################

# Show "nu" in the prompt
$env.PROMPT_COMMAND = "nu"

# Show the date and time in the right prompt
$env.PROMPT_COMMAND_RIGHT = {|| date now | format date "%d-%a %r" }

################################################################################
# Prompt Indicators
################################################################################

# When in Emacs mode (default):
$env.PROMPT_INDICATOR = "> "

# When in normal vi mode:
$env.PROMPT_INDICATOR_VI_NORMAL = "> "

# When in vi insert-mode:
$env.PROMPT_INDICATOR_VI_INSERT = ": "

# When a commandline extends across multiple lines:
$env.PROMPT_MULTILINE_INDICATOR = "::: "

################################################################################
# ENV Conversions
################################################################################

$env.ENV_CONVERSIONS = {
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "XDG_DATA_DIRS": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

################################################################################
# Development Tools
################################################################################

# pnpm
$env.PNPM_HOME = ($env.PATH | path join ".local/share/pnpm")

################################################################################
# Path Management
################################################################################

use std/util "path add"

# Android
path add ($env.HOME | path join "Library/Android/sdk")

# Go
path add ($env.HOME | path join "go/bin")

# pnpm
path add $env.PNPM_HOME

# NixOS
path add ($env.HOME | path join ".nix-profile/bin")

# Remove duplication from the PATH
$env.PATH = ($env.PATH | uniq)

################################################################################
# Shell Integration
################################################################################

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# zoxide
zoxide init nushell | save -f ~/.zoxide.nu
