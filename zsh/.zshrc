# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSHRC from moellh on 08.11.23

autoload -Uz compinit
compinit

# Key-Bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word

# Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U select-word-style
select-word-style bash

export JAVA_HOME="/usr/lib/jvm/default"
export PATH="${PATH}:/mnt/data/studies/bfp/programming/install/bin:$JAVA_HOME/bin"
export PYTHONPATH="${PYTHONPATH}:/mnt/data/studies/bfp/programming/install/lib/"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/mnt/data/studies/bfp/programming/install/lib/"
export MANPATH="${MANPATH}:/mnt/data/studies/bfp/programming/install/share/man/"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
