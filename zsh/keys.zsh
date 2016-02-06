bindkey -v
KEYTIMEOUT=1

RPS1=""
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey -M viins '^w' backward-kill-word
bindkey -M vicmd '^w' backward-kill-word

bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

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