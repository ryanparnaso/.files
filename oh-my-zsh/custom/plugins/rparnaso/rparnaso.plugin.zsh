################################################################################
# functions
################################################################################
project_paths=(/Volumes/dev/projects ~/Projects ~/Dropbox/Projects)
p () {
  for PROJECTS in $project_paths; do
    if [ -d "$PROJECTS/$1" ]; then
      cd $PROJECTS/$1
      break
    fi
  done
}
_p () {
  for PROJECTS in $project_paths; do
    if [ -d "$PROJECTS" ]; then
      _files -W $PROJECTS -/
    fi
  done
}
compdef _p p

dot-save () {
  cp -R ~/.oh-my-zsh/custom/* ~/Projects/dotfiles/oh-my-zsh/custom/
  cp ~/.oh-my-zsh/themes/rparnaso.zsh-theme ~/Projects/dotfiles/oh-my-zsh/themes/
}

dot-diff () {
  for f in rparnaso.zsh-theme rparnaso.plugin.zsh; do
    echo "diff:[$f]"
    diff ~/.oh-my-zsh/**/$f ~/Projects/**/$f
  done
}

################################################################################
# ALIASES
################################################################################
# ruby on rails
alias be='bundle exec'

# zsh
alias zc='vim ~/.zshrc'
alias zo='vim ~/.oh-my-zsh'
alias zp='vim ~/.oh-my-zsh/custom/plugins/rparnaso/rparnaso.plugin.zsh'
alias zt='vim ~/.oh-my-zsh/themes/rparnaso.zsh-theme'
alias zz='source ~/.zshrc'

# shell commands
alias psa='ps auxwww | grep'

# vim
alias vc='vim ~/.vimrc'

# git (additional)
alias gbl='git branch -v'
alias gcb='git checkout -b'
alias go='git pull origin'
alias gs='git status'

# passenger
alias pass-stop='passenger stop'
alias pass-start='passenger start'
alias pass-restart='passenger stop; passenger start'
alias pass-status='passenger status'
