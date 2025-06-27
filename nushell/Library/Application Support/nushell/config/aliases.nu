# Keep macOS open command working
alias nu-open = open
alias open = ^open

# General
alias brews = brew list -1
alias c = clear
alias l = ls -la
alias ln = ln -v
alias sshgen = ssh-keygen -t ed25519 -C
alias v = nvim
alias vim = nvim

# Modern CLI Tools
alias ls = eza
alias ll = eza -l
alias la = eza -la
alias lt = eza --tree
alias cat = bat
alias find = fd

# Git
alias g = git
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsn = git bisect new
alias gbso = git bisect old
alias gbsr = git bisect reset
alias gbss = git bisect start
alias gbd = git branch --delete
alias gco = git checkout
alias gcb = git checkout -b
alias gcl = git clone
alias gc = git commit
alias gcm = git commit --message
alias gd = git diff
alias gdpr = git difftool origin/main...origin/(git branch --show-current)
alias glog = git log --oneline --decorate --graph
alias ggpush = git push --force-with-lease origin
alias gm = git merge
alias gom = git merge --no-ff --no-edit
alias ggpl = git pull origin main
alias gpr = git pull-request
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbi = git rebase --interactive
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grf = git reflog
alias grh = git reset
alias gru = git reset --
alias grhh = git reset --hard
alias grhk = git reset --keep
alias grhs = git reset --soft
alias grm = git rm
alias grmc = git rm --cached
alias gstall = git stash --all
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gst = git status
alias gta = git tag --annotate
alias gts = git tag --sign
alias gtv = git tag | sort -V
alias gw = git worktree
alias gwl = git worktree list
alias gwa = git worktree add
alias gwr = git worktree remove
alias gwrf = git worktree remove --force
alias tower = gittower

# Claude Code
alias yolo = claude --dangerously-skip-permissions
alias cclive = npx ccusage@latest blocks --live
alias ccblocks = npx ccusage@latest blocks
alias ccdaily = npx ccusage@latest daily
alias ccmonthly = npx ccusage@latest monthly

# Docker
alias di = docker images
alias db = docker build
alias dr = docker run -it --rm
alias dt = docker tag
alias dp = docker push
alias dv = docker volume
alias dcb = docker compose build
alias dcu = docker compose up
alias dcr = docker compose run --rm

# Go
alias got = go test ./... -v

# Kubernetes
alias k = kubectl

# Nix
alias nb = nix run .#build
alias nbs = nix run .#build-switch

# Python
alias python = python3
alias py = python3
alias pip = pip3
