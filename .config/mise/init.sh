#!/bin/sh

# Cache mise environment to avoid slow eval on each startup
if [[ ! -f "$XDG_CACHE_HOME/mise_env" || "$XDG_CONFIG_HOME/mise/init.sh" -nt "$XDG_CACHE_HOME/mise_env" ]]; then
    mise activate zsh > "$XDG_CACHE_HOME/mise_env"
fi
[[ -f "$XDG_CACHE_HOME/mise_env" ]] && source "$XDG_CACHE_HOME/mise_env"