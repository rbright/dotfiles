# Remove Python compiled files from the current directory
function rmpyc
    find . -name "*.pyc" -exec rm -f {} \;
end