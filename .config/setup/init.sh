#!/bin/sh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state


export SOPS_CONFIG=$XDG_CONFIG_HOME/sops/.sops.yaml

export GITLIBS=$XDG_CACHE_HOME/gitlibs
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export MINIKUBE_HOME=$XDG_CONFIG_HOME/minikube

export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"

if [ -d "$PYENV_ROOT/bin" ]; then
  PATH="$PYENV_ROOT/bin:$PATH"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo "pyenv is not installed."
fi

eval "$(fnm env --use-on-cd)"

# Android
export ANDROID_USER_HOME=$XDG_CONFIG_HOME/android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_JVM=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export ANDROID_CLI_TOOL_PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/bin:$ANDROID_HOME/tools
export NDK_HOME=$ANDROID_HOME/ndk/26.1.10909125

# Java
export GRAALVM_VERSION=graalvm-ce-java17-22.3.1
export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/$GRAALVM_VERSION/Contents/Home
export JAVA_HOME=$GRAALVM_HOME
export JAVA_BIN_PATH=$JAVA_HOME/bin

. $XDG_CONFIG_HOME/homebrew/init.sh
. $XDG_CONFIG_HOME/starship/init.sh
. $XDG_CONFIG_HOME/setup/alias.sh
