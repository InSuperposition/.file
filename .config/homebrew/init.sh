#!/bin/sh

export HOMEBREW_BUNDLE_FILE_GLOBAL=~/.config/homebrew/Brewfile
export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile
eval "$(/usr/local/bin/brew shellenv)"