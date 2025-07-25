#! /bin/sh

# General purpose startup script that can be called from any WM

# Set the screen layout. This needs to be executed before any other commands that depends on
# monitor configuration.
[ -f ~/.screenlayout/main.sh ] && ~/.screenlayout/main.sh

# restart processes to support reloading config
function restart() {
  pkill -x $1
  $@ > /dev/null 2>&1 & disown
}

export WM_MOD=super

export BROWSER=firefox
export LAUNCHER="rofi -show drun"
export SCREENSHOT="spectacle"
export TERM_EMULATOR=alacritty

restart sxhkd -c $HOME/.config/sxhkd/sxhkdrc

restart polybar monitor-main && polybar monitor-secondary

# Mandarin input
restart fcitx5

# blue light filter based on Washington time
pkill redshift
redshift -l 47:-122

# setxkbmap -option ctrl:nocaps
xset r rate 250 50
xsetroot -solid "#000000"
