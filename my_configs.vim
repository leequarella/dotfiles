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

" map rspec
map <leader>t :w\|!bundle exec rspec --color %<cr>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" associate *.lic with ruby filetype.  .lic are lich files for DR
au BufNewFile,BufRead *.lic set ft=ruby

" run rustfmt on save
let g:rustfmt_autosave = 1

" K should be the opposite J, at least that's what my brain seems to think.
nnoremap <S-k> i<CR><Esc>

" Set Standard as the only linter and fixer for Ruby files
" and thereby preventing conflicts with RuboCop
" let g:ale_linters = {'ruby': ['standardrb']}
" let g:ale_fixers = {'ruby': ['standardrb']}
" automatically fixing with standardrb on save
" let g:ale_fix_on_save = 1

" Turn of AutoPairs which is annoying in how it handles quotation marks
let g:AutoPairs={}
