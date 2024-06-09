# `.file/` (dotfile) repository

## Target

### OS

- [ ] 🐧 Linux
- [x] 🍎 MacOS
- [ ] 🪟 Windows

### Shell

- [ ] `bash`
- [ ] `fish`
- [x] `zsh`

## Installation

This repo uses [gnu `stow`](https://www.gnu.org/software/stow/manual/stow.html) to symlink the contents of the folder in the user's `$HOME` (`~`) folder by default.

`stow` is a symlink farm manager which is used to manage dotfiles. This repository contains instructions on how to use stow to manage dotfiles.

- file moved or renamed, rerun stow command

- Symlinks
- submodules

- change git config
- user/email
- vs code default tool

- [uses XDG Base Directory for `$HOME/.config`](https://wiki.archlinux.org/title/XDG_Base_Directory)
- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
```

Create and add one line to `/etc/zshenv`

```sh
export ZDOTDIR=$HOME/.config/zsh
```

Took some liberties with .config/shell

<https://github.com/Homebrew/homebrew-bundle>
<https://github.com/mas-cli/mas>

See `.config/git/ignore` if files are being ingorned globally
