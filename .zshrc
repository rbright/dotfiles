ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbright"
DISABLE_AUTO_UPDATE="true"

plugins=(bundler docker docker-compose git rails react-native redis-cli)

export EDITOR="vim"
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)        # fix for Keybase error
export TERM="xterm-256color" # tmux colors

export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

# PATH Items
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export NPM_PATH="/usr/local/share/npm/bin"
export NVM_DIR="$HOME/.nvm"
export YARN_PATH="$HOME/.yarn/bin"
export PYTHON_PATH="$HOME/Library/Python/2.7/bin"
export RBENV_PATH="$HOME/.rbenv/bin"
export FASTLANE_PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/bin:$NPM_PATH:$NVM_PATH:$YARN_PATH:$PYTHON_PATH:$RBENV_PATH:$FASTLANE_PATH:$PATH"


# Homebrew Security Options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/development

# GPG Agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
  GPG_TTY=$(tty)
  export GPG_TTY
else
  eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
fi

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
