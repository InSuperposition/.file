# `.file` repository

> a dotfile repository using [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) to compartmentalize shell configuration. Requires [GNU `stow`](https://www.gnu.org/software/stow/), [Homebrew](https://brew.sh/) and [`git`](https://git-scm.com/). Uses the amazing [`mise`](https://mise.jdx.dev/) to create environments for various programming languages.

## Setup

### Shell Configuration on 󰀵 (OS X)

#### `zsh`

1. `/etc/zshenv` <- create/edit file
1. Add the following line for for zsh to look for config files

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
   source $HOME/.file/zsh/.zshrc
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

## Cleanup

Recursively delete dangling symlinks

```sh
symlinks -dvr ~/.config | grep dangling
```
