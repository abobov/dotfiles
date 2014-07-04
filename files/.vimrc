" vim: spell spelllang=ru,en foldmethod=marker :

" Setup {{{1
set nocompatible
language C

filetype off " Do so to reload filetype plugins after pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
if &t_Co > 2 || has('gui_running')
    syntax on
endif
filetype plugin indent on

let g:template_dir=$HOME . "/.vim/templates"

" Options {{{1

set encoding=utf-8
" Encodings try list
if has("multi_byte")
    set fileencodings=ucs-bom,utf-8,cp1251,koi8-r,cp866
endif

set autoread
set visualbell t_vb=
set title
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" Скрывать буфер редактировании другого
set hidden
" Отображать текущую команду
set showcmd
" По умолчанию пользоваться :help справкой
set keywordprg=
set omnifunc=syntaxcomplete#Complete

runtime! macros/matchit.vim
set backspace=indent,eol,start
" Показывать столбец с номерами строк
set number
" Размер табуляции
set tabstop=4
set smarttab
" Размер сдвига блока
set shiftwidth=4
set shiftround
set softtabstop=4
" Заменять таб на пробелы
set expandtab
set nostartofline " many jump commands move the cursor to the first non-blank character of a line
" Игнорировать регистр при поиске
set ignorecase
" Если в поиск используются разные регистры, то не игнорировать регистр
set smartcase
set gdefault
" Автоматический отступ
set autoindent
set copyindent
" и умный автоматический отступ
set smartindent
" Не умещать текст на экране
set nowrap
" Символ показывающий перенос текста
set showbreak=↵
" При поиске переходить на результат по мере набора
set incsearch
" Подсвечивать результаты поиска
set hlsearch
" Сколько строк оставлять при прокрутке с низу и с боку
set scrolljump=4
set scrolloff=4
" Число столбцов отведенное на фолдинг
" set foldcolumn=3
" Подсвечивать парные скобки
set showmatch
" Позволить перемещать курсор после начала и конца строки на предыдущую и
" следующую соответственно.
set whichwrap+=<>[]
" Показывать позицию курсора (номер строки, номер позиции в строке)
set ruler
" Всегда показывать строку статуса
set laststatus=2
" Задать формат статусной строки
set statusline=%<%f\ %h%m%r%y%=%k\ fenc=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
" Начальная директория для просмотра файлов также откуда буфер
set browsedir=buffer
" Размер истории команд
set history=1000
" Изменить действие на <Tab> в режиме команд
set wildmenu    " command-line completion shows a list of matches
" Дополнять по <Tab> до максимально схожей строки, по второму <Tab> выбирать из
" вариантов
set wildmode=list:longest,full
" Не перерисовывать экран пока не выполнится макрос
set lazyredraw
" Не создавать swap файл в текущей директории
set directory-=.
" Язык проверки орфографии по умолчанию
set spelllang=ru,en
set list
if has('gui_running')
	set listchars=tab:»\ ,trail:·,extends:#,nbsp:·
else
	set listchars=tab:>\ ,trail:·,extends:#,nbsp:·
endif
set wildignore=*.swp,*.bak,*.pyc,*.class
set pastetoggle=<F2>
set cursorline
set ttyfast

set undofile
set undodir=$HOME/tmp/vim-undo,$TEMP,.
set backup
set backupdir=$HOME/tmp/vim-backup,$TEMP,.
set directory=$HOME/tmp,$TEMP,.

" Map <Leader> to comma
let mapleader=","

" Autocommands{{{1
if has('autocmd')
	" TODO перенести в ftplugin
	autocmd FileType tex setlocal spell spelllang=ru,en textwidth=79
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType python set expandtab
	autocmd FileType html,xml,ant set nolist
	" Автоматически устанавливать директорию файла как текущую
	autocmd BufEnter * execute ":silent! lcd " . expand("%:p:h")

	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    au BufRead,BufNewFile /etc/nginx/* if &ft == "" | setfiletype nginx | endif
endif
" Mappings {{{1
" Vim rocks!
nnoremap ; :
inoremap jj <ESC>

" Disable some keys
inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

nnoremap / /\v
vnoremap / /\v

" Увеличить шаг прокрутки буфера
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Передвигаться держа курсор в центре по вертикале
"map j jzz
"map k kzz
" Двигать блоки
vnoremap < <gv
vnoremap > >gv
" Friendly moving over wrap lines
nnoremap j gj
nnoremap k gk

" Speedup moving over windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Write file with sudo
cmap w!! w !sudo tee % >/dev/null
" Hide search highlights
nmap <silent> <C-L> :silent nohlsearch<CR>
map gf :e <cfile><CR>

imap <S-Enter> O
imap <C-Enter> o

inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

nnoremap <C-n> :cnext<CR>z.
nnoremap <C-p> :cprevious<CR>z.

" Plugins{{{1
" Surround{{{2
" Surrounds double angle quotes «»
let g:surround_171="« \r »"
let g:surround_187="«\r»"
" Syntastic{{{2
" Set syntastic passive mode
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }

" Taglist{{{2
nnoremap <silent> <F8> :Tlist<CR>

" Fuzzy Finder {{{2
nnoremap '. :FufFileWithCurrentBufferDir<CR>
nnoremap 'f :FufFile<CR>
nnoremap 'k :FufBuffer<CR>

" Load custom local config{{{1
let s:local_vimrc=$MYVIMRC . ".local"
if filereadable(s:local_vimrc)
    silent! execute ':source ' . s:local_vimrc
endif
