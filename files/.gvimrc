" Число строк в новом окне
set lines=40
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=m
set guicursor+=a:blinkoff0

" Visual bell option reseted after starting gvim
set t_vb=

" Подсветка текущей строки при вводе
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" Fix gx in XFCE
" https://vi.stackexchange.com/a/5034
if executable('exo-open')
  let g:netrw_browsex_viewer="setsid exo-open"
endif

let s:local_gvimrc=$MYGVIMRC . ".local"
if filereadable(s:local_gvimrc)
    silent! execute ':source ' . s:local_gvimrc
endif
