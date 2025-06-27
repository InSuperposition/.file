# claude.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository that uses the XDG Base Directory Specification to organize shell configuration files. It's designed for macOS systems and uses GNU `stow` for symlink management, Homebrew for package management, and `mise` for programming language version management.

## Key Architecture

- **XDG Base Directory Structure**: All configurations follow XDG spec with files organized under `.config/`
- **Modular Initialization**: Each tool has its own `init.sh` file in `.config/[tool]/` that sets up environment variables and configurations
- **Central Bootstrap**: Main `init.sh` loads all tool-specific configurations and the global `alias.sh`
- **Symlink Management**: GNU `stow` creates symlinks from this repo to `$HOME` directory

## Essential Commands

### Setup and Installation

```sh
# Install Homebrew packages (without upgrades)
brew bundle install --no-upgrade

# Install Homebrew packages with upgrades
brew bundle install

# Update Brewfile with currently installed packages
brew bundle dump --force

# Symlink configurations using stow (run from repo root)
stow .

# Reload zsh configuration
sz  # alias for sourcing .zshrc
```

### Development Environment Management

```sh
# Mise commands for language version management
mise install           # Install all tools from config.toml
mise use node@20       # Use specific version locally
mise list              # List installed tools
mise outdated          # Check for updates
```

### Maintenance

```sh
# Find dangling symlinks recursively
symlinks -vr ~/.config | grep dangling

# Clean up broken symlinks (be careful)
symlinks -dr ~/.config
```

## Configuration Structure

- `init.sh` - Main bootstrap script that sets XDG variables and loads all configurations
- `alias.sh` - Global shell aliases
- `.claude/claude.md - is claude's global config file
- `.config/git/config` - is git config and aliases for git and git-lfs
- `.config/*/init.sh` - Tool-specific initialization scripts
- `.config/homebrew/Brewfile` - Package management definitions
- `.config/mise/config.toml` - Programming language versions and packages
- `.stow-local-ignore` - Files/patterns to exclude from stowing

## Development Tools Included

The repository manages versions for:

- Node.js (v22)
- Python (3.11)
- Java (Oracle GraalVM)
- Rust (stable)
- Deno (2.3.7)
- Clojure, Bun, and various CLI tools

## Important Notes

- Always run `stow .` from the repository root (`$HOME/.file`)
- Brewfile contains both CLI tools and GUI applications
- Each tool's configuration is self-contained in its `.config/` subdirectory
- The setup requires manual editing of `/etc/zshenv` to set `ZDOTDIR=$HOME/.config/zsh`
