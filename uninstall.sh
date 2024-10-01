#!/bin/bash

echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [[ "$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc" ]]; then
  shell="$HOME/.zshrc"
else
  echo "Unsupported shell or configuration file not found."
  exit 1
fi

echo "Removing from shell"

if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i "" "/source ~\/.dotfile\/.jarvis/d" "$shell"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "/source ~\/.dotfile\/.jarvis/d" "$shell"
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

echo "Removing repository..."

rm -rf "$HOME/.dotfile"

echo "WARNING: dotfile not populated, restart terminal or run below command to fix it!"
echo "  . $shell"

echo "Uninstall complete!"
