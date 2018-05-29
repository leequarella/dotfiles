" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"esc is far away, let's try jj to get us out of insert mode
imap jj <esc>

set number        " Show line numbers
set nowrap        " Turn off Text Wrap

"pressing enter key in command mode removes search highlighting
nnoremap <CR> :nohlsearch <CR>

"sometimes mice are ok... but only sometimes
set mouse=a

" don't autofold code on open
set foldlevel=99

"Highlight trailing whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
:match ExtraWhitespace /\s\+$/           " Show trailing whitespace
:match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab
:match ExtraWhitespace /[^\t]\zs\t\+/    " Show tabs that are not at the start of a line

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

map <leader>t :w\|!spring rspec --color %<cr>
map <leader>r :w\|!RAILS_ENV=test bundle exec rake spec:javascript SPEC=my_test %<cr>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" associate *.lic with ruby filetype.  .lic are lich files for DR
au BufNewFile,BufRead *.lic set ft=ruby
