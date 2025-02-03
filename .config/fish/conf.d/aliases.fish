# General
alias brews='brew list -1'
alias csvcols="cut -d, -f"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias psgrep="ps -ax | grep"
alias sshgen="ssh-keygen -t ed25519 -C"

# Git
alias gcl="git clone"
alias ggpl="git pull"
alias ggpsh="git push --force-with-lease"
alias ggpshf="git push --force"
alias gm="git merge"
alias gom="git merge --no-ff --no-edit"
alias grb="git rebase"
alias gbd="git branch -D"
alias gpr="git pull-request"
alias gdpr="git difftool origin/main...origin/(git branch --show-current)"
alias gt="gittower"

# Docker
alias di="docker images"
alias db="docker build"
alias dr="docker run -it --rm"
alias dt="docker tag"
alias dp="docker push"
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcr="docker compose run --rm"

# Go
alias got="go test ./... -v"

# Kubernetes
alias kc="kubectl"

# Ollama
alias ol="ollama run llama3.2:3b"

# Python
alias python="python3"
alias py="python3"
alias pip="pip3"