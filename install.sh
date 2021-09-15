#! /bin/sh

FORCE=$1

if [[ $(which realpath) ]]
then
  dir=$(dirname $(realpath $0))
else
  dir=~/dotfiles
fi

function link() {
  [[ $FORCE == '--force' ]] && rm -rf $2
  mkdir -p $(dirname $2)
  ln -s --no-target-directory ${dir}/$1 $2
}

link .vimrc ~/.vimrc
link nvim ~/.config/nvim
link .tmux.conf ~/.tmux.conf
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
  link .Xdefaults ~/.Xdefaults
fi

git submodule init
git submodule update
