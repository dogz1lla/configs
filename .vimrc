" this config was shamelessly copied from:
" dougblack.io/words/a-good-vimrc.html

syntax enable	" enable syntax processing
" TABS/SPACES
set tabstop=4	" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set expandtab	" tabs are spaces
" APPEARANCE
set number	" show line numbers
set relativenumber 	" relative line numbers
set showcmd	" show command in bottom bar
filetype indent on	" load filetype-specific indent files
set wildmenu	" visual autocomplete for command menu
set lazyredraw	" redraw only when we need to
set showmatch	" highlight matching ([{
" SEARCHING
set incsearch	" search as characters are entered
" LEADER SHORTCUTS
nnoremap <Space> <Nop>
map <Space> <leader>
inoremap jk <esc>	" jk is escape
nnoremap <leader>a :Ag	" open ag.vim
" CTRLP
let g:ctrlp_match_window = 'bottom,order:ttb'	" order matches from top to bottom
let g:ctrlp_switch_buffer = 0	" always open files in new buffers
let g:ctrlp_working_path_mode = 0	" change the working directory during a vim session
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'	"make CtrlP wicked fast
" MY STUFF FROM NOW ON
set shiftwidth=4
set autoindent
set cindent
" COC
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()
