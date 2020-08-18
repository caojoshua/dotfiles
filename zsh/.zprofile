# .zprofile

# Environment Variables
export EDITOR=vim
export PAGER=less

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

setxkbmap -option ctrl:nocaps
