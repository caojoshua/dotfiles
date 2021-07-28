# .zprofile

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim -c 'set ft=man'"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.10.0.9-0.fc32.x86_64/"

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# linux specific config
if [ $IS_LINUX ]; then
  setxkbmap -option ctrl:nocaps
  xset r rate 250 50
  xsetroot -solid "#000000"
fi
