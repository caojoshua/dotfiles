# .zshrc

export PROMPT="%(?.%F{green}.%F{red})[%3~]%(!.#.$)%f "

# OPTIONS: man zshoptions
setopt AUTO_CD
unsetopt CASE_GLOB
setopt GLOB_DOTS
setopt VI

# COMPLETION: man zshcompsys
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -U compinit && compinit

autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# weird backspace issue with vi mode
bindkey -v '^?' backward-delete-char

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# plugins
source ~/dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
