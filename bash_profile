#!/usr/bin/env bash

export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME='bakke'

eval "$(fasd --init auto)"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias ls='ls -G'
alias h = heroku
alias be = bundle exec
alias g = hub

export LSCOLORS=ExFxBxDxCxegedabagacad

# Load Bash It
source $BASH_IT/bash_it.sh
export PATH="/usr/local/sbin:$PATH"
