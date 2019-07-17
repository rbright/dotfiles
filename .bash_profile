# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export RBENV_PATH="$HOME/.rbenv/bin"
export PATH="$HOME/bin:$RBENV_PATH:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Load rbenv
eval "$(rbenv init -)"
