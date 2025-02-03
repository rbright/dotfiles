# Clear duplicates from the "Open With" menu in OS X
function clear-open-with-dups
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
end