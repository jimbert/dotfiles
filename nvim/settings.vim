
" Required:
filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set tw=80
set wrap linebreak nolist

"" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set relativenumber
set number

"" Enable hidden buffers
set hidden

" search
set ignorecase
set smartcase
set scrolloff=5

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

set splitright
set splitbelow

" folding settings
set foldlevel=1
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set lazyredraw

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

" let no_buffers_menu=1
" set t_Co=256

set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ [line\ %l\/%L,\ col\ %c]

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
highlight Normal ctermfg=250 ctermbg=None

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

" The silver surfer
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let NERDTreeShowHidden=1

" only open NERDTree on load if there are no arguments passed to vim
if argc() == 0
  autocmd vimenter * NERDTree
end

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

set autoread