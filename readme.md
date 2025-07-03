# `.file` repository

> a dotfile repository using [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) to compartmentalize shell configuration. Requires [GNU `stow`](https://www.gnu.org/software/stow/), [Homebrew](https://brew.sh/) and [`git`](https://git-scm.com/). Uses the amazing [`mise`](https://mise.jdx.dev/) to create environments for various programming languages.

## Setup

### Shell Configuration on 󰀵 (OS X)

#### `zsh`

This repo's .zshenv changes zsh's config to the following

```sh
export ZDOTDIR=$HOME/.config/zsh
```

### `.file` repo Installation

1. Install [`homebrew`](https://brew.sh/#install)

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

1. Install dependencies `git` and `stow`

   ```sh
   brew install git stow
   ```

1. On Github click 'Use this template' or fork repo.
1. In your new repo, **change git user name and email** in [`.config/git/config`](.config/git/config)
1. Clone your new repo from your $HOME directory

   ```sh
   git clone  https://github.com/<GITHUB_USER_NAME>/.file.git
   ```

1. Run `stow` from $HOME/.file, to symlink config files

   ```sh
   cd $HOME/.file
   ```

   ```sh
   stow .
   ```

1. Source `.zshrc` or open new terminal

   ```sh
   source $HOME/.config/zsh/.zshrc
   ```

   or use this repo's alias to reload zsh's config

   ```sh
   sz
   ```

1. Install `brew` packages

   ```sh
   brew bundle install --no-upgrade
   ```

## How It Works

### XDG Base Directory

[`init.sh`](init.sh) exports the following XDG spec environment variables, other `init.sh` files in [`.config/`](.config/) **depend** on these variables as well.

Some tools an `init.sh` file to setup aliases, run commands, environment variables, etc.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir/"
```

- [XDG Base Directory Summary and list of supported applications](https://wiki.archlinux.org/title/XDG_Base_Directory)
- [XDG Specification](https://specifications.freedesktop.org/basedir-spec/latest/)

### Git

[`.config/git`](.config/git/config) - user's git config

### Homebrew

Install brew packages and casks [.config/homebrew/Brewfile](.config/homebrew/Brewfile)

```sh
brew bundle install --no-upgrade
```

or to upgrade to latest versions, drop the --no-upgrade

```sh
brew bundle install
```

`install` is also optional

```sh
brew bundle
```

[`.config/homebrew`](.config/homebrew) - contains a list of applications to be installed and locked versions

Update [.config/homebrew/Brewfile](.config/homebrew/Brewfile) with currently installed packages

```sh
brew bundle dump --force
```

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Mac App Store CLI](https://github.com/mas-cli/mas)

### Stow

[`.stow-local-ignore`](.stow-local-ignore`)
[gnu `stow`](https://www.gnu.org/software/stow/manual/stow.html) to symlink the contents of the folder in a user's `$HOME` (`~`) folder by default.

### Mise - manage multiple versions of programming languages

[`.config/mise/config.toml`](.config/mise/config.toml)

common commands - <https://mise.jdx.dev/dev-tools/#common-commands>

## Stow Configuration Management

### .stow-local-ignore

The [`.stow-local-ignore`](.stow-local-ignore) file tells GNU Stow which files and directories to exclude when creating symlinks. Current exclusions:

- `.DS_Store` - macOS metadata files
- `.git` - Git repository data
- `.gitmodules` - Git submodule configuration
- `.gitignore` - Git ignore patterns
- `.stowrc` - Stow configuration files
- `readme.md` - This documentation file
- `/CLAUDE.md` - Claude AI instructions (repository root only)
- `^/[^/]*\.sh$` - Shell scripts in repository root

### Essential Commands

```sh
# Symlink configurations using stow (run from repo root)
stow .

# Reload zsh configuration
sz  # alias for sourcing .zshrc

# Install Homebrew packages (without upgrades)
brew bundle install --no-upgrade

# Install Homebrew packages with upgrades
brew bundle install

# Update Brewfile with currently installed packages
brew bundle dump --force
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

### Core Files

- `init.sh` - Main bootstrap script that sets XDG variables and loads all configurations
- `alias.sh` - Global shell aliases
- `.zshenv` - **Exports `ZDOTDIR=$HOME/.config/zsh`** to redirect zsh configuration
- `.config/git/config` - Git configuration and aliases for git and git-lfs
- `.config/*/init.sh` - Tool-specific initialization scripts
- `.config/homebrew/Brewfile` - Package management definitions
- `.config/mise/config.toml` - Programming language versions and packages
- `.stow-local-ignore` - Files/patterns to exclude from stowing

### Key Architecture

- **XDG Base Directory Structure**: All configurations follow XDG spec with files organized under `.config/`
- **Modular Initialization**: Each tool has its own `init.sh` file in `.config/[tool]/` that sets up environment variables and configurations
- **Central Bootstrap**: Main `init.sh` loads all tool-specific configurations and the global `alias.sh`
- **Symlink Management**: GNU `stow` creates symlinks from this repo to `$HOME` directory

## Development Tools Included

The repository manages versions for:

- Node.js (v22)
- Python (3.11)
- Java (Oracle GraalVM)
- Rust (stable)
- Deno (2.3.7)
- Clojure, Bun, and various CLI tools

## Remote Access Setup

The repository includes a comprehensive remote access plan using:

- **Zellij** as the terminal multiplexer (modern tmux replacement)
- **SSH certificate authentication** for secure connections
- **Mosh** for mobile connectivity resilience
- **WireGuard** for VPN access (optional final phase)

Key files:

- [`doc/remote-access.md`](doc/remote-access.md) - Complete setup guide
- [`.local/bin/remote_access_test`](.local/bin/remote_access_test) - Connection testing script
- [`.local/bin/zellij_*`](.local/bin/) - Zellij integration scripts

## Important Notes

- **Repository location flexibility**: The `.stowrc` file (`--target=$HOME`) allows this repository to be placed anywhere on your system
- Run `stow .` from the repository directory (wherever you cloned it)
- Brewfile contains both CLI tools and GUI applications
- Each tool's configuration is self-contained in its `.config/` subdirectory
- The `.zshenv` file in this repository exports the critical variable that redirects zsh to use XDG-compliant paths

## Cleanup

Recursively delete dangling symlinks

```sh
symlinks -dvr ~/.config | grep dangling
```
