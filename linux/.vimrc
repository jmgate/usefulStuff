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

" Word-wrap lines after 79 characters as you type.
"set textwidth=79
"autocmd BufNewFile,BufRead * setlocal formatoptions+=t

" Highlight portions of lines that are too long to encourage better
" line-breaking.  Toggle highlighting on and off with \o.
highlight Overlength ctermbg=lightred
highlight ClearHighlight ctermbg=none
let s:overlengthActivated = 1
match Overlength /\%>79v.\+/
function! ToggleOverlengthHighlight()
  if s:overlengthActivated == 0
    let s:overlengthActivated = 1
    match Overlength /\%>79v.\+/
  else
    let s:overlengthActivated = 0
    match ClearHighlight /\%>79v.\+/
  endif
endfunction
nnoremap <Leader>o :call ToggleOverlengthHighlight()<CR>

" Jump to the 80th column.
nnoremap <Leader>e :cal cursor(0, 80)<CR>

" Search as characters are entered.
set incsearch

" Case-insensitive search.
set ignorecase

" If you search with all lowercase letters, the search will be case-
" insensitive.  If you use any capitals, the search will be case-sensitive.
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

" Open new split panes to the right and bottom, instead of to the left and
" top.
set splitbelow
set splitright

" Insert a comment at the end of a line.
function! Aside()
  let tw = 82
  let reps = (tw - col("$"))
  if reps > 0
    .s/$/\=("".repeat(" ", reps))/
  endif
  .s/$/\/\//
  .s/$/\=("".repeat(" ", 47))/
  cal cursor(0, 91)
endfunction
nnoremap <Leader>a :call Aside()<CR>:silent! call repeat#set("\<Leader>a", -1)<CR>
function! JMG()
  let tw = 82
  let reps = (tw - col("$"))
  if reps > 0
    .s/$/\=("".repeat(" ", reps))/
  endif
  .s/$/\/\/ JMG:/
  .s/$/\=("".repeat(" ", 42))/
  cal cursor(0, 91)
endfunction
nnoremap <Leader>j :call JMG()<CR>:silent! call repeat#set("\<Leader>j", -1)<CR>
function! FillThisOut()
  let tw = 82
  let reps = (tw - col("$"))
  if reps > 0
    .s/$/\=("".repeat(" ", reps))/
  endif
  .s/$/\/\/ JMG:  Fill this out./
  .s/$/\=("".repeat(" ", 26))/
  cal cursor(0, 91)
endfunction
nnoremap <Leader>f :call FillThisOut()<CR>:silent! call repeat#set("\<Leader>f", -1)<CR>

" Remove a comment at the end of a line.
function! RemoveAside()
  silent! .s/\(\S\+\) *  \/\/ .*$/\1/
  normal $
endfunction
nnoremap <Leader>r :call RemoveAside()<CR>:silent! call repeat#set("\<Leader>r", -1)<CR>

" Insert a Doxygen template.
function! Doxygen()
  normal ^
  let tw = 82
  let end = 130 - tw - 1
  let indent = (col(".") - 1)
  let reps = tw - indent - 1
  .s/\(\S.*\)/\/**\r\r\r\r\r\r\r\r\r\r\r\r\r\1/
  .s/^/\=("".repeat(" ", indent))/
  normal 12k
  .s/^.*$/ *  \\brief Description./
  .s/$/\=("".repeat(" ", reps - 23))/
  .s/$/\/\/ JMG:  Fill this out./
  .s/$/\=("".repeat(" ", end - 21))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ */
  .s/$/\=("".repeat(" ", reps - 2))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *  Detailed description./
  .s/$/\=("".repeat(" ", reps - 25))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ */
  .s/$/\=("".repeat(" ", reps - 2))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *  \\note Something noteworthy./
  .s/$/\=("".repeat(" ", reps - 31))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ */
  .s/$/\=("".repeat(" ", reps - 2))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *  \\param[?] x Description./
  .s/$/\=("".repeat(" ", reps - 28))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ */
  .s/$/\=("".repeat(" ", reps - 2))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *  \\throws x Description./
  .s/$/\=("".repeat(" ", reps - 26))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ */
  .s/$/\=("".repeat(" ", reps - 2))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *  \\returns Something./
  .s/$/\=("".repeat(" ", reps - 23))/
  .s/$/\/\//
  .s/$/\=("".repeat(" ", end))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/ *\//
  .s/^/\=("".repeat(" ", indent))/
  normal 10k^4w
