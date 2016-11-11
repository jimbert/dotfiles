set nocompatible
syntax on
filetype plugin indent on

set tabstop=2 
set shiftwidth=2 
set expandtab 
set softtabstop=2
set incsearch 
set smartcase 
set ignorecase 
set hls
set backspace=indent,eol,start

set cursorline 
set cursorcolumn
set noerrorbells visualbell t_vb=
set noswapfile
"folding settings
set foldmethod=syntax 
set foldnestmax=10 
set nofoldenable 
set foldlevel=1

set ruler
set number

set ttyfast 
set ttymouse=xterm2 
set mouse=a

let mapleader="\<Space>"
let NERDTreeShowHidden=1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_show_hidden = 1
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

map <leader>i :silent !ctags -R . &> dev/null &<CR>:redraw!<CR>
map <leader>t :wa<CR>:call RunCurrentSpecFile()<CR>
map <leader>s :wa<CR>:call RunNearestSpec()<CR>
" Use ctrl-h,j,k,l to navagate VIM splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Ruby hash rocket to new syntax
map <leader>h :s/:\(\w\+\)\s*=>\s*/\1: /<CR>:noh<CR>

noremap <leader>l :Autoformat<CR>

" Search
nmap \ :Ack! 
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeFind<CR>
nmap <leader>p "+p
nmap <leader>P "+P
nmap <leader>o o<esc>
nmap <leader>O O<esc>

nnoremap Q <nop>
nnoremap <Space> <nop>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :AV<CR>

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plug-in manager
Plugin 'VundleVim/Vundle.vim'
" Project search
Plugin 'mileszs/ack.vim'
" File search
Plugin 'kien/ctrlp.vim'
" Project directory
Plugin 'scrooloose/nerdtree'
" Relative line numbers
Plugin 'jeffkreeftmeijer/vim-numbertoggle.git'
" Solarized Black
Plugin 'dolph/vim-colors-solarized-black'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'Chiel92/vim-autoformat'
" Send commands to tmux
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'wesQ3/vim-windowswap'

call vundle#end()            " required

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
highlight Normal ctermbg=None

" only open NERDTree on load if there are no arguments passed to vim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if argc() == 0
  autocmd vimenter * NERDTree
end

"Autoreload vimrc
augroup load_vimrc
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
