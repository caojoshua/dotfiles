# .zshrc

export PS1="%F{cyan}%m %(?.%F{green}.%F{red})[%5~]%(!.#.$)%f "

# OPTIONS: man zshoptions
setopt AUTO_CD
unsetopt CASE_GLOB
setopt GLOB_DOTS
setopt VI

# COMPLETION: man zshcompsys
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -U compinit && compinit

# Edit command with vim using ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# weird backspace issue with vi mode
bindkey -v '^?' backward-delete-char

# autosuggestion hotkey
bindkey '^]' autosuggest-accept
# autosuggestions from vi normal mode
bindkey -M vicmd -s '^]' 'A^]'

# aliases
alias g=git
alias e=${EDITOR}
alias t=tmux

# support linux specific config
if [[ $(uname -a) == *Linux* ]]; then
  alias ls='ls --color=auto'
fi

# plugins
fzf=~/.fzf.zsh
[ -f ${fzf} ] && source ${fzf}

autosuggestions=~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[ -f ${autosuggestions} ] && source ${autosuggestions}

syntax_highlighting=~/dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f ${syntax_highlighting} ] && source ${syntax_highlighting}
