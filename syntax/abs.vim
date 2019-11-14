" Vim syntax file
" Language: ABS
" Maintainer: Jeff Ober

if exists("b:current_syntax")
  finish
endif

syn match absComment "#.*$"
syn match absShebang display "\%^#!.*"

syn match  absFormat      display contained "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)"
syn match  absFormat      display contained "%%"
syn match  absEscapeError display contained /\\./
syn match  absEscape      display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syn match  absIntplVar    display contained /$\h*/
syn region absString1     start=+c\?'+  skip=+\\\\\|\\'+ end=+'+ oneline contains=@Spell
syn region absString2     start=+c\?"+  skip=+\\\\\|\\"+ end=+"+ oneline contains=absEscape,absEscapeUnicode,absEscapeError,absIntplVar,absFormat,@Spell
syn region absBacktick    start=+c\?`+  skip=+\\\\\|\\`+ end=+`+ oneline contains=absEscape,absEscapeUnicode,absEscapeError,absIntplVar,@Spell
syn region absShellCmd    start=+c\?$(+ skip=+\\\\\|\\(+ end=+)+ oneline contains=absEscape,absEscapeUnicode,absEscapeError,absIntplVar,@Spell

syn keyword absFunction f echo stdin exit rand env eval arg type cd pwd flag sleep require source
syn keyword absFunction len fmt number is_number int round ceil floor split lines json contains
syn keyword absFunction str any prefix suffix repeat replace title lower upper trim trim_by index
syn keyword absFunction last_index slice every filter find join keys map pop push reverse shift
syn keyword absFunction slice some sort sum tsv unique values items

syn keyword absType        STRING NUMBER ARRAY HASH
syn keyword absConstant    true false null
syn keyword absConditional if else
syn keyword absRepeat      for while in return break continue

syn keyword absStructure "[" "]" "{" "}" "," "$" "(" ")"

syn match absNumber "<\d+>"
syn match absNumber "<\d+\.\d+>"
syn match absNumber "<\d*\.?\d+([Ee]-?)?\d+>"
syn match absNumber "<0x\x+([Pp]-?)?\x+>"
syn match absNumber "<0b[01]+>"
syn match absNumber "<0o\o+>"

let b:current_syntax = "abs"

hi def link absShebang          PreProc
hi def link absComment          Comment
hi def link absFunction         Function
hi def link absType             Type
hi def link absConstant         Constant
hi def link absConditional      Conditional
hi def link absRepeat           Repeat

hi def link absStructure        Structure
hi def link absNumber           Number

hi def link absEscSeq           SpecialChar
hi def link absFormat           SpecialChar
hi def link absIntplVar         SpecialChar
hi def link absEscape           SpecialChar

hi def link absString1          String
hi def link absString2          String
hi def link absBacktick         String
hi def link absShellCmd         String
