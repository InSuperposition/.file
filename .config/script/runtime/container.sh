#!/bin/sh

# Krew
export KREW_BIN_PATH="${KREW_ROOT:-$HOME/.krew}/bin"

# Podman
# export DOCKER_HOST="$HOME/.local/share/containers/podman/machine/podman-machine-default/podman.sock"

export PATH="$KREW_BIN_PATH:$PATH"

alias k=kubectl