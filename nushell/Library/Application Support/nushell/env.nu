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

# Android SDK
$env.ANDROID_HOME = ($env.HOME | path join "/Library/Android/sdk")
$env.JAVA_HOME = "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Go
$env.GOPATH = ($env.HOME | path join "go")

# Node.js
$env.PNPM_HOME = ($env.HOME | path join ".local/share/pnpm")

################################################################################
# Path Management
################################################################################

# Start with the existing PATH or system defaults
$env.PATH = ($env.PATH | default [
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
])

# Define all paths to add
let paths_to_add = [
    # Nix
    ($env.HOME | path join ".nix-profile/bin")
    "/nix/var/nix/profiles/default/bin"
    "/run/current-system/sw/bin"

    # User
    ($env.HOME | path join ".local/bin")

    # Homebrew
    "/opt/homebrew/bin"

    # Android
    ($env.ANDROID_HOME | path join "emulator")
    ($env.ANDROID_HOME | path join "platform-tools")

    # Go
    ($env.GOPATH | path join "bin")

    # Node.js - npm
    ($env.HOME | path join ".npm-global/bin")

    # Node.js - pnpm
    $env.PNPM_HOME
]

# Add all paths that exist to PATH
$env.PATH = ($paths_to_add
    | where { |it| $it | path exists }
    | append $env.PATH
    | uniq
)

################################################################################
# Shell Integration
################################################################################

# Carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# zoxide
zoxide init nushell | save -f ~/.zoxide.nu