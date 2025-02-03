function git-pull-all
    find . -type d -maxdepth 1 -mindepth 1 -exec git --git-dir={}"/.git" --work-tree=$PWD/{} pull origin main \;
end