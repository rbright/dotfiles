# Remove vim undo files from the current directory
function rmundo
    find . -name "*.un~" -exec rm -f {} \;
end