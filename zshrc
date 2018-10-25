export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export ZSH_THEME="bureau"
export DOTFILES_DIR=$HOME/.dotfiles

plugins=(colored-man colorize rbenv fasd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

work_aliases='~/work/config/work_aliases.sh'
if [ -e "$work_aliases" ]
then
  source "$work_aliases"
fi

alias be='bundle exec'
alias cat='bat'
alias ci='hub ci-status'
alias f='fixops'
alias g='hub'
alias h='heroku'
alias j='jrnl'
alias ls='ls -GF'
alias q='nvim ~/work/questions.txt'
alias t='tmux'
alias ta='tmux a -t'
alias todo='nvim ~/work/todo.txt'
alias ts='tmux new-session -s'
alias v='nvim'
alias vi='nvim'
alias work='tmuxinator start work'
alias z='fasd_cd -d'
alias t3pr='hub pull-request -l tier-3'
alias pr='hub pull-request'
alias c='thor'

# open circle-ci for the current project and branch
circle() {
  open $(ruby -e 'puts `hub ci-status -v | head -n1`.match(/(http.*)\//).to_s + "tree/" + `git branch-name`')
}

# fix the fucking touch bar
ftftb() {
  pkill "Touch Bar agent"
  killall ControlStrip
}

weather()  {
  curl http://wttr\.in/$1
}

eval "$(rbenv init -)"
