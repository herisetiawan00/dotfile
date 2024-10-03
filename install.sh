TARGET_DIR="$HOME/.dotfile"
CONFIG_DIR="$HOME/.config"
SHELL_CONFIG=""

check_shell() {
  NAME=$(basename "$SHELL")

  if [ "$NAME" = "zsh" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
  fi
}

backup_existing() {
  if [ -d "$1" ] || [ -f "$1" ]; then
    BASENAME=$(basename "$1")
    read -p "Found existing $BASENAME, wanna backup it? [Y/n]: " BACKUP

    if [ -z "$BACKUP" ]; then
      BACKUP="Y"
    fi

    BACKUP=$(echo "$BACKUP" | tr '[:lower:]' '[:upper:]')

    if [ "$BACKUP" = "Y" ]; then
      echo "Backing up your existing $BASENAME..."
      mv -r "$1" "$1.bak"
    else
      echo "Removing existing $BASENAME..."
      rm -r "$1"
    fi
  fi
}

populate() {
  echo "Populating into..."
  echo "$1" >>"$2"
}

clone_repo() {
  echo "Cloning repo..."
  git clone --recursive https://github.com/herisetiawan00/dotfile.git "$TARGET_DIR"
}

symlink() {
  SUCCESS=0
  ln -sf $1 $2 || SUCCESS=1

  if [ $SUCCESS -eq 1 ]; then
    echo "Failed to create symlink, please run below script manually"
    echo "ln -sf $1 $2"
  fi
}

compatibility() {
  read -p "Some config need adjustment to work correctly, run adjustment script? [Y/n]" EXECUTE

  if [ -z "$EXECUTE" ]; then
    EXECUTE="Y"
  fi

  EXECUTE=$(echo "$EXECUTE" | tr '[:lower:]' '[:upper:]')

  if [ "$EXECUTE" = "Y" ]; then
    symlink "$TARGET_DIR/alacritty" "$CONFIG_DIR/alacritty"
  fi
}

## Install Script
echo "Starting installation..."

check_shell

if [ -z $SHELL_CONFIG ]; then
  echo "Shell not supported"
  exit 1
fi

backup_existing "$SHELL_CONFIG"

backup_existing "$TARGET_DIR"

clone_repo

populate "source $TARGET_DIR/.dotfile" "$HOME/.zshrc"

compatibility

echo "Install complete"
