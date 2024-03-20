#!/bin/sh

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_JVM="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_CLI_TOOL_PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/bin:$ANDROID_HOME/tools"
export NDK_HOME="$ANDROID_HOME/ndk/26.1.10909125"

# Java
export GRAALVM_VERSION="graalvm-ce-lts-java11-20.3.4" #"graalvm-jdk-21" # "graalvm-ce-java17-22.3.1" # "graalvm-ce-java11-22.3.1" # 
export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/$GRAALVM_VERSION/Contents/Home"
export JAVA_HOME="$GRAALVM_HOME" # "$ANDROID_JVM"
export JAVA_BIN_PATH="$JAVA_HOME/bin"

export PATH="$JAVA_BIN_PATH:$ANDROID_CLI_TOOL_PATH:$PATH"

