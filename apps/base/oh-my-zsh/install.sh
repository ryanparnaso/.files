#!/bin/sh

initialize_zsh() {
  if [ ! `cmp --silent ~/.zshrc ~/.files/.zshrc` ]; then
    [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.`date "+%Y%m%d%H%M"`
    cp ~/.files/.zshrc ~/.zshrc

    if [ ! `echo $SHELL` == '/bin/zsh' ]; then
      env zsh;
      . ~/.zshrc;
      echo 'Installation complete.'
    else
      /bin/zsh ~/.zshrc;
      echo 'Re-initialized shell.'
    fi
  fi
}

# Install Oh My Zsh! if missing
if [ ! -d ~/.oh-my-zsh ]; then
  [ ! -d ~/.files/tmp ] && mkdir ~/.files/tmp
  curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | egrep -v 'env zsh$' > ~/.files/tmp/.oh-my-zsh.install.sh;
  . ~/.files/tmp/.oh-my-zsh.install.sh;
  rm ~/.files/tmp/.oh-my-zsh.install.sh;
fi

# Make directories if missing
[ ! -d ~/code ] && mkdir ~/code
[ ! -d ~/projects ] && mkdir ~/projects

# Make local .zenv file if missing
[ ! -e ~/.zenv ] && echo "# Local env variables" >>  ~/.zenv

initialize_zsh
. ~/.zenv