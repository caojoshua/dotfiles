# .zprofile

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

export PATH="/home/josh/.cargo/bin:$PATH"
