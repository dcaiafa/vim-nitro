" nitro.vim: Vim syntax file for Nitro.
"
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn region nitroBlock        start="{" end="}" transparent fold

syn keyword nitroConditional  if else 
hi def link nitroConditional  Conditional

syn keyword nitroRepeat     for while
hi def link nitroRepeat     Repeat

syn keyword nitroException  try catch
hi def link nitroException  Exception

syn keyword nitroStatement  return defer
hi def link nitroStatement  Statement

syn keyword nitroKeyword    func var not
hi def link nitroKeyword    Keyword

syn keyword nitroBoolean    true false 
hi def link nitroBoolean    Boolean

syn match nitroMeta      "^\s*\zs!param\>"
syn match nitroMeta      "^\s*\zs!flag\>"
hi def link nitroMeta    Special

syn region nitroShebang     start="^#!" end="$"
hi def link nitroShebang    Comment

syn region nitroSingleComment start="//" end="$"
hi def link nitroSingleComment    Comment

syn region nitroString         start=+"+ skip=+\\"\|\\\\+ end=+"+
syn region nitroString         start=+f"+ skip=+\\"\|\\\\+ end=+"+ contains=nitroInterpolation
syn region nitroString         start="r`" end="`"
syn region nitroString         start="e`" end="`"
syn region nitroInterpolation  start=+\(^\|[^\\]\)\zs{+ end=+}+ contained
hi def link nitroString        String
hi def link nitroInterpolation Special

syn match nitroDecimalInt   "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
hi def link nitroDecimalInt Number

syn match nitroFloat        "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match nitroFloat        "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"
hi def link nitroFloat      Number

syn sync minlines=500

let b:current_syntax = "nitro"
