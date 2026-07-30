#!/bin/bash

export HOMEBREW_BUNDLE_FILE_GLOBAL="$XDG_CONFIG_HOME/homebrew/Brewfile"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"

alias brew_lock="brew bundle dump --force && brew bundle install --no-upgrade"
alias brew_init="brew bundle install"


HOMEBREW_PREFIX=$(brew --prefix)
eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"

# deduplicate path
typeset -U PATH

if type brew &>/dev/null; then
  # For building pkg-config, which is needed for some things like PostgreSQL
  # https://github.com/pkgconf/pkgconf
  PKG_CONFIG_PATH="$HOMEBREW_PREFIX/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"
  export PKG_CONFIG_PATH
fi