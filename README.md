# Dotfiles

This repository contains my personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## ⚡ Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) for dotfile management
- [Just](https://just.systems/) command runner for installation

## 🚀 Installation

Install dotfiles for a specific host:

```bash
just install lambda
just install omega
```

`just install` always requires an explicit host. Supported hosts:

- `lambda` (MacBook Pro)
- `omega` (Desktop Workstation / NixOS)

Dry-run host install operations:

```bash
STOW_FLAGS="-nv" just install lambda
STOW_FLAGS="-nv" just install omega
```

Remove (unstow) dotfiles for a specific host:

```bash
just uninstall lambda
just uninstall omega
```

Dry-run host uninstall operations:

```bash
STOW_FLAGS="-nv" just uninstall lambda
STOW_FLAGS="-nv" just uninstall omega
```

## 🧭 Host Packages

Host definitions live in `.stow/hosts/*.packages`, one package per line. Blank
lines and `#` comments are allowed.

This repository intentionally keeps only two hosts:

```bash
lambda.packages
omega.packages
```

Usage examples:

```bash
just install lambda
just install omega
```

## 🌍 Cross-OS Path Strategy

When config paths differ by OS (for example `~/Library/...` on macOS vs
`~/.config/...` on Linux), use this approach:

1. Keep truly shared configs in shared packages.
2. Split path-specific configs into OS-specific packages (for example
   `nushell-macos` and `nushell-linux`).
3. Select the correct package in each host file (`.stow/hosts/*.packages`).
4. Keep machine-only secrets/keys out of shared host files unless explicitly
   intended.

## 📦 Packages

| Package                                                                                | Description                                                                                                                  |
| -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| [aerospace](https://github.com/nikitabobko/AeroSpace)                                  | Tiling window manager for macOS with automatic workspace management                                                          |
| [boto](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)             | AWS SDK for Python configuration                                                                                             |
| [btop](https://github.com/aristocratos/btop)                                           | Terminal-based resource monitor with customizable UI                                                                         |
| [carapace](https://carapace.sh/)                                                       | Multi-shell completion framework providing completions across shells                                                         |
| [curl](https://curl.se/)                                                               | Command-line tool for transferring data with URL syntax                                                                      |
| [espanso](https://espanso.org/)                                                        | Cross-platform text expander for productivity                                                                                |
| [ghostty](https://ghostty.org/)                                                        | Modern terminal emulator with GPU acceleration                                                                               |
| [git](https://git-scm.com/)                                                            | Distributed version control system with custom aliases and GPG signing                                                       |
| [github](https://cli.github.com/)                                                      | GitHub CLI configuration for interacting with GitHub from the terminal                                                       |
| [gnupg](https://gnupg.org/)                                                            | GNU Privacy Guard for encryption and signing                                                                                 |
| [karabiner](https://karabiner-elements.pqrs.org/)                                      | Keyboard customizer for macOS with Vim-style navigation                                                                      |
| [macmon](https://github.com/vladkens/macmon)                                           | 🦀⚙️ Sudoless performance monitoring for Apple Silicon processors. CPU / GPU / RAM usage, power consumption & temperature 🌡️ |
| [nushell](https://www.nushell.sh/)                                                     | Modern shell written in Rust with structured data pipelines                                                                  |
| [neovim](https://neovim.io/)                                                           | Hyperextensible Vim-based text editor with Lua configuration                                                                 |
| [profile](https://www.gnu.org/software/bash/)                                          | Basic shell profile configuration                                                                                            |
| [readline](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html) | GNU Readline configuration for command-line editing                                                                          |
| [skhd](https://github.com/koekeishiya/skhd)                                            | Simple hotkey daemon for macOS system-wide shortcuts                                                                         |
| [starship](https://starship.rs/)                                                       | Cross-shell prompt with Git integration and language version displays                                                        |
| [tableplus](https://tableplus.com/)                                                    | Database GUI client with custom Catppuccin theme                                                                             |
| [tmux](https://tmux.github.io/)                                                        | Terminal multiplexer with Vim-style navigation and session persistence                                                       |
| [vnc](https://www.realvnc.com/)                                                        | Virtual Network Computing configuration for remote desktop                                                                   |
| [wezterm](https://wezfurlong.org/wezterm/)                                             | GPU-accelerated terminal emulator and multiplexer frontend                                                                   |
| [xcode](https://developer.apple.com/xcode/)                                            | Apple's IDE with custom Catppuccin Mocha color theme                                                                         |
| [zed](https://zed.dev/)                                                                | High-performance code editor built for collaboration                                                                         |
| [zellij](https://zellij.dev/)                                                          | Terminal workspace and session manager                                                                                       |
| [zsh](https://www.zsh.org/)                                                            | Z shell with Oh My Zsh framework and extensive customizations                                                                |

## 🎨 Theme

Most applications are configured with the [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) color scheme for visual consistency.
