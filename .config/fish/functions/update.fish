# Update all system packages and tools
function update
    set_color yellow
    echo "Updating macOS packages"

    update-homebrew
    update-vim
    update-pnpm

    set_color yellow
    echo "Completed macOS package updates"
    set_color normal
end