#!/bin/zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/${UID}-runtime}"

# Create privately; -p tolerates another shell creating it first.
if [[ "$XDG_RUNTIME_DIR" == /* && ! -e "$XDG_RUNTIME_DIR" && ! -L "$XDG_RUNTIME_DIR" ]]; then
    (umask 077; /bin/mkdir -p -m 700 "$XDG_RUNTIME_DIR") 2>/dev/null
fi

# Check the directory target, including when the path is a symlink.
if [[ "$XDG_RUNTIME_DIR" != /* || ! -d "$XDG_RUNTIME_DIR" || ! -O "$XDG_RUNTIME_DIR" ||
      "$(/usr/bin/stat -L -f '%Lp' "$XDG_RUNTIME_DIR" 2>/dev/null)" != 700 ]]; then
    unset XDG_RUNTIME_DIR
    print -u2 -- 'xdg: XDG_RUNTIME_DIR unset; require an accessible absolute directory owned by this user with mode 0700.'
fi