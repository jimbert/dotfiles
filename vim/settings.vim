syntax enable
filetype plugin indent on
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" set tw=120
set colorcolumn=121
set wrap linebreak nolist

"" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

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

" folding settings
set foldlevel=1
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set lazyredraw

" set mouse=a
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

set splitright
set splitbelow

set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ [line\ %l\/%L,\ col\ %c]

" Disable visualbell
set noerrorbells visualbell t_vb=

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
highlight Normal ctermfg=250 ctermbg=None


let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:tslime_always_current_session = 1

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" The silver surfer
if executable('ag')
  let g:ackprg = 'ag --vimgrep '
  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec} --format documentation\n")'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\..*$[[dir]]']

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"
" only open NERDTree on load if there are no arguments passed to vim
if argc() == 0
  autocmd vimenter * NERDTree
end

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

" Enable backup copies when editing crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Center the cursor on the page
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

set autoread
