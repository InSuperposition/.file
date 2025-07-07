# Claude AI Instructions for .file Repository

This file provides guidance to Claude Code on understanding and working with this XDG-compliant dotfiles repository.

## Repository Understanding

### What This Repository Is

This is a **dotfiles repository** that manages shell and application configurations using:

- **XDG Base Directory Specification** for organized file structure
- **GNU Stow** for symlink management
- **Homebrew** for package management
- **Mise** for programming language version management
- **Zellij** as the primary terminal multiplexer

### Key Concepts

1. **XDG Compliance**: All configurations are organized under `.config/` following the XDG Base Directory specification
2. **Symlink-Based**: Files are symlinked from this repository to `$HOME` using GNU Stow
3. **Modular Design**: Each tool has its own configuration directory with initialization scripts
4. **Environment Isolation**: Programming languages managed via Mise for consistent development environments

## How to Navigate This Repository

### Essential Reference Files

1. **[readme.md](readme.md)** - Complete setup instructions, architecture overview, and user documentation
2. **[doc/remote-access.md](doc/remote-access.md)** - Comprehensive remote access setup using Zellij, SSH certificates, and security hardening
3. **[init.sh](init.sh)** - Main bootstrap script that sets up XDG environment variables
4. **[alias.sh](alias.sh)** - Global shell aliases available across all sessions

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

- **Zellij**: Modern terminal multiplexer with KDL configuration files
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

## Remote Access & Security Features

### iPhone Terminal Access System

This repository includes a comprehensive system for secure iPhone terminal access with automated setup scripts:

**Core Components:**

- **SSH Certificate Authentication** - Enterprise-grade security with automatic CA management
- **Zellij Terminal Multiplexer** - Modern tmux replacement optimized for mobile use
- **Mosh Integration** - Mobile-resilient connections over unreliable networks
- **Security Hardening** - SSHGuard, pf firewall, and SOPS encryption

**Automated Setup Scripts (`.local/bin/`):**

- `setup_ssh` - SSH certificate authority and server configuration
- `setup_security` - SSHGuard, SOPS, and firewall configuration
- `setup_service` - macOS LaunchAgent service management
- `setup_firewall` - pf firewall management with rate limiting
- `setup_iphone_guide` - Interactive mobile setup wizard
- `renew_ssh_cert` - Certificate renewal automation

**Management & Troubleshooting:**

- `remote_health_check` - Comprehensive system health monitoring
- `connection_test` - Connection testing suite
- `cert_status` - Certificate management and status
- `troubleshoot_remote` - Advanced diagnostic and repair tools
- `generate_qr_config` - QR code generator for mobile configuration

### Security Features

- **Certificate-based SSH authentication** with automatic CA management
- **SOPS encryption** for sensitive configuration storage
- **Rate limiting** with pf firewall rules to prevent brute force attacks
- **SSHGuard integration** for real-time intrusion prevention
- **Automated certificate renewal** with expiry monitoring
- **Mobile-optimized security** with QR code setup for easy certificate transfer

### Maintenance

- Regular symlink cleanup with `symlinks -dvr ~/.config`
- Package updates via `brew bundle install`
- Language version management through `mise outdated`
- **Certificate monitoring** with `cert_status` and automated renewal alerts
- **Security monitoring** with `remote_health_check` and firewall status checks

## Documentation Sources

When working with this repository, always reference:

1. **readme.md** for user-facing setup and usage instructions
2. **doc/remote-access.md** for comprehensive remote access setup and security configuration
3. **doc/iphone_setup.md** for detailed mobile terminal access instructions
4. **Individual `.config/[tool]/` directories** for tool-specific configurations
5. **`.stow-local-ignore`** to understand what gets symlinked
6. **`.zshenv`** for the critical zsh directory redirection

**Note**: File casing matters in this repository - use lowercase `readme.md`, not `README.md`.

This repository represents a modern, well-organized approach to dotfiles management with strong emphasis on security, modularity, XDG compliance, and comprehensive iPhone terminal access capabilities.

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
- Integrated Zellij terminal multiplexer for mobile-optimized experience
- Built QR code generation system for easy mobile certificate transfer
- Developed comprehensive monitoring, troubleshooting, and health check tools
- Rewrote documentation to reflect script-based automation approach