endfunction
nnoremap <Leader>d :call Doxygen()<CR>:silent! call repeat#set("\<Leader>d", -1)<CR>

" Comment line break.
function! CommentLineBreak()
  normal \e
  if getline(".")[col(".") - 1] != ' '
    normal F
  endif
  execute "normal! i\<CR>\<ESC>"
endfunction
nnoremap <Leader>b :call CommentLineBreak()<CR>:silent! call repeat#set("\<Leader>b", -1)<CR>

" Fancy comment line break.
function! FancyCommentLineBreak()
  normal \e
  if getline(".")[col(".") - 1] != ' '
    normal F
  endif
  normal .
endfunction
nnoremap <Leader><CR> :call FancyCommentLineBreak()<CR>

" Join comment lines
function! JoinCommentLines()
" Need to make this smarter so it works on non-comment lines as well.
  normal Jwdw
endfunction
nnoremap <Leader>n :call JoinCommentLines()<CR>:silent! call repeat#set("\<Leader>n", -1)<CR>

" Join and then re-break comment lines.
nnoremap <Leader>x :call JoinCommentLines()<CR>:call CommentLineBreak()<CR>:silent! call repeat#set("\<Leader>x", -1)<CR>

" Insert a heading comment block.
function! InsertHeading()
  normal ^
  let indent = (col(".") - 1)
  let reps   = (79 - indent)
  .s/\(.*\)/\r\r\r\r\r\1/
  normal 5k
  .s/^.*$/\=("".repeat("\/", reps))/
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/\/\//
  .s/^/\=("".repeat(" ", indent))/
  normal 2j
  .s/^.*$/\/\//
  .s/^/\=("".repeat(" ", indent))/
  normal j
  .s/^.*$/\=("".repeat("\/", reps))/
  .s/^/\=("".repeat(" ", indent))/
  normal 2k
  .s/^.*$/\/\/  something/
  .s/^/\=("".repeat(" ", indent))/
  normal ^w
endfunction
nnoremap <Leader>h :call InsertHeading()<CR>:silent! call repeat#set("\<Leader>h", -1)<CR>

" Insert a Teuchos::FancyOStream object.
function! InsertFancyOStream()
  normal ^
  .s/\(.*\)/\r\r\r\1/
  normal 3k
  .s/^.*$/Teuchos::FancyOStream fout(Teuchos::rcpFromRef(std::cout));/
  normal j
  .s/^.*$/fout.setShowProcRank(true);/
  normal j
  .s/^.*$/fout.setOutputToRootOnly(-1);/
  normal j^
endfunction
nnoremap <Leader>t :call InsertFancyOStream()<CR>

" Insert string at the beginning of a line.
function! InsertString(str)
  .s/^/\=(a:str)/
endfunction
nnoremap <Leader>/ :call InsertString('//')<CR>:silent! call repeat#set("\<Leader>\/", -1)<CR>
nnoremap <Leader>" :call InsertString('"')<CR>:silent! call repeat#set("\<Leader>\"", -1)<CR>
nnoremap <Leader># :call InsertString('#')<CR>:silent! call repeat#set("\<Leader>\#", -1)<CR>
nnoremap <Leader>% :call InsertString('%')<CR>:silent! call repeat#set("\<Leader>\%", -1)<CR>

" Highlight aspects of poor coding style.  Toggle on and off with \p.
let s:poorStyleActivated = 1
function! TogglePoorStyleHighlight()
  if s:poorStyleActivated == 0
    let s:poorStyleActivated = 1
    hi PoorStyle ctermbg=red
  else
    let s:poorStyleActivated = 0
    hi clear PoorStyle
  endif
endfunction
nnoremap <Leader>p :call TogglePoorStyleHighlight()<CR>

" Make a substitution unless the pattern is within a string.
command! -bang -nargs=1 -range SmartSub
    \ <line1>,<line2>call s:SmartSub("<bang>", <f-args>)
