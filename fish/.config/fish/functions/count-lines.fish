function count-lines
    find . -name "*.$argv[1]" | xargs wc -l
end