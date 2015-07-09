# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="linus"
ZSH_THEME="linus-pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
alias be='bundle exec'
alias rdm='be rake db:migrate db:test:prepare'
alias rdr='be rake db:rollback db:test:prepare'
alias reseedfu='be rake db:reset db:seed_fu'
alias die='spring stop'

# Disable autocorrect
DISABLE_CORRECTION="true"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew heroku gem zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct

# Customize to your needs...
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:~/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/X11/bin:/usr/local:/usr/local/CrossPack-AVR/bin

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

### Do SSH Magic
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Vim mode stuff
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
