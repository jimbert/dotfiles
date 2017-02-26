source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/settings.vim

" Mappings
" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" The Silver Searcher
nmap \ :Ack!

noremap YY "+y<CR>
noremap <leader>p "+pk<CR>
noremap XX "+x<CR>

if has('macunix')
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintaining Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Leader key
let mapleader="\<Space>"
map <leader>i :silent !ctags -R --languages=ruby --exclude=.git --exclude=log $(bundle list --paths) . &> /dev/null &<CR>:redraw!<CR>
map <leader>t :wa<CR>:call RunCurrentSpecFile()<CR>
map <leader>s :wa<CR>:call RunNearestSpec()<CR>
map <leader>u :checkt<CR>
map <leader>z :q<CR>
map <leader>= <C-W>=
map <leader>+ <C-W>_<C-W><Bar>

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <leader>o o<esc>
nmap <leader>O O<esc>

nnoremap Q <nop>
nnoremap <Space> <nop>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :AV<CR>
nnoremap <leader>l :Autoformat<CR>

" Ruby refactor
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

" Use ctrl-h,j,k,l to navagate VIM splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" hack to get C-h working in neovim
if has('nvim')
  map <BS> <C-w>h
endif

