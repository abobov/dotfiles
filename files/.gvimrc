" Число строк в новом окне
set lines=40
" Отключение тулбара
set guioptions-=T 
" Горизонтальная прокрутка
set guioptions-=b 
" Вертикальная прокрутка
set guioptions-=r
" Убрать меню
set guioptions-=m
" Убрать мерцание курсора
set guicursor+=a:blinkoff0

" Set no visual bell again
set t_vb=

" Цвет меню дополнения
hi Pmenu guibg=#75507B
" Подсветка текущей строки при вводе
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

let s:local_gvimrc=$HOME . "/.gvimrc-" . hostname()
if filereadable(s:local_gvimrc)
    silent! execute ':source ' . s:local_gvimrc
endif
