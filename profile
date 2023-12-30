# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi

# pip bash completion start
# _pip_completion()
# {
#     COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
#                    COMP_CWORD=$COMP_CWORD \
#                    PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
# }
# complete -o default -F _pip_completion pip
# # pip bash completion end
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH="$HOME/.local/bin:/home/yassine/go/bin:$HOME/.cargo/bin:$PATH"
export JAVA_HOME=/usr
export EDITOR=/usr/bin/nvim
export FCEDIT="$EDITOR"
export HISTFILE="$HOME/.shell_history"
export HISTZISE=65535 # maximum for mksh

# https://drewdevault.com/2022/05/25/Google-has-been-DDoSing-sourcehut.html
export GOPROXY=direct

# Load only in X
# [ "$(uname)" = "Linux" ] && setxkbmap -option ctrl:nocaps

# For Wayland
export XKB_DEFAULT_LAYOUT=jp
export XKB_DEFAULT_OPTIONS=compose:ralt,ctrl:nocaps
export DISPLAY=:0

alias start-btpd='btpd --bw-out 200 --bw-in 200 --max-peers 40'
alias ls='ls -1 --color=auto'
alias info='info --vi-keys'
alias e=nvim
alias p=python
alias l=luajit
alias cline='printf "%.0s#" $(seq 80) ; echo'
alias sw='git switch $(git branch | sk)'

# vipe is part of the package 'moreutils'
alias h='$(history 0 | sk | awk -f ~/bin/h.awk | vipe --suffix sh)'

# xmodmap ~/.xmodmaprc
