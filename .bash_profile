# iTerm 2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="$HOME/bin:$RBENV_PATH:$PATH"

# Rust
. "$HOME/.cargo/env"

export PATH="/Users/rbright/.local/share/solana/install/active_release/bin:$PATH"
