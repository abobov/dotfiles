" Vim syntax file
" Filetype:	RFC
" Author:	lilydjwg <lilydjwg@gmail.con>
" Last Change:	2010年1月16日

syntax clear
syntax case match

syn match rfcTitle	/^\v(\n)@<!\S.*$/
syn match rfcTheTitle	/^\v\s{7,40}\S.*$/
syn match rfcRFCTitle	/^\v(\n)@<=RFC.*$/
syn match rfcRFC	/.\@<=RFC\s\+[0-9]\+/
syn match rfcNumber	/\[\d\+\]/
syn match rfcComment	/^\S.*\ze\n/
syn match rfcDots	/\v\.+\ze\d+$/ contained
" 允许换一次行；如果允许无限换行，会将后面的标题也高亮
syn match rfcContents	/^\v\s*\d.*(\n.*)?(\s|\.)\d+$/ contains=rfcDots
syn keyword rfcNote	NOTE note: Note: NOTE: Notes Notes: MUST NOT

hi link rfcTitle	Title
hi link rfcTheTitle	Type
hi link rfcRFCTitle	PreProc
hi link rfcNote		Todo
hi link rfcRFC		Number
hi link rfcComment	Comment
hi link rfcNumber	Number
hi link rfcDots		Comment
hi link rfcContents	Tag

let b:current_syntax = "rfc"
