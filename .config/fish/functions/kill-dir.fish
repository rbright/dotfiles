# Kill all processes using the given directory
function kill-dir
    lsof | grep $argv[1] | awk '{print $2}' | xargs kill
end