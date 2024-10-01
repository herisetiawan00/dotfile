echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [[ "$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc"]]; then
  shell="$HOME/.zshrc"
fi

echo "Removing from shell"

sed -i "/source ~\/.dotfile\/.jarvis/d" "$shell"

echo "Removing repository..."

rm -r "$HOME/.dotfile"

source "$shell"

echo "Uninstall complete!"
