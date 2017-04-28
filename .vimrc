call pathogen#infect()


" ARROW KEYS ARE UNACCEPTABLE
  map <Left> :echo "no!"<cr>
  map <Right> :echo "no!"<cr>
  map <Up> :echo "no!"<cr>
  map <Down> :echo "no!"<cr>

" Seriously, guys. It's not like :W is bound to anything anyway.
  command! W :w

" Map ctrl-movement keys to window switching
 map <C-k> <C-w><Up>
 map <C-j> <C-w><Down>
 map <C-l> <C-w><Right>
 map <C-h> <C-w><Left>

"esc is far away, let's try jj to get us out of insert mode
imap jj <esc>

set backupdir=~/.backup,/tmp
set backspace=indent,eol,start
set history=100

set number        " Show line numbers
set nowrap        " Turn off Text Wrap
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

"Highlight trailing whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
:match ExtraWhitespace /\s\+$/           " Show trailing whitespace
:match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab
:match ExtraWhitespace /[^\t]\zs\t\+/    " Show tabs that are not at the start of a line

cnoreabbrev td tab drop

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

map <leader>t :w\|!spring rspec --color %<cr>
map <leader>r :w\|!RAILS_ENV=test bundle exec rake spec:javascript SPEC=my_test %<cr>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" associate *.lic with ruby filetype.  .lic are lich files for DR
au BufNewFile,BufRead *.lic set ft=ruby
