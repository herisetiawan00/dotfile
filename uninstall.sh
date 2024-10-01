echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [[ "$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc" ]]; then
  shell="$HOME/.zshrc"
fi

echo "Removing from shell"

if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i "" "/source ~\/.dotfile\/.jarvis/d" "$shell"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "/source ~\/.dotfile\/.jarvis/d" "$shell"
fi

echo "Removing repository..."

rm -r "$HOME/.dotfile"

source "$shell"

echo "Uninstall complete!"
