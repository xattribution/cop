# cop
Overcomplicated File-to-Clipboard command simplification for xclip for Linux terminal.


# Purpose:

This script sets up a custom cop command in your Linux environment to easily copy the contents of a file to the clipboard using xclip. It ensures xclip is installed, appends the cop function to your shell configuration file (e.g., .bashrc or .zshrc), and reloads the shell settings so the command is ready to use.

# Features:

Automatically installs xclip if it’s missing.
Adds a "cop" function to your default shell configuration file.
Ensures compatibility with bash and zsh.
Reloads your shell configuration so no manual steps are needed after running the script.

# Usage: 

After setup, use the cop command like this: cop <filename>
This will copy the contents of the specified file to your clipboard.

# How to Install: 

Run this one-liner to download and execute the script:
"bash <(curl -fsSL https://raw.githubusercontent.com/yourusername/yourrepo/main/setup_cop.sh)"
