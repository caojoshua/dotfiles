#!/bin/bash

dir=~/dotfiles

ln -s ${dir}/.vimrc ~/.vimrc
ln -s ${dir}/nvim ~/.config/nvim
ln -s ${dir}/.tmux.conf ~/.tmux.conf
ln -s ${dir}/i3/config ~/.config/i3/config
ln -s ${dir}/i3/.i3status.conf ~/.i3status.conf
ln -s ${dir}/.Xdefaults ~/.Xdefaults
ln -s ${dir}/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ${dir}/zsh/.zprofile ~/.zprofile
ln -s ${dir}/zsh/.zshrc ~/.zshrc
ln -s ${dir}/.gitconfig ~/.gitconfig
ln -s ${dir}/lfrc ~/.config/lf/lfrc
