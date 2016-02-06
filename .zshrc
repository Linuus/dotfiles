source "$HOME/dotfiles/zsh/slim.zsh"

unsetopt correct
unsetopt auto_cd

export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:~/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/X11/bin:/usr/local:/usr/local/CrossPack-AVR/bin

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Fix mactex path
export PATH=$PATH:/Library/TeX/texbin

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

eval "$(rbenv init -)"

export EDITOR='vim'

# tmuxinator setup
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Use binstubs in safe projects
# Run mkdir .git/safe in trusted projects
export PATH=".git/safe/../../bin:$PATH"

# Vim mode stuff
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
