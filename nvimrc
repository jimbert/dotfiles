source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/settings.vim

" Mappings
nnoremap <Tab> gt
nnoremap <S-Tab> gT

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let NERDTreeShowHidden=1

" only open NERDTree on load if there are no arguments passed to vim
if argc() == 0
  autocmd vimenter * NERDTree
end

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" The Silver Searcher
nmap \ :Ack!
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

noremap YY "+y<CR>
noremap <leader>p "+pk<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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

let mapleader="\<Space>"
map <leader>i :silent !ctags -R --languages=ruby --exclude=.git --exclude=log $(bundle list --paths) . &> /dev/null &<CR>:redraw!<CR>
" RSpec.vim mappings
map <leader>t :wa<CR>:call RunCurrentSpecFile()<CR>
map <leader>s :wa<CR>:call RunNearestSpec()<CR>
map <leader>u :checkt<CR>
map <leader>z :q<CR>
map <leader>= <C-W>=
map <leader>+ <C-W>_<C-W><Bar>

" Use ctrl-h,j,k,l to navagate VIM splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" hack to get C-h working in neovim
if has('nvim')
  map <BS> <C-w>h
endif

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <leader>o o<esc>
nmap <leader>O O<esc>

nnoremap Q <nop>
nnoremap <Space> <nop>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :AV<CR>
nnoremap <leader>l :Autoformat<CR>
