# Remove all git repositories in the current directory
function git-rm-all
    find . -type d -depth 1 -exec rm -rf {}/.git \;
end