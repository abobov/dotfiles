" Vim script file
" FileType:     RFC
" Author:       lilydjwg <lilydjwg@gmail.com>
" Last Change:  2010年1月16日

function! s:rfcTag()
  " 从目录跳转到正文
  let syn = synIDattr(synID(line("."), col("."), 1), "name")
  if syn == 'rfcContents' || syn == 'rfcDots'
    let l = getline('.')
    let l = matchstr(l, '\v[0-9.]+\s(\w|\s)\S')
    let l = '^\V' . l
    call search(l, 's')
  else
    echohl Error
    echomsg '光标不位于目录项！'
    echohl None
  endif
endfunction

nmap <buffer> <silent> <C-]> :call <SID>rfcTag()<CR>
