syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
" set smartcase " disabling because it doesnt make sense w/o ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
set nu
set nohlsearch
set hidden
set termguicolors
set scrolloff=8
set signcolumn=yes
filetype indent on

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


""" PLUGS
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jremmen/vim-ripgrep'
" git in vim (im not using it, maybe i should)
Plug 'tpope/vim-fugitive'
" surround expressions with parens/quotes/tags
Plug 'tpope/vim-surround'
" comment stuff out easier
Plug 'tpope/vim-commentary'
" slurpage/barfage action
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'vim-utils/vim-man'
"Plug 'lyuts/vim-rtags'
" Plug 'kien/ctrlp.vim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
"Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'lervag/vimtex'
""" conjure
Plug 'Olical/conjure', {'tag': 'v4.23.0'}

call plug#end()

""" COLORSCHEME
colorscheme dracula
"set background=dark

""" HELP rg FIND ROOT
if executable('rg')
    let g:rg_derive_root='true'
endif

""" ctrlp EXCEPTIONS
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
""" ctrlp caching
" let g:ctrlp_use_caching=0

""" NO ELP IN FILE TREE
" open files from netrw in a previous window, unless we're opening the current dir
let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_winsize=25

""" KEYBINDS
" define leader to be space
let mapleader = " "
let maplocalleader = ","
" use jk as esc
inoremap jk <ESC>
" remap moving between panes
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" easy access to undotree
nnoremap <leader>u :UndotreeShow<CR>
" open a good thin window for the file tree
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" resize vertical split
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
" YEP COC (jump to definition)
nnoremap <silent> <leader>gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <silent> <leader>gt :call CocAction('jumpDefinition', 'tabe')<CR>
nnoremap <silent> <leader>gs :call CocAction('jumpDefinition', 'split')<CR>
nnoremap <silent> <leader>gv :call CocAction('jumpDefinition', 'vsplit')<CR>
" buffer navigation
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bl <C-^>
" buffer save
nnoremap <silent> <leader>bs :up<CR>
" buffer kill
nnoremap <silent> <leader>bk :bd<CR>
" source current file
nnoremap <leader>sf :source %<CR>
" fzf search bindings 
nnoremap <silent> <leader>fp :Rg<CR>
nnoremap <silent> <leader>pf :Files<CR>
nnoremap <silent> <leader><leader> :Buffers<CR>
" use + register to get ctrl-c ctrl-v in visual mode
vnoremap <C-c> "+y
vnoremap <C-v> "+p
" mimic ctrl-j from emacs
nnoremap <C-j> 0ko<ESC>S<ESC>j0

" function! s:find_git_root()
"   return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
" endfunction
" 
" command! ProjectFiles execute 'Files' s:find_git_root()

""" TODO: 
" [X] read about ctrlP: https://github.com/kien/ctrlp.vim
" [X] remap buffer navigation
" [ ] find out how to show git branch in status line
