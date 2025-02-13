# Update all system packages and tools
function update
    set_color yellow
    echo "Updating macOS packages"
    update-homebrew

    # Update all system packages and tools
    update-homebrew
    update-pnpm
    update-vim

    # Update fish completions
    fish_update_completions

    set_color yellow
    echo "Completed macOS package updates"
    set_color normal
end