# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Source the aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific aliases and functions
calc(){ awk "BEGIN{ print $* }" ;}

#Current PS1
#PS1='[\u@\h \W]\$ '
#Modified PS1
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export IGNOREEOF=1
#source /etc/bash_completion
source ~/.git-completion.sh

shopt -s cdspell

#This mod allows to change into files in the html directory without 
#entering the full path
CDPATH='.:..:../..:/home/nick/www/html'

#change editor
EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
export EDITOR VISUAL

