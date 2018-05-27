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
