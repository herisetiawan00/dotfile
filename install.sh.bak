echo "Cloning repository..."

git clone "https://github.com/herisetiawan00/dotfile.git" ~/.dotfile || exit 1

echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [[ "$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc" ]]; then
  shell="$HOME/.zshrc"
else
  echo "No suitable shell configuration file found."
  exit 1
fi

if [[ -n "$shell" ]]; then
  echo "source $HOME/.dotfile/.jarvis" >> "$shell"
  echo "WARNING: dotfile not populated, restart terminal or run below command to fix it!"
  echo "  . $shell"
else
  echo "No suitable shell configuration file found."
  exit 1
fi

echo "Applying compatibility for Alacritty"
ln -sf "$HOME/.dotfile/alacritty" "$HOME/.config/alacritty"

echo "Install complete!"
