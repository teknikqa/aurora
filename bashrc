# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/bin
export PATH="$HOME/bin:$PATH"

#SSH_ENV="$HOME/.ssh/environment"
#
#function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "$SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add;
#}
#
# Source SSH settings, if applicable
#
#if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >/dev/null || {
#         start_agent;
#     }
#else
#     start_agent;
#fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Better History;
# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND='history -a'

#Bash History size
export HISTFILESIZE=10000 # Record last 10,000 commands
export HISTSIZE=10000 # Record last 10,000 commands per session

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Change to most recently used directory:
#if [ -f ~/.lastdir ]; then
#    cd "`cat ~/.lastdir`"
#fi

#export LASTDIR="/"
#
#function prompt_command {
# 
#  # Remember where we are:
#  pwd > ~/.lastdir
#
#  # Record new directory on change.
#  newdir=`pwd`
#  if [ ! "$LASTDIR" = "$newdir" ]; then 
#    /home/nick/bin/markdir
#
#    # List contents
#    ls -t | head -7
#  fi
#
#  export LASTDIR=$newdir
#}

#export PROMPT_COMMAND="prompt_command"

# User specific aliases and functions
calc(){ awk "BEGIN{ print $* }" ;}

#Current PS1
#PS1='[\u@\h \W]\$ '
#Modified PS1
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export IGNOREEOF=1
#source /etc/bash_completion
source ~/.git-completion.sh
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

shopt -s cdspell

# Expand short URLs with option to specify maximum redirects
# http://pthree.org/2011/10/18/use-wget1-to-expand-shortened-urls
expandurl() { wget -O - --max-redirect={2:-0} $1 2>&1 | grep '^Location' }

#CDPATH='.:..:../..:/home/nick/www/html'

#change editor
EDITOR=/bin/vi
VISUAL=/bin/vi
export EDITOR VISUAL

# From Lifehacker
# Use help if man does not return anything
# man () {
# /usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
# }

export PATH=${PATH}:~/bin/android-sdk-linux_x86/tools:~/bin/android-sdk-linux_x86/platform-tools
