" Mappings
let mapleader="\<Space>"
map <leader>i :silent !ctags -R . &> /dev/null &<CR>:redraw!<CR>
map <leader>t :wa<CR>:call RunCurrentSpecFile()<CR>
map <leader>s :wa<CR>:call RunNearestSpec()<CR>
map <leader>u :checkt<CR>
map <leader>z :q<CR>

" Use ctrl-h,j,k,l to navagate VIM splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap \ :Ack! 
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeFind<CR>
nmap <leader>o o<esc>
nmap <leader>O O<esc>

nnoremap Q <nop>
nnoremap <Space> <nop>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :AV<CR>
nnoremap <leader>l :Autoformat<CR>

set nocompatible
filetype off

" This script contains my plugins
source ~/.dotfiles/vim/plugins.vim
" script for settings
source ~/.dotfiles/vim/settings.vim

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
highlight Normal ctermfg=250 ctermbg=None


"Autoreload vimrc
augroup load_vimrc
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
