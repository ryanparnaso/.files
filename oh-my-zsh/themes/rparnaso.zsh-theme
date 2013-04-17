PROMPT=$'%{$fg_bold[cyan]%}%~%{$reset_color%}$(dev-prompt) %(!.#.»)%{$reset_color%} '
RPROMPT='%n$(short-host)[%{$fg[white]%}%D{%I:%M:%S}%{$reset_color%}]'

ZSH_THEME_GIT_PROMPT_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"

# use in replace of %~ to avoid named directories
collapse_pwd () {
  ${PWD/#$HOME/~}
}

# character to define what repo you are in
prompt_char () {
    git branch >/dev/null 2>/dev/null && echo '☠' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

dev-prompt () {
  if [ -d .git ]; then
    echo -n "%{$fg[black]%}["
    rvm-ruby-version
    git_prompt_info
  fi
}

rvm-ruby-version () {
  echo -n "%{$fg[black]%}$(~/.rvm/bin/rvm-prompt | tr -d 'ruby-')"
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
    *)
      echo $h
  esac
}
