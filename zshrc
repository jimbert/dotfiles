export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export ZSH_THEME="bureau"
export DOTFILES_DIR=$HOME/.dotfiles
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.nodenv/bin

plugins=(colorize rbenv fasd web-search bundler jira)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

work_script="$HOME/work/config/work_aliases.sh"
if [ -f $work_script ]; then
  source $work_script
fi

alias cat='bat'
alias f='fixops'
alias g='hub'
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
alias pr='hub pull-request'
alias c='thor'
alias mt='git mergetool'
alias clear_dns='sudo killall -HUP mDNSResponder'

# fix the fucking touch bar
ftftb() {
  pkill "Touch Bar agent"
  killall ControlStrip
}

weather()  {
  curl http://wttr\.in/$1
}

alias j8="JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/"

eval "$(rbenv init -)"
eval "$(nodenv init -)"
