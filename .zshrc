source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/keys.zsh
source ~/dotfiles/zsh/history.zsh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

unsetopt correct
unsetopt auto_cd
