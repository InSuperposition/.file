#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=$XDG_CONFIG_HOME/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile

alias brew-lock="brew bundle dump --force && brew bundle install --no-upgrade"
alias brew-init="brew bundle dump --force && brew bundle install"

# Cache homebrew environment to avoid slow eval on each startup
if [[ ! -f "$XDG_CACHE_HOME/homebrew_env" || "$XDG_CONFIG_HOME/homebrew/init.sh" -nt "$XDG_CACHE_HOME/homebrew_env" ]]; then
    /usr/local/bin/brew shellenv > "$XDG_CACHE_HOME/homebrew_env"
fi
source "$XDG_CACHE_HOME/homebrew_env"