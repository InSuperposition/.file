# `.file` repository

> a dotfile repository using [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) to compartmentalize shell configuration.

## How It Works

### XDG Base Directory

[`.config/.file/init.sh`](.config/.file/init.sh) exports the following XDG spec environment variables, other `init.sh` files in this repo **depend** on these variables as well.

Some tools an `init.sh` file to setup aliases, run commands, environment variables, etc.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
```

- [XDG Base Directory Summary and list of supported applications](https://wiki.archlinux.org/title/XDG_Base_Directory)
- [XDG Specification](https://specifications.freedesktop.org/basedir-spec/latest/)

### Git

[`.config/git`](https://github.com/InSuperposition/git.git) - user's git config

### Homebrew

Install brew packages and casks [.config/homebrew/Brewfile.json](.config/homebrew/Brewfile.json)

```console
brew bundle install --no-upgrade

# or to upgrade to latest versions, drop the --no-upgrade
> brew bundle install

# install is also optional
> brew bundle
```

[`.config/homebrew`](https://github.com/InSuperposition/homebrew) - contains a list of applications to be installed and locked versions

Update [.config/homebrew/Brewfile](.config/homebrew/Brewfile) with currently installed packages

```console
brew bundle dump --force
```

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Mac App Store CLI](https://github.com/mas-cli/mas)

### Stow

[`.stow-local-ignore`](.stow-local-ignore`)
[gnu `stow`](https://www.gnu.org/software/stow/manual/stow.html) to symlink the contents of the folder in a user's `$HOME` (`~`) folder by default.

## Cleanup

Recursively delete dangling symlinks

```console
> symlinks -dvr ~/.config
```

## Setup

### Shell Configuration on 󰀵 (OS X)

#### `zsh`

1. `/etc/zshenv` <- create/edit file
1. Add the following line for for zsh to look for config files

```sh
export ZDOTDIR=$HOME/.config/zsh
```

#### 󰀵 (OS X) GUI

May need to set XDG Variables here for GUI

```console
launchctl setenv ENVIRONMENT_VARIABLE_NAME ENVIRONMENT_VARIABLE_VALUE
```

### `.file` Installation

1. install [`homebrew`](https://brew.sh/#install)

   ```console
   > /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

1. Install dependencies `git` and `stow`

   ```console
   > brew install git stow
   ```

1. Clone this repo to `$HOME/.file` directory

   ```console
   # from $HOME directory
   > git clone  https://github.com/InSuperposition/.file.git
   ```

1. Run `stow` from $HOME/.file, to symlink config files

   ```console
   > cd $HOME/.file
   > stow .
   ```

1. Source `.zshrc` or open new terminal

1. Install `brew` packages

   ```console
   > brew bundle install --no-upgrade
   ```
