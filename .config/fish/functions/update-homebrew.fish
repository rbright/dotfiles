# Update Homebrew packages and cleanup
function update-homebrew
    set_color blue
    echo "Updating the list of available Homebrew packages"
    brew update

    echo "Updating Homebrew packages"
    brew upgrade

    echo "Cleaning up old Homebrew applications"
    brew cleanup
    brew autoremove
    set_color green
    echo "Updated Homebrew packages"
    set_color normal
end