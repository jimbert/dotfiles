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
alias shipment_status='follower < ~/sql/shipment_status.sql'

# fix the fucking touch bar
function ftftb {
  pkill "Touch Bar agent"
  killall ControlStrip
}

function adhoc_follower_url {
  heroku config:get AD_HOC_FOLLOWER_SHARED_PRODUCTION_DATABASE_URL -a transmetropolitan-production
}
