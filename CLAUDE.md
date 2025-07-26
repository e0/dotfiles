# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS that manages development environment configurations through symbolic links. Configuration files remain in the repository and are symlinked to their expected system locations.

## Common Commands

### Setup and Installation
```bash
# Initial setup after cloning
./setup.sh

# Reload shell configuration after changes
source ~/.zshrc
```

### Development Workflows

When modifying configurations:
1. Edit files directly in the dotfiles repository (not the symlinked locations)
2. Changes take effect immediately for most configurations
3. For shell changes, run `source ~/.zshrc` to reload

Key configuration files:
- Shell: `zshrc`, `bash/alias`, `bash/env`, `bash/config`
- Neovim: `nvim/lua/e0/` (modular Lua configuration)
- Terminal emulators: `wezterm.lua`, `ghostty_config`
- Git: `gitconfig`

## Architecture

### Symlink Structure
The `setup.sh` script creates these symlinks:
- `~/dotfiles/zshrc` → `~/.zshrc`
- `~/dotfiles/nvim` → `~/.config/nvim`
- `~/dotfiles/wezterm.lua` → `~/.wezterm.lua`
- `~/dotfiles/ghostty_config` → `~/Library/Application Support/com.mitchellh.ghostty/config`
- `~/dotfiles/bash` → `~/.bash`
- `~/dotfiles/gitconfig` → `~/.gitconfig`

### Configuration Organization
- **Shell**: ZSH with Oh-My-ZSH framework, sources bash configurations for aliases and environment
- **Neovim**: Modern Lua-based configuration with lazy.nvim plugin manager
- **Terminal Emulators**: WezTerm and Ghostty with consistent theming
- **Development Tools**: Node.js (via Volta), Python (via Conda/Miniforge), Rust, Go

### Key Features
- Dynamic light/dark theme switching in WezTerm
- Extensive git integration in shell prompt
- Consistent Catppuccin theming across tools
- Modular Neovim configuration under `lua/e0/`