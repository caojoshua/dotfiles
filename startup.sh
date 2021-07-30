#! /bin/sh

# General purpose startup script that can be called from any WM

# restart processes to support reloading config
function restart() {
  pkill -x $1
  $@ > /dev/null 2>&1 & disown
}

restart sxhkd -c $HOME/.config/sxhkd/sxhkdrc

restart polybar monitor-main
polybar monitor-secondary >/dev/null 2>&1 & disown

