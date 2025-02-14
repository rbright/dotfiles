# General
alias brews='brew list -1'
alias ln="ln -v"
alias mkdir="mkdir -p"
alias psgrep="ps -ax | grep"
alias sshgen="ssh-keygen -t ed25519 -C"

# Git
alias g="git"
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gbd="git branch --delete"
alias gco="git checkout"
alias gcb='git checkout -b'
alias gcl="git clone"
alias gc="git commit"
alias gcm='git commit --message'
alias gd='git diff'
alias gdpr="git difftool origin/main...origin/(git branch --show-current)"
alias glog='git log --oneline --decorate --graph'
alias ggpush='git push --force-with-lease origin'
alias gm="git merge"
alias gom="git merge --no-ff --no-edit"
alias ggpl="git pull origin main"
alias gpr="git pull-request"
alias grb="git rebase"
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grf='git reflog'
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias gpristine='git reset --hard && git clean --force -dfx'
alias gwipe='git reset --hard && git clean --force -df'
alias grm='git rm'
alias grmc='git rm --cached'
alias gstall='git stash --all'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gst='git status'
alias gta='git tag --annotate'
alias gts='git tag --sign'
alias gtv='git tag | sort -V'
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
