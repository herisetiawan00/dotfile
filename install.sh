echo "Cloning repository..."

git clone "https://github.com/herisetiawan00/dotfile" ~/.dotfile

echo "Detecting shell..."

user_shell=$(basename "$SHELL")

echo "Shell found: $user_shell"

shell=""

if [["$user_shell" == "bash" ]] && [[ -f "$HOME/.bashrc" ]]; then
  shell="$HOME/.bashrc"
elif [[ "$user_shell" == "zsh" ]] && [[ -f "$HOME/.zshrc" ]]; then
  shell="$HOME/.zshrc"
fi

echo "source ~/.dotfile/.jarvis" >> "$shell"
source "$shell"

echo "Install complete!"
