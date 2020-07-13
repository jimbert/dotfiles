" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" The Silver Searcher
nmap <C-\> :Ack!

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
map <leader>i :silent !sh ~/.dotfiles/scripts/ruby_tags.sh &<CR>:redraw!<CR>
map <leader>T :wa<CR>:call RunCurrentSpecFile()<CR>
map <leader>t :wa<CR>:call RunLastSpec()<CR>
map <leader>s :wa<CR>:call RunNearestSpec()<CR>
map <leader>u :checkt<CR>
map <leader>L :!rufo %<CR> :checkt<CR>
map <leader>` :source ~/.vimrc<CR>
map <leader>z :q<CR>
map <leader>y i<% %><esc>F i
map <leader>= <C-W>=
map <leader>+ <C-W>_<C-W><Bar>
map <C-Space> <esc>

" a little moving around insert mode
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-h> <C-o>h
imap <C-l> <C-o>l

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <leader>o o<esc>
nmap <leader>O O<esc>
nmap <leader>R :%s/\v

nnoremap j gj
nnoremap k gk

nnoremap Q <nop>
nnoremap <Space> <nop>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>l :Autoformat<CR>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" remove trailing spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Ctrl-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" Ruby refactor
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
nnoremap <leader>rit  :RInlineTemp<cr>

vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

" sub in visual block
vnoremap <leader>R :s/\v

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use ctrl-h,j,k,l to navagate VIM splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" hack to get C-h working in neovim
if has('nvim')
  map <BS> <C-w>h
endif

if &diff
  map <leader>L :diffg LO<CR>
  map <leader>R :diffg RE<CR>
  map <leader>B :diffg BA<CR>
  map gn />>>>><CR>
endif

