export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:~/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/X11/bin:/usr/local:/usr/local/CrossPack-AVR/bin

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin

# Fix mactex path
export PATH=$PATH:/Library/TeX/texbin

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Use binstubs in safe projects
# Run mkdir .git/safe in trusted projects
export PATH=".git/safe/../../bin:$PATH"

export EDITOR='vim'

# Vim mode stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/linus/.travis/travis.sh ] && source /Users/linus/.travis/travis.sh
