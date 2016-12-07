" Set the number of visual spaces per tab.
set tabstop=2

" Set the number of spaces per tab when editing.
set softtabstop=2

" Let the tab key insert spaces instead.
set expandtab

" Set the number of spaces when indenting.
set shiftwidth=2

" Match the indentation from the previous line.
set autoindent

" Automatically word wrap.
"set textwidth=79
"autocmd BufNewFile,BufRead * setlocal formatoptions+=t

" Search as characters are entered.
set incsearch

" Case-insensitive search.
set ignorecase

" If you search with all capitals or all lowercase, the search will be case
" insensitive.  If you use both capitals and lowercase, the search will be
" case sensitive.
set smartcase

" Highlight the current line by default.
set cursorline

" Set the highlight to be a white background.
hi CursorLine   cterm=NONE ctermbg=white
hi CursorColumn cterm=NONE ctermbg=white

" Press \l to toggle highlighting the current line, and \c to toggle
" highlighting the current column.
nnoremap <Leader>l :set cursorline!<CR>
nnoremap <Leader>c :set cursorcolumn!<CR>

" Press f to move forward to the next space in the line.  Press F to move
" backward to the previous space in the line.
nnoremap f f<space>
nnoremap F F<space>

" Press F2 to switch to paste mode, such that autoindent will be ignored when
" pasting in text.
inoremap <expr> <tab> ((getline('.')[:col('.')-2]=~'\S')?("\<C-v>\t"):(repeat(' ', &ts-((virtcol('.')-1)%&ts))))
set pastetoggle=<F2>

" Toggle spell-checking with F4.
if has("spell")
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
endif
