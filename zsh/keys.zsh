KEYTIMEOUT=1

bindkey '\ew' kill-region

bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey ' ' magic-space

bindkey '^F' forward-word
bindkey '^B' backward-word

bindkey '^[[Z' reverse-menu-complete
