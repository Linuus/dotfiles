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

export NVM_DIR="$HOME/.nvm"
[ -f $(brew --prefix nvm)/nvm.sh ] && . "$(brew --prefix nvm)/nvm.sh"

# Vim mode stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/linus/.travis/travis.sh ] && source /Users/linus/.travis/travis.sh
