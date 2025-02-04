function setup-symlinks
    # Define dotfiles to symlink to home directory
    set dotfiles \
        .boto \
        .config/btop \
        .config/fish/completions \
        .config/fish/conf.d \
        .config/fish/config.fish \
        .config/fish/fish_plugins \
        .config/fish/fish_variables \
        .config/fish/functions \
        .config/fish/themes \
        .config/gh \
        .config/ghostty \
        .config/karbiner/assets \
        .config/karbiner/karbiner.json \
        .config/nvim \
        .config/starship.toml \
        .config/zed/keymap.json \
        .config/zed/settings.json \
        .config/zed/themes \
        .curlrc \
        .gitconfig \
        .inputrc \
        .profile \
        .ssh \
        .warp \
        .vim \
        .vimrc \
        .vnc \
        .zsh \
        .zshrc

    # Symlink dotfiles from Google Drive to home directory
    for dotfile in $dotfiles
        rm -f "$HOME/$dotfile"
        ln -s "$HOME/Google Drive/My Drive/Projects/dotfiles/$dotfile" "$HOME/$dotfile"
        echo "Created symlink for $dotfile"
    end

    # Symlink Xcode themes from Google Drive to Xcode directory
    set xcode_themes_dir "$HOME/Google Drive/My Drive/Projects/dotfiles/xcode/themes"
    set xcode_dest_dir "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"

    # Create symlinks for each theme file
    for theme in $xcode_themes_dir/*
        set theme_name (basename $theme)
        rm -f "$xcode_dest_dir/$theme_name"
        ln -s "$theme" "$xcode_dest_dir/$theme_name"
        echo "Created symlink for Xcode theme: $theme_name"
    end

    # Symlink global gitignore
    ln -s "$HOME/Google Drive/My Drive/Projects/dotfiles/gitignore" "$HOME/.gitignore"
    echo "Created symlink for .gitignore"
end