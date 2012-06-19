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

"pressing enter key in command mode removes search highlighting
nnoremap <CR> :nohlsearch <CR>

"tab auto complete
function! Smart_TabComplete()
  let line = getline('.')                         " current line
  let substr = strpart(line, -1, col('.')+1)      " from the start of the current of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif

  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <Left> :echo "no!"<cr>
 map <Right> :echo "no!"<cr>
 map <Up> :echo "no!"<cr>
 map <Down> :echo "no!"<cr>
