setopt no_global_rcs # Make macOS stop fucking with the PATH!

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:~/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/X11/bin:/usr/local:/usr/local/CrossPack-AVR/bin:/Applications/Postgres.app/Contents/Versions/9.6/bin:/Library/TeX/texbin

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR="vim"

export DISABLE_SPRING=true

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/linus/.travis/travis.sh ] && source /Users/linus/.travis/travis.sh

[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh

# Use binstubs in safe projects
# Run mkdir .git/safe in trusted projects
export PATH=".git/safe/../../bin:$PATH"

export LC_ALL=en_us.UTF-8
export LANG=en_us.UTF-8
