#!/bin/sh

# Get the directory of the current script
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Containers
. ${SCRIPT_DIR}/runtime/container.sh

# Runtime / Language
. ${SCRIPT_DIR}/runtime/java.sh
. ${SCRIPT_DIR}/runtime/javascript.sh
. ${SCRIPT_DIR}/runtime/python.sh
. ${SCRIPT_DIR}/runtime/rust.sh

# shell
. ${SCRIPT_DIR}/alias.sh