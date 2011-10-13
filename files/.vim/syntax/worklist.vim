" Vim syntax file

syntax clear
syntax case match

syn match worklistTag /\v\[\w+\]/
" Statuses
syn region worklistDone start=/\v^\-\s*\:DONE\:/ end=/\v^\s*$/
syn region worklistBug start=/\v^\-\s*\:BUG\:/ end=/\v^\s*$/
syn region worklistNew start=/\v^\-\s*\:NEW\:/ end=/\v^\s*$/
syn region worklistLow start=/\v^\-\s*\:LOW\:/ end=/\v^\s*$/

hi link worklistDone Ignore
hi link worklistBug Error
hi link worklistNew Todo
hi link worklistLow Comment
hi link worklistTag Tag

let b:current_syntax = "worklist"
