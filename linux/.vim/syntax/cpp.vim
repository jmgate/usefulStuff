" Vim syntax file
" Language:	C++
" Current Maintainer:	vim-jp (https://github.com/vim-jp/cpp-vim)
" Previous Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2012 Jun 14

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" C++ extensions
syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		inline virtual explicit export bool wchar_t
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppBoolean		true false
syn keyword stlType             array deque forward_list list map queue set
syn keyword stlType             stack unordered_map unordered_set vector string
syn keyword stlType             stringstream tuple pair

" C++ 11 extensions
if !exists("cpp_no_cpp11")
  syn keyword cppType		override final
  syn keyword cppExceptions	noexcept
  syn keyword cppStorageClass	constexpr decltype
  syn keyword cppConstant	nullptr
endif

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppBoolean		Boolean
  HiLink cppConstant		Constant
  HiLink stlType                Type
  delcommand HiLink
endif

let b:current_syntax = "cpp"

"" Trailing whitespace.
"syn match PoorStyle display excludenl "\s\+$"
"" Tabs.
"syn match PoorStyle display "\t"
"" No space after comma or semicolon.
"syn match PoorStyle display ",\S"
"syn match PoorStyle display ";\S"
"" Space between consecutive > characters.
"syn match PoorStyle display ">\s\+>"
"" Post-increment operator.  (Should generally use pre-increment, unless
"" post-increment is actually necessary.)
"syn match PoorStyle display "\a++"
"" Post-decrement operator.  (Should generally use pre-decrement, unless
"" post-decrement is actually necessary.)
"syn match PoorStyle display "\a--"

"" Opening curly brace at the end of a line, unless it's on a line by itself.
"syn match PoorStyle display "\S\s*{\s*$"
""" Spaces around an ampersand (though this is legitimate for a bitwise and).
""syn match PoorStyle display "\s&\s"
"" Missing space before if/while/for/switch.
"syn match PoorStyle display "\(if\)\@<=("
"syn match PoorStyle display "\(for\)\@<=("
"syn match PoorStyle display "\(while\)\@<=("
"syn match PoorStyle display "\(switch\)\@<=("
" Single-character operators without spaces around them.
"  " + (but not if it's part of ++ or +=)
"  syn match PoorStyle display "[^ +]+[^+=]"
"  syn match PoorStyle display "[^+]+[^ +=]"
"  " - (but not if it's part of --, -=, ->, or if it comes immediately after an
"  "   opening parenthesis)
"  syn match PoorStyle display "[^ -]\((\)\@<!-\([>=]\)\@![^-]"
"  syn match PoorStyle display "[^-]\((\|=\s\+\)\@<!-\([>=]\)\@![^ -]"
"  syn match PoorStyle display "[a-zA-Z0-9]\*[a-zA-Z0-9]"
"  syn match PoorStyle display "[^ \/*]\/[^\/=*]"
"  syn match PoorStyle display "[^\/*]\/[^ \/=*]"
"  syn match PoorStyle display "[^- =+*/!&|<>]=[^=]"
"  syn match PoorStyle display "=[^- =+*/&|]"
"  syn match PoorStyle display "[^ &()]&[^ &=()]"
"  syn match PoorStyle display "[^ |]|[^|=]"
"  syn match PoorStyle display "[^|]|[^ |=]"
"" Double-character operators without spaces around them.
"  syn match PoorStyle display "\S[-=!<>+*/&|]="
"  syn match PoorStyle display "[-=!<>+*/&|]=\S"
"  syn match PoorStyle display "[^ <]<[^=]\(.*>\)\@!"
"  syn match PoorStyle display "<[^ =<]\(.*>\)\@!"
"  syn match PoorStyle display "[^- >]>[^=]\(<.*\)\@<!"
"  syn match PoorStyle display "[^-]>[^ =>]\(<.*\)\@<!"
"hi def PoorStyle ctermbg=red

" vim: ts=8
