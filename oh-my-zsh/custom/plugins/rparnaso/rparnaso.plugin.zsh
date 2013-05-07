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
# dot methods
################################################################################
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
# find methods
################################################################################
_find () {
  local _verbose=0
  local _dryrun=0
  local _type=file
  local _path=.
  local _match=${@: -1}

  while getopts :v:dt:p: OPTION; do
    case $OPTION in
      v) _verbose=1;;
      d) _dryrun=1; _verbose=1;;
      t) _type=$OPTARG;;
      p) _path=$OPTARG;;
    esac
  done

  [ "$_verbose" -eq 1 ] && printf "RUNNING: find %s -type %s -name %s" $_path $_type $_match
  [ "$_dryrun" -eq 1 ]  || find $_path -type $_type -name $_match
}

findf () {
  local _verbose=0
  local _dryrun=0
  local _path=.
  local _match=${@: -1}

  while getopts :h:v:dp: OPTION; do
    case $OPTION in
      h) echo "USAGE: findf [-hvd] [-p path=$_path] 'filename'"; return 0;;
      v) _verbose=1;;
      d) _dryrun=1; _verbose=1;;
      p) _path=$OPTARG;;
    esac
  done

  [ $_verbose -eq 1 ] && _find -d -p $_path $_match && echo
  [ $_dryrun -eq 1 ]  || _find -p $_path $_match
}

findd () {
  local _verbose=0
  local _dryrun=0
  local _path=.
  local _match=${@: -1}

  while getopts :h:v:dp: OPTION; do
    case $OPTION in
      h) echo "USAGE: findd [-hvd] [-p path=$_path] 'dirname'"; return 0;;
      v) _verbose=1;;
      d) _dryrun=1; _verbose=1;;
      t) _type=$OPTARG;;
      p) _path=$OPTARG;;
    esac
  done

  [ $_verbose -eq 1 ] && _find -d -t directory -p $_path $_match && echo
  [ $_dryrun -eq 1 ]  || _find -t directory -p $_path $_match
}

finds () {
  local _verbose=0
  local _dryrun=0
  local _path=.
  local _match=''
  local _string=${@: -1}

  while getopts :h:v:dp:f: OPTION; do
    case $OPTION in
      h) echo "USAGE: finds [-hvd] [-p path=$_path] [-f file-match] 'string'"; return 0;;
      v) _verbose=1;;
      d) _dryrun=1; _verbose=1;;
      p) _path=$OPTARG;;
      f) _match=(-name $OPTARG);;
    esac
  done

  [ $_verbose -eq 1 ] && echo "Running: find $_path -type file $_match | egrep -v 'tmp|git|log' | xargs grep '$_string'"
  [ $_dryrun -eq 1 ]  || find $_path -type file $_match | egrep -v 'tmp|git|log' | xargs grep $_string
}

################################################################################
# ALIASES
################################################################################
# current projects
alias aom='p matrix/aom_matrix'

# ruby on rails
alias be='bundle exec'

# zsh
alias zc='vim ~/.zshrc'
alias zo='vim ~/.oh-my-zsh'
alias zp='vim ~/.oh-my-zsh/custom/plugins/rparnaso/rparnaso.plugin.zsh'
alias zt='vim ~/.oh-my-zsh/themes/rparnaso.zsh-theme'
alias z='source ~/.zshrc'

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
