# .zshrc

export PS1="%F{cyan}%m %(?.%F{green}.%F{red})[%5~]%(!.#.$)%f "

# OPTIONS: man zshoptions
setopt AUTO_CD
unsetopt CASE_GLOB
setopt GLOB_DOTS
setopt VI

# ZSH environment variables
KEYTIMEOUT=1

# COMPLETION: man zshcompsys
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -U compinit && compinit

# Edit command with vim using ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd -s '^e' 'i^e'

# weird backspace issue with vi mode
bindkey -v '^?' backward-delete-char

# autosuggestion hotkey
bindkey '^]' autosuggest-accept
# autosuggestions from vi normal mode
bindkey -M vicmd -s '^]' 'A^]'

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

# aliases
alias e=${EDITOR}
alias g=git
alias s=sudo
alias t=tmux

# neovim aliases
alias gdbdap="gdbserver localhost:1234"
alias pydap="python3 -m debugpy --listen 1234 --wait-for-client"
alias clearnvimswap="rm ~/.local/share/nvim/swap/*; rm ~/.local/state/nvim/swap/*"

# support linux specific config
if [[ $(uname -a) == *Linux* ]]; then
  alias ls='ls --color=auto'
fi

function mpdplaylist {
  find $1 -name "*.mp3" > ~/.config/mpd/playlists/$2.m3u
}

# plugins
export PATH=${PATH}:${HOME}/dotfiles/zsh/plugins/fzf-zsh-plugin/bin
fzf=~/dotfiles/zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
if [ -f ${fzf} ]; then
  export FZF_PATH=~/.config/fzf
  source ${fzf} "${HOME}/.config/fzf"
fi

autosuggestions=~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[ -f ${autosuggestions} ] && source ${autosuggestions}

syntax_highlighting=~/dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f ${syntax_highlighting} ] && source ${syntax_highlighting}

# Stop ctrl-s from freezing terminal.
stty -ixon

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/josh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/josh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/josh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/josh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
