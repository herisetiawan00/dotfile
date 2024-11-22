export ZSH="$DOTDIR/zshrc/.oh-my-zsh"

ZSH_TMUX_AUTOSTART=true
ZSH_THEME="robbyrussell"

plugins=(
  z
  git
	tmux
  sudo
  you-should-use
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

fpath+=${ZDOTDIR:-~}/.zsh_functions

