# .zprofile

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim -c 'set ft=man'"

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

setxkbmap -option ctrl:nocaps
xset r rate 250 50
