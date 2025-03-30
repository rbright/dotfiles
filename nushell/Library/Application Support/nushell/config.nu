# config.nu
#
# Installed by:
# version = "0.102.0"
#
# https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# Open configuration in default editor:
# `config nu`
#
# View configuration options with:
# `config nu --doc | nu-highlight | less -R`

################################################################################
# Miscellaneous Settings
################################################################################

$env.config.error_style = "fancy"
$env.config.show_banner = false
$env.config.recursion_limit = 50
$env.config.rm.always_trash = false

# Use the LS_COLORS environment variable to colorize output
$env.config.ls.use_ls_colors = true

# Display right-prompt on first line of the left-prompt
$env.config.render_right_prompt_on_last_line = false

################################################################################
# Editor Settings
################################################################################

$env.config.buffer_editor = "nvim"
$env.config.cursor_shape.vi_insert = "block"
$env.config.cursor_shape.vi_normal = "underscore"
$env.config.edit_mode = "vi"

################################################################################
# History Settings
################################################################################

# "sqlite" or "plaintext"
$env.config.history.file_format = "sqlite"

# Don't share history between multiple sessions
$env.config.history.isolation = true

# Maximum number of lines kept in history
$env.config.history.max_size = 100_000

# Enable to share history between multiple sessions, else you have to close the session to write history to file
$env.config.history.sync_on_enter = true

################################################################################
# Completions Behavior
################################################################################

# prefix or fuzzy
$env.config.completions.algorithm = "prefix"

# Disable case-sensitive completions
$env.config.completions.case_sensitive = false

# Allow nushell to look into $env.PATH to find more suggestions
$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 100
$env.config.completions.external.completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}

# Allow partial filling of the prompt
$env.config.completions.partial = true

# Allow auto-selecting completions when only one remains
$env.config.completions.quick = true

################################################################################
# Terminal Integration
################################################################################

# Enable bracketed paste mode
$env.config.bracketed_paste = true

# Show current directory and running command in the terminal tab/window title
$env.config.shell_integration.osc2 = true

# Report the current directory to the terminal using OSC 7.
# This is useful when spawning new tabs in the same directory.
$env.config.shell_integration.osc7 = true

# Generate clickable links that can be launched in another application
$env.config.shell_integration.osc8 = true

# Alternative to OSC 7 which also communicates the current path to the terminal
$env.config.shell_integration.osc9_9 = false

# Set of several escape sequences which report:
#
# 1. starting location of the prompt
# 2. ending location of the prompt,
# 3. starting location of the command outpu
# 4. the exit code of the command.
$env.config.shell_integration.osc133 = true

# OSC 633, an extension to OSC 133 for Visual Studio Code
$env.config.shell_integration.osc633 = true

# Send ESC[?1l to the terminal to reset the application mode
#
# This sequence is used to keep cursor key modes in sync between the local
# terminal and a remote SSH host.
$env.config.shell_integration.reset_application_mode = true

# Use ANSI coloring for supported terminals
$env.config.use_ansi_coloring = "auto"

################################################################################
# Error Display
################################################################################

# Show errors with line-drawing characters to denote problem span
$env.config.error_style = "fancy"

# Display only error information printed by external command
$env.config.display_errors.exit_code = false

# Display Nushell error when child process terminated by signal
$env.config.display_errors.termination_signal = true

################################################################################
# Table Display
################################################################################

# Show table footer after table exceeds 25 rows
$env.config.footer_mode = 25

# Round float values to this precision when displaying in structured values
$env.config.float_precision = 4

# Use default table formatting
$env.config.table.mode = "rounded"

# Always show index column in tables and lists
$env.config.table.index_mode = "always"

# Show "empty list" or "empty table" when the list or table is empty
$env.config.table.show_empty = true

# Number of spaces to pad around values in each columns
$env.config.table.padding.left = 1
$env.config.table.padding.right = 1

# Wrap text and keep words together when it would cause the table to overflow
$env.config.table.trim = {
  methodology: "wrapping"
  wrapping_try_keep_words: true
}

# Display column header in its own row with a separator below
$env.config.table.header_on_separator = false

################################################################################
# Datetime Display
################################################################################

# Format that will be used to display a datetime when it appears as a raw value
$env.config.datetime_format.normal = "%m/%d/%y %I:%M:%S%p"

# Format that will be used to display a datetime when it appears in a table
$env.config.datetime_format.table = null

################################################################################
# Filesize Display
################################################################################

# Use units with metric (SI) prefixes (e.g. kB, MB, GB, etc.)
$env.config.filesize.unit = 'metric'

# Number of decimal places to display for filesize
$env.config.filesize.precision = 1

################################################################################
# Hooks
################################################################################

$env.config.hooks.pre_prompt = [
  # Enable direnv integration
  { ||
    if (which direnv | is-empty) {
      return
    }

    direnv export json | from json | default {} | load-env
    if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
      $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
    }
  }
]

################################################################################
# Themes and Syntax Highlighting
################################################################################

source "~/Library/Application Support/nushell/themes/catppuccin_mocha.nu"

################################################################################
# Plugins
################################################################################

source "~/Library/Application Support/nushell/config/plugins.nu"

################################################################################
# Aliases
################################################################################

source "~/Library/Application Support/nushell/config/aliases.nu"
source "~/Library/Application Support/nushell/config/functions.nu"
source "~/Library/Application Support/nushell/config/projects.nu"

################################################################################
# Shell Integration
################################################################################

source ~/.zoxide.nu