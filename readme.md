# `.file/` (dotfile) repository

## Setup

### Shell Configuration

#### `zsh` on 󰀵

1. `/etc/zshenv` <- create/edit file
1. Add the following line:

```sh
export ZDOTDIR=$HOME/.config/zsh
```

### Installation

1. Clone this repo to `$HOME/.file` directory
1. In repo folder, install submodules: `git submodule update --init --recursive`
1. Run `$ . install.sh`
1. Change files

- change git config
  - user/email
  - vs code default tool

## How It Works

### XDG Base Directory

`.config/init.sh` exports the following environment variables, other `init.sh` files in this repo **depend** on these variables as well.

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

See `.config/git/ignore` if files are being ingorned globally

### Homebrew

<https://github.com/Homebrew/homebrew-bundle>
<https://github.com/mas-cli/mas>

### Stow

[gnu `stow`](<https://www.gnu.org/software/stow/manual/stow.html>) to symlink the contents of the folder in the user's `$HOME` (`~`) folder by default.

## Debug / Cleanup

Cleanup dead symlinks

```console
symlinks -dvr ~/.config
```
