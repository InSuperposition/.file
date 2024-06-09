#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=$XDG_CONFIG_HOME/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile
eval "$(/usr/local/bin/brew shellenv)"