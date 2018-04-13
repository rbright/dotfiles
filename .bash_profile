# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export NPM_PATH="/usr/local/share/npm/bin"
export NVM_DIR="$HOME/.nvm"
export YARN_PATH="$HOME/.yarn/bin"
export PYTHON_PATH="$HOME/Library/Python/2.7/bin"
export RBENV_PATH="$HOME/.rbenv/bin"
export ANDROID_HOME=$HOME/Library/Android/sdk
export FASTLANE_PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/bin:$NPM_PATH:$NVM_PATH:$YARN_PATH:$PYTHON_PATH:$RBENV_PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$FASTLANE_PATH:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
