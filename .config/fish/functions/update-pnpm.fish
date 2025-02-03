# Update pnpm to the latest version
function update-pnpm
    set_color blue
    echo "Updating pnpm"
    pnpm self-update
    set_color green
    echo "Updated pnpm"
    set_color normal
end