set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" File navigation
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Send commands in tmux
Plugin 'jgdavey/tslime.vim'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-endwise'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jeffkreeftmeijer/vim-numbertoggle.git'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

" Theme
Plugin 'dolph/vim-colors-solarized-black'

" Language specific
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

call vundle#end()

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

let NERDTreeShowHidden=1

" only open NERDTree on load if there are no arguments passed to vim
if argc() == 0
  autocmd vimenter * NERDTree
end
