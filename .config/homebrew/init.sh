#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=$XDG_CONFIG_HOME/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile

alias brew_lock="brew bundle dump --force && brew bundle install --no-upgrade"
alias brew_init="brew bundle dump --force && brew bundle install"

if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
fi