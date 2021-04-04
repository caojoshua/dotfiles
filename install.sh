#!/bin/bash

dir=~/dotfiles

ln -s ${dir}/.vimrc ~/.vimrc
ln -s ${dir}/init.lua ~/.config/nvim/init.lua
ln -s ${dir}/.tmux.conf ~/.tmux.conf
ln -s ${dir}/i3/config ~/.config/i3/config
ln -s ${dir}/i3/.i3status.conf ~/.i3status.conf
ln -s ${dir}/.Xdefaults ~/.Xdefaults
ln -s ${dir}/zsh/.zprofile ~/.zprofile
ln -s ${dir}/zsh/.zshrc ~/.zshrc
