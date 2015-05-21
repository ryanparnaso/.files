################################################################################
# p functions
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

################################################################################
# c functions
################################################################################
code_paths=(/Volumes/dev/code ~/code)
c () {
  for CODE in $code_paths; do
    if [ -d "$CODE/$1" ]; then
      cd $CODE/$1
      break
    fi
  done
}
_c () {
  for CODE in $code_paths; do
    if [ -d "$CODE" ]; then
     _files -W $CODE -/
    fi
  done
}
compdef _c c

################################################################################
# ALIASES
################################################################################

# postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# ruby on rails
alias dbreset='bundle exec rake db:reset'

# zsh
alias zc='vim ~/.zshrc'
alias zp='vim ~/dotfiles/oh-my-zsh/custom/plugins/rparnaso/rparnaso.plugin.zsh'
alias zt='vim ~/dotfiles/oh-my-zsh/custom/themes/rparnaso.zsh-theme'
alias z='source ~/.zshrc'

# shell commands
alias psa='ps auxwww | grep'

# git (additional)
alias gbl='git branch -v'
alias gcb='git checkout -b'
alias go='git pull origin'
alias gs='git status'
alias grm='git reset --hard origin/master'
alias gom='git pull origin master'
alias gpo="git push origin $(git status --porcelain -b 2> /dev/null | awk '{ print $2 }')"
