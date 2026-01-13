#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=$XDG_CONFIG_HOME/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile

alias brew_lock="brew bundle dump --force && brew bundle install --no-upgrade"
alias brew_init="brew bundle install"

eval "$(/opt/homebrew/bin/brew shellenv)"

# deduplicate path
typeset -U PATH path

if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  # For building pkg-config, which is needed for some things like postgresql
  # https://github.com/pkgconf/pkgconf
  export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"
fi