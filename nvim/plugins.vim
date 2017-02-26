let g:vim_bootstrap_langs = "javascript,ruby"
let g:vim_bootstrap_editor = "nvim"

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

" File navigation
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Send commands in tmux
Plug 'jgdavey/tslime.vim'

" Theme
Plug 'dolph/vim-colors-solarized-black'

" Language specific
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'pangloss/vim-javascript'
Plug 'tmhedberg/matchit'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
call plug#end()
