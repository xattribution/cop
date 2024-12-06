#!/bin/bash

# Ensure xclip is installed
if ! command -v xclip &> /dev/null; then
    echo "xclip not found. Installing it..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y xclip
    elif command -v yum &> /dev/null; then
        sudo yum install -y xclip
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy xclip
    else
        echo "Package manager not found. Please install xclip manually."
        exit 1
    fi
fi

# Determine the default shell configuration file
shell=$(basename "$SHELL")
if [ "$shell" = "bash" ]; then
    rc_file="$HOME/.bashrc"
elif [ "$shell" = "zsh" ]; then
    rc_file="$HOME/.zshrc"
else
    echo "Unsupported shell: $shell. Please add the function manually to your shell's configuration file."
    exit 1
fi

# Define the function to add
function_definition='
cop() {
    if [ -z "$1" ]; then
        echo "Usage: cop <filename>"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo "File not found: $1"
        return 1
    fi

    xclip -selection clipboard < "$1"
}
'

# Append the function to the shell configuration file if not already present
if ! grep -q "cop()" "$rc_file"; then
    echo "Adding cop function to $rc_file..."
    echo "$function_definition" >> "$rc_file"
else
    echo "cop function already exists in $rc_file."
fi

# Source the configuration file to apply changes
echo "Reloading shell configuration..."
source "$rc_file"

echo "The 'cop' command is now set up. You can use it to copy a file to the clipboard by running: cop <filename>"
