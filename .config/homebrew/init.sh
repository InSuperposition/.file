#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=$XDG_CONFIG_HOME/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile

alias brew-lock="brew bundle dump --force && brew bundle install --no-upgrade"
alias brew-init="brew bundle dump --force && brew bundle install"
