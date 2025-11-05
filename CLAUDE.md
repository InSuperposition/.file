# Claude AI Instructions for .file Repository

This file provides guidance to Claude Code on understanding and working with this XDG-compliant dotfiles repository.

## Repository Understanding

### What This Repository Is

This is a **dotfiles repository** that manages shell and application configurations using:

- **XDG Base Directory Specification** for organized file structure
- **GNU Stow** for symlink management
- **Homebrew** for package management
- **Mise** for programming language version management

### Key Concepts

1. **XDG Compliance**: All configurations are organized under `.config/` following the XDG Base Directory specification
2. **Symlink-Based**: Files are symlinked from this repository to `$HOME` using GNU Stow
3. **Modular Design**: Each tool has its own configuration directory with initialization scripts
4. **Environment Isolation**: Programming languages managed via Mise for consistent development environments

## How to Navigate This Repository

### Essential Reference Files

1. **[readme.md](readme.md)** - Complete setup instructions, architecture overview, and user documentation
2. **[init.sh](init.sh)** - Main bootstrap script that sets up XDG environment variables
3. **[alias.sh](alias.sh)** - Global shell aliases available across all sessions

### Configuration Structure

```shell
.config/
├── [tool]/
│   ├── alias.sh          # Tool-specific aliases
│   ├── init.sh          # Tool-specific initialization
│   ├── config files     # Tool configurations
│   └── ...
├── homebrew/Brewfile    # Package definitions
├── mise/config.toml     # Language versions
├── git/config           # Git configuration
└── zsh/                 # Shell configuration
```

### Understanding File Roles

- **`.zshenv`** - Exports `ZDOTDIR=$HOME/.config/zsh` (critical for XDG compliance)
- **`.stowrc`** - Contains `--target=$HOME` allowing repository to be placed anywhere
- **`.stow-local-ignore`** - Defines which files Stow should NOT symlink
- **`init.sh` files** - Each tool's setup script loaded by main `init.sh`
- **`.local/bin/`** - Custom executable scripts and utilities

## Working with This Repository

### When Making Changes

1. **Check existing patterns** - Look at how similar tools are configured
2. **Follow XDG structure** - Place configurations in appropriate `.config/[tool]/` directories
3. **Use modular initialization** - Create `init.sh` files for new tools
4. **Update documentation** - Keep readme.md current with changes
5. **Test with Stow** - Ensure symlinks work correctly
6. **Respect file casing** - Use lowercase filenames (`readme.md`, not `README.md`)

### Understanding Tool Integration

- **Ghostty**: Terminal emulator configuration
- **Git**: Version control with custom aliases and LFS support
- **Homebrew**: Package management for CLI tools and GUI applications
- **Mise**: Programming language version management (replaces rbenv, nvm, etc.)

### Common Operations

```bash
# Deploy configurations
stow .

# Reload shell configuration
sz

# Install packages
brew bundle install

# Update language versions
mise install
```

### Key Principles

1. **Everything is symlinked** - Original files stay in this repository
2. **XDG compliance** - Configurations follow standard directory structure
3. **Tool isolation** - Each tool's config is self-contained
4. **Version control** - All configurations are tracked in Git
5. **Reproducibility** - Setup can be replicated on any compatible system

## Recent Updates

### Script Naming Standardization (Current)

- Renamed 6 scripts with proper prefixes for better organization:
  - `ssh_setup` → `setup_ssh`
  - `security_setup` → `setup_security`
  - `service_setup` → `setup_service`
  - `firewall_setup` → `setup_firewall`
  - `iphone_setup_guide` → `setup_iphone_guide`
  - `ssh_cert_renew` → `renew_ssh_cert`
- Updated all documentation and internal script references for consistency
- Improved script discoverability with logical grouping by function

### iPhone Terminal Access System (Previous)

- Created comprehensive automated setup system with 13 scripts and configuration files
- Implemented SSH certificate-based authentication with automatic CA management
- Added security hardening with SSHGuard, pf firewall rate limiting, and SOPS encryption
- Built QR code generation system for easy mobile certificate transfer
- Developed comprehensive monitoring, troubleshooting, and health check tools
- Rewrote documentation to reflect script-based automation approach
