# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export TERM=xterm

# Source alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Init rbenv
[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init -)"

# Set dircolors for solarized dark
[[ -x "$(command -v gdircolors)" ]] && eval $(gdircolors ~/.dircolors)

# Set prompt
export PS1="\u@\h \e[33m\w\e[0m\] \e[36m\$(git_branch)\n\[\e[0m\] $ "
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
