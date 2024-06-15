#!/bin/sh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_JVM="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_CLI_TOOL_PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/bin:$ANDROID_HOME/tools"
export NDK_HOME="$ANDROID_HOME/ndk/26.1.10909125"

# Java
export GRAALVM_VERSION="graalvm-ce-java17-22.3.1" # "graalvm-ce-lts-java11-20.3.4" #"graalvm-jdk-21" # "graalvm-ce-java11-22.3.1" # 
export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/$GRAALVM_VERSION/Contents/Home"
export JAVA_HOME="$GRAALVM_HOME" # "$ANDROID_JVM"
export JAVA_BIN_PATH="$JAVA_HOME/bin"

. $XDG_CONFIG_HOME/pyenv/init.sh
. $XDG_CONFIG_HOME/starship/init.sh
. $XDG_CONFIG_HOME/alias.sh
