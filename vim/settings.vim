syntax enable
filetype plugin indent on

if $TMUX == ''
  set clipboard+=unnamed
endif
set backspace=indent,eol,start

set tw=80
set wrap linebreak nolist
set nojoinspaces

" tabs
set expandtab 
set shiftwidth=2 
set softtabstop=2
set tabstop=2 
" search
set ignorecase 
set smartcase 
set hls
set incsearch 
set scrolloff=5
" skips prompts when autoreloading open buffers
set autoread
set noerrorbells visualbell t_vb=
set noswapfile
" folding settings
set foldlevel=1
set foldmethod=syntax 
set foldnestmax=10 
set nofoldenable 
" line number settings
set ruler
set number

set splitright
set splitbelow

if !has('nvim')
  set ttymouse=xterm2 
endif
set mouse=a

set ttyfast 
set lazyredraw
