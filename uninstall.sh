TARGET_DIR="$HOME/.dotfile"
CONFIG_DIR="$HOME/.config"

remove() {
  rm -r "$1" || echo "Failed to remove $1, skipping..."
}

restore_existing() {
  if [ -d "$1.bak" ] || [ -f "$1.bak" ]; then
    mv -r "$1.bak" "$1" || echo "Failed to restore $1, skipping..."
  fi
}

read -p "Dotfile will be removed and replaced by old configuration (if exist), are you sure? [Y/n]" CONFIRMATION

if [ -z "$CONFIRMATION" ]; then
  CONFIRMATION="Y"
fi

CONFIRMATION=$(echo "$CONFIRMATION" | tr '[:lower:]' '[:upper:]')

if [ "$CONFIRMATION" = "Y" ]; then
  echo "Removing compatibility..."
  remove "$CONFIG_DIR/alacritty"

  echo "Removing configuration from .zshrc..."
  remove "$HOME/.zshrc"

  echo "Removing repository..."
  remove "$TARGET_DIR"

  echo "Restoring old configuration..."
  restore_existing "$TARGET_DIR"
  restore_existing "$HOME/.zshrc"

  echo "Refreshing source config..."
  . "$HOME/.zshrc" || echo "Failed to refresh source config, please do it manually using: . $HOME/.zshrc"

  echo "Dotfile removed"
else
  echo "Dotfile remove aborted"
fi
