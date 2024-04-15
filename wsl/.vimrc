set number
set ignorecase
set incsearch

set tabstop=4
set expandtab
set shiftwidth=4
set smartindent

set ruler
set colorcolumn=100

" add jk
inoremap jk <Esc>

" highlight line on leaving normal mode,
" see https://stackoverflow.com/a/6489348
:autocmd InsertEnter,InsertLeave * set cul!

" remove the underline,
" see https://forums.linuxmint.com/viewtopic.php?t=255989
hi CursorLineNR cterm=NONE ctermbg=yellow ctermfg=magenta

" --- below are the additions borrowed from my old vimrc
" behaviour
set noerrorbells
set nowrap
set noswapfile
set nobackup
highlight ColorColumn ctermbg=lightgrey

" keybinds
let mapleader = " "
let localmapleader = ","
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bl <C-^>
nnoremap <silent> <leader>bs :up<CR>
nnoremap <silent> <leader>bk :bd<CR>
nnoremap <leader>sf :source %<CR>
vnoremap <C-c> "+y
vnoremap <C-v> "+p
nnoremap <C-j> 0ko<Esc>S<Esc>j0
