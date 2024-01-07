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

alias start-btpd='btpd --bw-out 200 --bw-in 200 --max-peers 40'
alias ls='ls -1 --color=auto'
alias info='info --vi-keys'
alias e=nvim
alias p=python
alias l=luajit
alias cline='printf "%.0s#" $(seq 80) ; echo'
alias sw='git switch $(git branch | sk)'
alias ww='w3m "$HTTP_HOME"'

# vipe is part of the package 'moreutils'
alias h='$(history 0 | sk | awk -f ~/bin/h.awk | vipe --suffix sh)'

d() {
	word="$1"
	curl -s dict://dict.org/d:"$word"
}
export SBCL_HOME='/usr/lib64/sbcl/'
