source ~/.dotfiles/vim/Rename2.vim

let g:vim_bootstrap_langs = "javascript,ruby"
let g:vim_bootstrap_editor = "nvim"

function InstallVimPlug(location)
  let vimplug_path = expand(a:location)
  if !filereadable(vimplug_path)
    echo "Installing Vim-Plug..."
    execute 'silent !\curl -fLo ' vimplug_path ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >& /dev/null'
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
  endif
endfunction

if has('nvim')
  call InstallVimPlug('~/.config/nvim/autoload/plug.vim')
else
  call InstallVimPlug('~/.vim/autoload/plug.vim')
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

" File navigation
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
let g:deoplete#enable_at_startup = 1

" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
  if exists('*deoplete#disable')
    exe 'call deoplete#disable()'
  endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
  if exists('*deoplete#enable')
    exe 'call deoplete#enable()'
  endif
endfunction

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
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'

Plug 'bronson/vim-trailing-whitespace'
" Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'

call plug#end()
