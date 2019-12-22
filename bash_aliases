#!/bin/bash
#######################################################
# ALIASES
#######################################################

# always use mvim
alias vim='mvim -v'
alias dev='docker-compose'

#######################################################
# FUNCTIONS
#######################################################

function qt() {
  path=$(awk -v pattern="^$1" '$0 ~ pattern {print $3}' $HOME/.qt.conf)
  if [ -z "$path" ]; then
    echo -e "\nNo shortcut found for '$1'\n"
    echo -e "$(cat $HOME/.qt.conf)\n"
  else
    cd $path
  fi
}

function dev_bash() {
  docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti elledock_$1_1 bash
}
