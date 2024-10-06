pacmanAUR() {
  OPTION="$1"
  PACKAGE="$2"

  CURRENT_DIR=$(pwd)

  package-not-found() {
    echo "Package \"$PACKAGE\" not found :("
    return 1
  }

  if [ -z "$OPTION" ] || [ -z "$PACKAGE" ]; then
    echo "Invalid given parameters"
    echo "pacmanAUR [option] [package]"
    return 1
  fi

  if [ "$OPTION" = "-S" ]; then
    TARGET_DIR="/tmp/$PACKAGE"

    URL="https://aur.archlinux.org/$PACKAGE.git"

    git clone "$URL" "$TARGET_DIR" || return package-not-found

    cd "$TARGET_DIR"

    makepkg -si

    cd "$CURRENT_DIR"

    sudo rm -r "$TARGET_DIR"
  fi
}
