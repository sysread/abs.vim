" Vim syntax file
" Language: ABS
" Maintainer: Jeff Ober

if exists("b:current_syntax")
  finish
endif

syn match absShebang "\%^#!.*" display
syn match absComment "#.*$"

syn match absEscSeq "\\\(\o\{1,3}\|[\"\\'\\?ntbrfva]\|u\x\{4}\|U\x\{8}\|x\x\x\)"
syn match absEscSeq "\\&[^;& \t]\+;"
syn match absFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match absFormat display "%%" contained
syn region absDblQuotString start=+"+ end=+"[cwd]\=+ skip=+\\\\\|\\"+ contains=absFormat,absEscSeq,@Spell
syn region absQuotString    start=+'+ end=+"[cwd]\=+ skip=+\\\\\|\\'+ contains=absFormat,@Spell


syn keyword absFunction f echo stdin exit rand env eval arg type cd pwd flag sleep require source
syn keyword absFunction len fmt number is_number int round ceil floor split lines json contains
syn keyword absFunction str any prefix suffix repeat replace title lower upper trim trim_by index
syn keyword absFunction last_index slice every filter find join keys map pop push reverse shift
syn keyword absFunction slice some sort sum tsv unique values items

syn keyword absType        STRING NUMBER ARRAY HASH
syn keyword absConstant    true false null
syn keyword absConditional if else
syn keyword absRepeat      for while in return break continue

syn region absShellCmd start="`" skip="\\`" end="`"

syn keyword absOperator "=="
syn keyword absOperator "!="
syn keyword absOperator "+"
syn keyword absOperator "+="
syn keyword absOperator "-"
syn keyword absOperator "-="
syn keyword absOperator "*"
syn keyword absOperator "*="
syn keyword absOperator "/"
syn keyword absOperator "/="
syn keyword absOperator "in"
syn keyword absOperator "**"
syn keyword absOperator "**="
syn keyword absOperator "%"
syn keyword absOperator "%="
syn keyword absOperator ">"
syn keyword absOperator ">="
syn keyword absOperator "<"
syn keyword absOperator "<="
syn keyword absOperator "<=>"
syn keyword absOperator "&&"
syn keyword absOperator "||"
syn keyword absOperator ".."
syn keyword absOperator "!"
syn keyword absOperator "!!"
syn keyword absOperator "~"
syn keyword absOperator "&"
syn keyword absOperator "|"
syn keyword absOperator "^"
syn keyword absOperator ">>"
syn keyword absOperator "<<"
syn keyword absOperator "`"

syn keyword absStructure "[" "]" "{" "}" "," "$" "(" ")" '"' "'"

syn match absNumber "<\d+>"
syn match absNumber "<\d+\.\d+>"
syn match absNumber "<\d*\.?\d+([Ee]-?)?\d+>"
syn match absNumber "<0x\x+([Pp]-?)?\x+>"
syn match absNumber "<0b[01]+>"
syn match absNumber "<0o\o+>"


let b:current_syntax = "abs"

hi def link absShebang       PreProc
hi def link absComment       Comment
hi def link absFunction      Function
hi def link absType          Type
hi def link absConstant      Constant
hi def link absConditional   Conditional
hi def link absRepeat        Repeat
hi def link absShellCmd      String
hi def link absOperator      Operator
hi def link absStructure     Structure
hi def link absNumber        Number
hi def link absQuotString    String
hi def link absDblQuotString String
hi def link absEscSeq        SpecialChar
hi def link absFormat        SpecialChar
