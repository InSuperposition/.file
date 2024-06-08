#!/bin/sh

# Containers
. ~/.config/container/init.sh

# Language
. ~/.config/clojure/init.sh
. ~/.config/java/init.sh
. ~/.config/javascript/init.sh
. ~/.config/python/init.sh
. ~/.config/rust/init.sh

. ~/.config/starship/init.sh
. ~/.config/shell/alias.sh

# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
