export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export TERM=screen-256color
export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

plugins=(colored-man colorize heroku rbenv fasd zsh-syntax-highlighting tmuxinator)

ZSH_THEME="bureau"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

work_alaises='~/work/config/work_aliases.sh'
if [ -e "$work_aliases" ]
then
  source "$work_aliases"
fi

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
alias todo='nvim ~/work/todo.txt'
alias q='nvim ~/work/questions.txt'
alias be='bundle exec'
alias circle='open $(hub ci-status -v | cut -d" " -f2)'
alias f='fixops'
alias z='fasd_cd -d'
alias j='jrnl'

# fix the fucking touch bar
function ftftb {
  pkill "Touch Bar agent"
  killall ControlStrip
}
function weather ()  {
  curl http://wttr\.in/$1
}

eval "$(rbenv init -)"
