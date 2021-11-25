#! /bin/sh

FORCE=$1

if [[ $(which realpath) ]]
then
  dir=$(dirname $(realpath $0))
else
  dir=~/dotfiles
fi

git submodule init
git submodule update

function link() {
  [[ $FORCE == '--force' ]] && rm -rf $2
  mkdir -p $(dirname $2)
  ln -s --no-target-directory ${dir}/$1 $2
}

link .vimrc ~/.vimrc
link nvim ~/.config/nvim
link tmux/.tmux.conf ~/.tmux.conf
link tmux/plugins/tpm ~/.tmux/plugins/tpm
link alacritty ~/.config/alacritty
link zsh/.zprofile ~/.zprofile
link zsh/.zshrc ~/.zshrc
link .gitconfig ~/.gitconfig
link lf ~/.config/lf
link zathura ~/.config/zathura

# linux specific config
if [[ $(uname -a) == *Linux* ]]
then
  link startup.sh ~/.config/dotfiles-scripts/startup.sh
  link i3 ~/.config/i3
  link bspwm ~/.config/bspwm
  link sxhkd ~/.config/sxhkd
  link polybar ~/.config/polybar
  link rofi ~/.config/rofi
  link mopidy ~/.config/mopidy
  link ncmpcpp ~/.config/ncmpcpp
  link flameshot ~/.config/flameshot
  link .Xdefaults ~/.Xdefaults
fi
