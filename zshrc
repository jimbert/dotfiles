export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export ZSH_THEME="bureau"
export DOTFILES_DIR=$HOME/.dotfiles

plugins=(colorize rbenv fasd web-search bundler jira)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$HOME/work/config/work_aliases.sh"

alias cat='bat'
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
alias cc='codeclimate analyze $(git diff --name-only master | grep -v spec)'
alias mt='git mergetool'

# open circle-ci for the current project and branch
ci() {
  ruby $DOTFILES_DIR/scripts/circle.rb build_url
}

ci_perf() {
  ruby $DOTFILES_DIR/scripts/circle.rb slow_test_files
}

ci_slow() {
  ruby $DOTFILES_DIR/scripts/circle.rb slow_tests
}

ci_failed() {
  ruby $DOTFILES_DIR/scripts/circle.rb failed_tests
}

ci_rspec() {
  bundle exec rspec $(ci_failed | grep spec)
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
