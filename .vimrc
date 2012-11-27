call pathogen#infect()

" ARROW KEYS ARE UNACCEPTABLE
  map <Left> :echo "no!"<cr>
  map <Right> :echo "no!"<cr>
  map <Up> :echo "no!"<cr>
  map <Down> :echo "no!"<cr>

" Seriously, guys. It's not like :W is bound to anything anyway.
  command! W :w


set backupdir=~/.backup,/tmp
set backspace=indent,eol,start
set history=100

set scrolloff=3   " Keep more context when scrolling off the end of a buffer
set ruler         " show the cursor position all the time
set wildmenu      " Make tab completion for files/buffers act like bash
set showcmd       " display incomplete commands
set hidden        " keep undo history for background buffers
set autoread      " autoamically read the file again when it is changed externally
set showtabline=2 " always show tab bar

" Editting configuration
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" set smartindent
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"Search Stuff
  set hlsearch  " highlight previous search matches
  set incsearch " search as you type
  " Make searches case-sensitive only if they contain upper-case characters
  set ignorecase
  set smartcase
  "pressing enter key in command mode removes search highlighting
  nnoremap <CR> :nohlsearch <CR>

set mouse=a

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


" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let mapleader=","

map <leader>t :w\|!rspec --drb --color %<cr>

" other tab auto complete method
"function! Smart_TabComplete()
"  let line = getline('.')                         " current line
"  let substr = strpart(line, -1, col('.')+1)      " from the start of the current of the cursor
"  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"  if (strlen(substr)==0)                          " nothing to match on empty string
"    return "\<tab>"
"  endif
"
"  let has_period = match(substr, '\.') != -1      " position of period, if any
"  let has_slash = match(substr, '\/') != -1       " position of slash, if any
"  if (!has_period && !has_slash)
"    return "\<C-X>\<C-P>"                         " existing text matching
"  elseif ( has_slash )
"    return "\<C-X>\<C-F>"                         " file matching
"  else
"    return "\<C-X>\<C-O>"                         " plugin matching
"  endif
"endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

