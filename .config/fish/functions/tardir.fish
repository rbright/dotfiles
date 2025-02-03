# Archive all directories in the current directory
function tardir
    for directory in (find $argv[1] -type d -maxdepth 1 -mindepth 1)
        tar pczf $directory.tar.gz $directory
        rm -rf $directory
    end
end