function! s:SmartSub(bang, repl_arg) range abort
  let do_loop = a:bang != "!"
  let sep = a:repl_arg[0]
  let fields = split(a:repl_arg, sep)
  let cleansed_fields = map(copy(fields), 'substitute(v:val, "\\\\[<>]", "", "g")')
  if fields[1] =~ '^\\='
    let replacement = matchstr(fields[1], '^\\=\zs.*')
  elseif fields[1] =~ '&\|\\\d'
    let replacement = "'".substitute(fields[1], '&\|\\\(\d\)', '\=string(".submatch(".(submatch(0)=="&"?"0":submatch(1)).").")', 'g') ."'"
  else
    let replacement = string(fields[1])
  endif
  let action = '\=((match(map(synstack(line("."), col(".")), "synIDattr(v:val, \"name\")"), "\\cstring")==-1)&&(match(map(synstack(line("."), col(".")), "synIDattr(v:val, \"name\")"), "\\cComment")==-1)&&(match(map(synstack(line("."), col(".")), "synIDattr(v:val, \"name\")"), "\\cCommentL")==-1)&&(match(map(synstack(line("."), col(".")), "synIDattr(v:val, \"name\")"), "\\cFloat")==-1) ? '.replacement.' : submatch(0))'
  let cmd = a:firstline . ',' . a:lastline . 's'
    \. sep . fields[0]
    \. sep . action
        \. sep.(len(fields)>=3 ? fields[2] : '')
  exe cmd
endfunction

" Toggle on and off vertical centering.
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Fix aspects of poor coding style.
function! FixPoorStyle()
"  " Get rid of trailing whitespace.
"  silent! %SmartSub/\s\+$//
"  " Replace tabs with two spaces.
"  silent! %s/\t/  /g
"  " Put a space after a comma or semicolon.
"  silent! %SmartSub/,\(\S\)/, \1/g
"  silent! %SmartSub/;\(\S\)/; \1/g
"  " Remove space between consecutive > characters.
"  silent! %SmartSub/>\s\+>/>>/g

"  " Single-character operators without spaces around them.
"    " + (but not if it's part of ++ or +=)
"    silent! %SmartSub/\([^ +]\)\(+[^+=]\)/\1 \2/g
"    silent! %SmartSub/\([^+]+\)\([^ +=]\)/\1 \2/g
"    " - (but not if it's part of --, -=, ->, or if it comes immediately after
"    "   an opening parenthesis, or if it comes after any of =+-* followed by
"    "   whitespace)
"    silent! %SmartSub/\([^ -]\)\(\((\)\@<!-\([>=]\)\@![^-]\)/\1 \2/g
"    silent! %SmartSub/\([^-]\((\|=\s\+\|+\s\+\|-\s\+\|\*\s\+\)\@<!-\([>=]\)\@!\)\([^ -]\)/\1 \4/g
"    " *
"    silent! %s/\([a-zA-Z0-9]\)\*\([a-zA-Z0-9]\)/\1 \* \2/g
"    " /
"    silent! %s/\([^ \/*]\)\(\/[^\/=*]\)/\1 \2/g
"    silent! %s/\([^\/*]\/\)\([^ \/=*]\)/\1 \2/g
"    " =
"    silent! %s/\([^- =+*/!&|<>]\)\(=[^=]\)/\1 \2/g
"    silent! %s/=\([^- =+*/&|]\)/= \1/g
"    " |
"    silent! %s/\([^ |]\)\(|[^|=]\)/\1 \2/g
"    silent! %s/\([^|]|\)\([^ |=]\)/\1 \2/g
"  " Double-character operators without spaces around them (something=)
"  silent! %s/\(\S\)\([-=!<>+*/&|]=\)/\1 \2/g
"  silent! %s/\([-=!<>+*/&|]=\)\(\S\)/\1 \2/g
"  " Missing space after for/if/while/switch.
"  silent! %s/for(/for (/g
"  silent! %s/if(/if (/g
"  silent! %s/while(/while (/g
"  silent! %s/switch(/switch (/g
endfunction
nnoremap <Leader>s :call FixPoorStyle()<CR>
