export ZSH="$DOTDIR/zshrc/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  z
  git
  asdf
  sudo
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

fpath+=${ZDOTDIR:-~}/.zsh_functions

