#!/bin/sh

# Check if Homebrew is installed; exit if it is
if command -v brew >/dev/null 2>&1; then
    exit 0
else
    # Check for curl
    if ! command -v curl >/dev/null 2>&1; then
        echo "Error: curl is required to install Homebrew. Please install curl."
        exit 1
    fi

    # Check for Ruby
    if ! command -v ruby >/dev/null 2>&1; then
        echo "Error: Ruby is required to install Homebrew. Please install Ruby."
        exit 1
    fi

    # Install Homebrew
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Verify installation
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew installed successfully."
    else
        echo "Error: Homebrew installation failed."
        exit 1
    fi
fi