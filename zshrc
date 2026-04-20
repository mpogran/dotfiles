[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#######################################################
# FUNCTIONS
#######################################################

autoload -Uz compinit
compinit

qt() {
  if [[ ! -f ~/.qt.conf ]]; then
    echo "No .qt.conf found"
    return 1
  fi

  local target=$(ggrep -m 1 -h -oP "$1\s=\s\K(.*)" ~/.qt.conf)
  if [[ -z "$target" ]]; then
    echo "\nNo shortcut found for '$1'\n"
    cat ~/.qt.conf
    echo
  else
    cd "$target"
  fi
}

function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

_qt_complete() {
  local shortcuts=($(ggrep -oP "^\K\w+" ~/.qt.conf))
  compadd $shortcuts
}

compdef _qt_complete qt

# Set prompt
setopt prompt_subst
export PROMPT='%n@%m %F{yellow}%~ %F{cyan}$(git_branch)%f
$ '

eval "$(rbenv init - zsh)"
export PATH="$HOME/.local/bin:$PATH"
