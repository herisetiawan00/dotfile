echo "Cloning repository..."

git clone "https://github.com/herisetiawan00/dotfile" ~/.dotfile

echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [[ "$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc" ]]; then
  shell="$HOME/.zshrc"
fi

# Check if the shell variable is set before trying to append
if [[ -n "$shell" ]]; then
  echo "source ~/.dotfile/.jarvis" >> "$shell"
  if [[ "$user_shell" == "bash" ]]; then
    source "$HOME/.bashrc"
  elif [[ "$user_shell" == "zsh" ]]; then
    source "$HOME/.zshrc"
  fi
else
  echo "No suitable shell configuration file found."
fi

echo "Install complete!"
