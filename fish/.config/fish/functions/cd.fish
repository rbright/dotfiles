# Remove Docker images in the "dangling" state
function cd
    builtin cd $argv && ls -la
end