#!/bin/sh

# Script to migrate a tool from Homebrew to mise (POSIX compliant)
# Usage: ./migrate_to_mise.sh <tool_name> OR ./migrate_to_mise.sh <tool_name@version>

# Function to print colored output (using printf for POSIX compliance)
print_info() {
    printf "\033[0;34m[INFO]\033[0m %s\n" "$1"
}

print_success() {
    printf "\033[0;32m[SUCCESS]\033[0m %s\n" "$1"
}

print_warning() {
    printf "\033[1;33m[WARNING]\033[0m %s\n" "$1"
}

print_error() {
    printf "\033[0;31m[ERROR]\033[0m %s\n" "$1"
}

# Check if required tools are installed
check_dependencies() {
    if ! command -v mise > /dev/null 2>&1; then
        print_error "mise is not installed. Please install mise first."
        exit 1
    fi
    
    if ! command -v brew > /dev/null 2>&1; then
        print_error "Homebrew is not installed."
        exit 1
    fi
}

# Check if tool is available in mise
check_mise_availability() {
    tool_name="$1"
    print_info "Checking if '$tool_name' is available in mise..."
    
    if mise ls-remote "$tool_name" > /dev/null 2>&1; then
        print_success "'$tool_name' is available in mise"
        return 0
    else
        print_error "'$tool_name' is not available in mise"
        return 1
    fi
}

# Check if tool is installed via Homebrew
check_brew_installation() {
    tool_name="$1"
    print_info "Checking if '$tool_name' is installed via Homebrew..."
    
    if brew list "$tool_name" > /dev/null 2>&1; then
        print_success "'$tool_name' is installed via Homebrew"
        return 0
    else
        print_warning "'$tool_name' is not installed via Homebrew"
        return 1
    fi
}

# Uninstall from Homebrew
uninstall_from_brew() {
    tool_name="$1"
    print_info "Uninstalling '$tool_name' from Homebrew..."
    
    if brew uninstall "$tool_name"; then
        print_success "Successfully uninstalled '$tool_name' from Homebrew"
    else
        print_error "Failed to uninstall '$tool_name' from Homebrew"
        exit 1
    fi
}

# Install with mise
install_with_mise() {
    tool_name="$1"
    version="$2"
    
    if [ -n "$version" ]; then
        print_info "Installing '$tool_name' version '$version' with mise..."
        if mise install "$tool_name@$version"; then
            print_success "Successfully installed '$tool_name@$version' with mise"
            # Set as global version
            mise global "$tool_name@$version"
            print_success "Set '$tool_name@$version' as global version"
        else
            print_error "Failed to install '$tool_name@$version' with mise"
            exit 1
        fi
    else
        print_info "Installing latest '$tool_name' with mise..."
        if mise install "$tool_name"; then
            print_success "Successfully installed '$tool_name' with mise"
            # Get the latest version and set as global
            latest_version=$(mise ls-remote "$tool_name" | tail -n 1 | awk '{print $1}')
            mise global "$tool_name@$latest_version"
            print_success "Set '$tool_name@$latest_version' as global version"
        else
            print_error "Failed to install '$tool_name' with mise"
            exit 1
        fi
    fi
}

# Show available versions
show_available_versions() {
    tool_name="$1"
    print_info "Available versions for '$tool_name':"
    mise ls-remote "$tool_name" | tail -n 10
    printf "\n"
}

# Parse tool@version format using POSIX-compliant methods
parse_tool_version() {
    input="$1"
    
    # Check if input contains @
    case "$input" in
        *@*)
            # Extract tool name (everything before @)
            tool_name=$(printf "%s" "$input" | sed 's/@.*//')
            # Extract version (everything after @)
            version=$(printf "%s" "$input" | sed 's/.*@//')
            ;;
        *)
            tool_name="$input"
            version=""
            ;;
    esac
}

# POSIX-compliant read function
read_yes_no() {
    prompt="$1"
    printf "%s" "$prompt"
    read -r reply
    case "$reply" in
        [Yy]|[Yy][Ee][Ss])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Main function
main() {
    input="$1"
    
    # Check if tool name is provided
    if [ -z "$input" ]; then
        print_error "Usage: $0 <tool_name> OR $0 <tool_name@version>"
        print_info "Example: $0 node@18.17.0"
        print_info "Example: $0 python (installs latest)"
        exit 1
    fi
    
    # Parse input to extract tool_name and version
    parse_tool_version "$input"
    
    print_info "Starting migration of '$tool_name' from Homebrew to mise"
    if [ -n "$version" ]; then
        print_info "Target version: $version"
    fi
    printf "\n"
    
    # Check dependencies
    check_dependencies
    
    # Check if tool is available in mise
    if ! check_mise_availability "$tool_name"; then
        print_info "You can check available tools with: mise ls-remote"
        exit 1
    fi
    
    # Show available versions if no version specified
    if [ -z "$version" ]; then
        show_available_versions "$tool_name"
        if ! read_yes_no "Do you want to install the latest version? (y/N): "; then
            print_info "Migration cancelled"
            exit 0
        fi
    fi
    
    # Check if tool is installed via Homebrew
    if check_brew_installation "$tool_name"; then
        printf "\n"
        if read_yes_no "Do you want to uninstall '$tool_name' from Homebrew? (y/N): "; then
            uninstall_from_brew "$tool_name"
        else
            print_warning "Keeping Homebrew installation. This may cause conflicts."
        fi
    fi
    
    printf "\n"
    
    # Install with mise
    install_with_mise "$tool_name" "$version"
    
    printf "\n"
    print_success "Migration completed!"
    print_info "You may need to restart your shell or run 'source ~/.bashrc' (or ~/.zshrc)"
    print_info "To verify installation, run: mise list"
    
    # Show current version
    if command -v "$tool_name" > /dev/null 2>&1; then
        current_version=$("$tool_name" --version 2>/dev/null || printf "Version check failed")
        print_info "Current version: $current_version"
    fi
}

# Run main function with first argument
main "$1"