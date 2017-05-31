export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/.rvm/bin" 
export EDITOR=nvim

ZSH_THEME="bureau"

plugins=(git colored-man colorize heroku rvm brew osx zsh-syntax-highlighting fasd tmuxinator)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='ls -GF'
alias h='heroku'
alias g='hub'
alias v='nvim'
alias vi='nvim'
alias ts='tmux new-session -s'
alias ta='tmux a -t'
alias t='tmux'
alias work='tmuxinator start work'
alias ci='hub ci-status'
alias follower='psql $(adhoc_follower_url)'
alias follower_q='psql $(adhoc_follower_url) -c'
# alias ssh=color-ssh
alias rm='rm -i'
alias shipment_status='follower < ~/sql/shipment_status.sql'

# fix the fucking touch bar
function ftftb {
  pkill "Touch Bar agent"
  killall ControlStrip
}

function adhoc_follower_url {
  heroku config:get AD_HOC_FOLLOWER_SHARED_PRODUCTION_DATABASE_URL -a transmetropolitan-production
}

# Usage:
# source iterm2.zsh

# iTerm2 window/tab color commands
#   Requires iTerm2 >= Build 1.0.0.20110804
#   http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

# Change the color of the tab when using SSH
# reset the color after the connection closes
# color-ssh() {
#     if [[ -n "$ITERM_SESSION_ID" ]]; then
#         trap "tab-reset" INT EXIT
#         if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
#             tab-color 255 0 0
#         else
#             tab-color 0 50 0
#         fi
#     fi
#     ssh $*
# }
#
# compdef _ssh color-ssh=ssh

