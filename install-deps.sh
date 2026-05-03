#!/bin/bash

set -e

if [ "$(uname -s)" != "Darwin" ]; then
    echo "Error: This script is intended for macOS only."
    exit 1
fi

echo "Installing Neovim configuration dependencies..."
echo

# Go-based LSPs
echo "Installing Go-based LSP servers..."
go install golang.org/x/tools/gopls@latest
go install github.com/a-h/templ/cmd/templ@latest
echo "✓ Go LSP servers installed"
echo

# Homebrew packages (macOS)
if command -v brew &> /dev/null; then
    echo "Installing Homebrew packages..."
    brew install lua-language-server
    brew install marksman
    brew install llm
    echo "✓ Homebrew packages installed"
    echo
else
    echo "Homebrew not found. Skipping Homebrew packages."
    echo "Install lua-language-server, marksman, and llm manually."
    echo
fi

# npm packages
echo "Installing npm packages..."
npm install -g @tailwindcss/language-server
npm install -g vscode-langservers-extracted
npm install -g intelephense
echo "✓ npm packages installed"
echo

# Python packages (using pip3)
echo "Installing Python packages..."
read -p "Use --break-system-packages for pip3 install? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pip3 install --break-system-packages autotools-language-server
else
    pip3 install autotools-language-server
fi
echo "✓ Python packages installed"
echo

# Blink.cmp cargo build
BLINK_PATH="$HOME/.local/share/nvim/site/pack/core/opt/blink.cmp"
if [ -d "$BLINK_PATH" ]; then
    echo "Building blink.cmp..."
    cd "$BLINK_PATH"
    cargo build --release
    echo "✓ blink.cmp built"
    echo
else
    echo "blink.cmp not found at $BLINK_PATH"
    echo "Skipping blink.cmp build"
    echo
fi

echo "All dependencies installed successfully!"
