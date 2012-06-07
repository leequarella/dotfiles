call pathogen#infect()
set nocompatible

set backupdir=~/.backup,/tmp
set backspace=indent,eol,start

set history=50
set wildmenu
set showcmd

set hlsearch " set hlsearch  " highlight previous search matches
set incsearch " search as you type
set ignorecase
set smartcase

map Q gq

set scrolloff=3
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set mouse=a

set autoread

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set laststatus=2

cnoreabbrev td tab drop

set number
set nowrap
syntax on
if has("autocmd")
	filetype plugin indent on
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
else
	set autoindent
endif

nnoremap <CR> :nohlsearch <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <Left> :echo "no!"<cr>
 map <Right> :echo "no!"<cr>
 map <Up> :echo "no!"<cr>
 map <Down> :echo "no!"<cr>
