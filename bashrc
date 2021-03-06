export VISUAL=vim
export EDITOR="$VISUAL"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/local/bin:$PATH

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
alias config='/usr/bin/git --git-dir=/Users/jimfung/.cfg/ --work-tree=/Users/jimfung'
alias config='/usr/bin/git --git-dir=/Users/jimfung/.cfg/ --work-tree=/Users/jimfung'

export PATH="$HOME/.bin:$PATH"

