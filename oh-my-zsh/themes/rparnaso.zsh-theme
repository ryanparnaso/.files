PROMPT=$'%{$fg[cyan]%}%~%{$reset_color%}$(dev-prompt) %(!.#.»)%{$reset_color%} '
RPROMPT='$(repo)%n$(short-host)[%{$fg[white]%}%D{%I:%M:%S}%{$reset_color%}]'

ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[green]%}⟶"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}⟵"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%}⌧"

# character to define what repo you are in
repo () { 
  BRANCH=$(git symbolic-ref HEAD 2> /dev/null)
  if [ $BRANCH ]; then
    echo -n "[%{$fg[cyan]%}$(git_prompt_short_sha)%{$reset_color%}"
    git branch >/dev/null 2>/dev/null && echo -n '☠]' && return
    hg root >/dev/null 2>/dev/null && echo -n '☿]' && return
    echo -n '○]'
  fi
}

function dev-prompt () {
  BRANCH=$(git symbolic-ref HEAD 2> /dev/null)
  if [ $BRANCH ]; then
    DEV_BASE_COLOR=white
    echo -n "%{$fg[$DEV_BASE_COLOR]%}["
    echo -n "%{$fg[red]%}$(rvm-ruby-version)%{$reset_color%}"
    echo -n "%{$fg[$DEV_BASE_COLOR]%}:"
    echo -n "$(dev-branch)"
    echo -n "%{$fg[$DEV_BASE_COLOR]%}]"
    echo -n "%{$reset_color%}"
    echo -n "$(git_prompt_status)"
    echo -n "$(git_remote_status)"
  fi
}

function dev-branch () {
  porcelain=$(git status --porcelain -b 2> /dev/null)
  short=$(git status -s 2>/dev/null)

  if $(echo "$porcelain" | grep -E '^\?\? ' &> /dev/null); then
    echo -n "%{$fg_bold[red]%}${BRANCH#refs/heads/}"
  elif [ -z $short ]; then
    echo -n "%{$fg_bold[green]%}${BRANCH#refs/heads/}"
  else
    echo -n "%{$fg_bold[yellow]%}${BRANCH#refs/heads/}"
  fi
}

rvm-ruby-version () {
  echo -n "⌔$(~/.rvm/bin/rvm-prompt | tr -d 'ruby-')"
}

short-host () {
  local h=`hostname`;
  echo -n "%{$fg[white]%}@%{$reset_color%}"

  case $h in
    Rolands-iMac.local)
      echo "%{$fg[green]%}iMac.local%{$reset_color%}"
      ;;
    Rolands-MacBook-Air.local)
      echo "%{$fg[green]%}Air.local%{$reset_color%}"
      ;;
    rc0101sa-*)
      echo "%{$fg[blue]%}Desktop.work%{$reset_color%}"
      ;;
    *)
      echo "%{$fg[red]%}$h%{$reset_color%}"
  esac
}
