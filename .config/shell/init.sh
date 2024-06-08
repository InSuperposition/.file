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

export XDG_CONFIG_HOME=~/.config