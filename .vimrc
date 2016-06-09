set nocompatible
filetype on
syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set clipboard=unnamed
set hls
set cursorline
set cursorcolumn
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
let NERDTreeShowHidden=1
let g:ackprg = 'ag --nogroup --nocolor --column'
set noswapfile

set ruler
set number

let g:airline_theme='dark'

" Mouse {{{
 set ttyfast
 set ttymouse=xterm2
 set mouse=a
" " }}}

" Use ctrl-h,j,k,l to navagate VIM splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Search
nmap \ :Ack! 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plug-in manager
Plugin 'VundleVim/Vundle.vim'
" Git
Plugin 'tpope/vim-fugitive'
" Project search
Plugin 'mileszs/ack.vim'
" File search
Plugin 'kien/ctrlp.vim'
" Project directory
Plugin 'scrooloose/nerdtree'
" Relative line numbers
Plugin 'jeffkreeftmeijer/vim-numbertoggle.git'
" Color Scheme
Plugin 'flazz/vim-colorschemes' 
" Autoformatting
Plugin 'Chiel92/vim-autoformat'
" All of your Plugins must be added before the following line
Plugin 'jpo/vim-railscasts-theme'
" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Surround
Plugin 'tpope/vim-surround'
" Rails vim
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required


" only open NERDTree on load if there are no arguments passed to vim 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if argc() == 0
autocmd vimenter * NERDTree
end

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
highlight Normal ctermbg=None


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader=","
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>r :NERDTreeFind<CR>
map <silent> <Leader>i :!ctags -R . >/dev/null 2>&1 &<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :Autoformat<CR>


" Search
nmap \ :Ack! 

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
