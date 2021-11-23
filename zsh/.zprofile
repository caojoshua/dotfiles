# .zprofile

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.10.0.9-0.fc32.x86_64/"

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

export PATH="/usr/local/bin/aarch64-none-elf/bin:$PATH"
export PATH="/home/josh/.cargo/bin:$PATH"
