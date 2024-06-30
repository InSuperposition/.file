# `.file/` (dotfile) repository

## Setup

### Shell Configuration

#### `zsh` on 󰀵 (OS X)

1. `/etc/zshenv` <- create/edit file
1. Add the following line for for zsh to use

```sh
export ZDOTDIR=$HOME/.config/zsh
```

### Installation

1. Clone this repo to `$HOME/.file` directory
1. In repo folder, install submodules: `git submodule update --init --recursive`
1. [install `homebrew`](https://docs.brew.sh/Installation)
1. `brew install stow`
1. `stow .`
1. Change git config [.config/git/config](.config/git/config)

- user name/email
- merge/diff tools (VS Code is default)

## How It Works

### XDG Base Directory

[`.config/setup/init.sh`](.config/setup/init.sh) exports the following XDG spec environment variables, other `init.sh` files in this repo **depend** on these variables as well.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
```

Find out more about these variables (and others)

- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
- [XDG Base Directory Summary and list of supported applications](https://wiki.archlinux.org/title/XDG_Base_Directory)

### Git

[`.config/git`](.config/git) - user's git config folder

- [attributes](.config/git/attributes) - [docs 📕🗎🗎🗎](https://git-scm.com/docs/gitattributes)
- [config](.config/git/config) - [docs 📕🗎🗎🗎](https://git-scm.com/docs/git-config)
- [ignore](.config/git/ignore) - [docs 📕🗎🗎🗎](https://git-scm.com/docs/gitignore)

[.gitmodules] - repository's [git submodules](https://git-scm.com/docs/submodule)

### Homebrew

[`.config/homebrew`](.config/homebrew)

Install brew packages and casks [.config/homebrew/Brewfile.lock.json](.config/homebrew/Brewfile.lock.json)
If there is a vesion conflict updates lock file with installed version

```console
brew bundle
```

Update [.config/homebrew/Brewfile](.config/homebrew/Brewfile) with currently installed packages

```console
brew bundle dump --force
```

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Mac App Store CLI](https://github.com/mas-cli/mas)

### Stow

[`.stow-local-ignore`](.stow-local-ignore`)
[gnu `stow`](<https://www.gnu.org/software/stow/manual/stow.html>) to symlink the contents of the folder in a user's `$HOME` (`~`) folder by default.

## Debug / Cleanup

Recursively cleanup dead symlinks

```console
symlinks -dvr ~/.config
```
