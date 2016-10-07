export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/.rvm/bin" 

ZSH_THEME="bureau"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git colored-man colorize heroku rvm vundle aws brew osx zsh-syntax-highlighting fasd)

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias h="heroku"
alias g="git"
alias v="vim"
alias vi="vim"
alias gcm="git commit -m"
