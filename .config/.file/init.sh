#!/bin/sh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#fnm
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

. $XDG_CONFIG_HOME/.file/submodule.sh

. $XDG_CONFIG_HOME/.file/alias.sh
