################################################################################
# functions
################################################################################
project_paths=(/Volumes/dev/projects ~/Projects ~/Dropbox/Projects)
p () {
  for PROJECTS in $project_paths; do
    if [ -d "$PROJECTS" ]; then
      cd $PROJECTS/$1
      break
    fi
  done
}
_p () {
  for PROJECTS in $project_paths; do
    if [ -d "$PROJECTS" ]; then
      _files -W $PROJECTS -/
      break
    fi
  done
}
compdef _p p

################################################################################
# ALIASES
################################################################################
# zsh
alias zc="vim ~/.zshrc"
alias zo="vim ~/.oh-my-zsh"
alias zp="vim ~/.oh-my-zsh/custom/plugins/rparnaso/rparnaso.plugin.zsh"
alias zt="vim ~/.oh-my-zsh/themes/rparnaso.zsh-theme"
alias zz=". ~/.zshrc"

# vim
alias vc="vim ~/.vimrc"
