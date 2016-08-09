" vim: spell foldmethod=marker :

" Setup & Plugins {{{

" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {{{

Plugin 'VundleVim/Vundle.vim'

" Library for other plugins
Plugin 'https://github.com/vim-scripts/L9.git'

" Git inside vim
Plugin 'https://github.com/tpope/vim-fugitive.git'

" Intelligent date inc/dec
Plugin 'https://github.com/tpope/vim-speeddating'
" Show colors in CSS format
Plugin 'https://github.com/ap/vim-css-color'
" Load project .vimrc files
Plugin 'https://github.com/MarcWeber/vim-addon-local-vimrc'
" Fuzzy finder
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
" Finder
Plugin 'https://github.com/vim-scripts/FuzzyFinder.git'
" Solarized colorscheme
Plugin 'https://github.com/altercation/vim-colors-solarized'
" Zen codding
Plugin 'https://github.com/mattn/emmet-vim.git'
" Code snippets
Plugin 'https://github.com/msanders/snipmate.vim'
" Silversearch plugin
Plugin 'https://github.com/rking/ag.vim'
" Support dot command for plugins
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/tpope/vim-surround.git'
" Files tree plugin
Plugin 'https://github.com/scrooloose/nerdtree'
" Commenting text
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/raimondi/delimitmate'
" Syntax check and linting
Plugin 'https://github.com/scrooloose/syntastic.git'
" Text alignment commands
Plugin 'https://github.com/godlygeek/tabular'
" Pasting in vim
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste'
" File templates
Plugin 'https://github.com/aperezdc/vim-template'
" Code browser
Plugin 'https://github.com/vim-scripts/taglist.vim'

" File types

" Ledger
Plugin 'https://github.com/ledger/vim-ledger'
" Nginx
Plugin 'https://github.com/evanmiller/nginx-vim-syntax.git'
" Jade templates
Plugin 'https://github.com/digitaltoad/vim-jade.git'
" Markdown
Plugin 'https://github.com/plasticboy/vim-markdown.git'
" TypeScript
Plugin 'https://github.com/HerringtonDarkholme/yats.vim'
" Orgmode
Plugin 'https://github.com/jceb/vim-orgmode'

"Plugin 'https://github.com/othree/xml.vim'
"Plugin 'https://github.com/terryma/vim-multiple-cursors'
"Plugin 'https://github.com/motemen/git-vim'

" }}}
call vundle#end()
filetype plugin indent on
syntax on

" }}}
" Options {{{

" Locale {{{

language C
set encoding=utf-8
" Encodings try list
if has("multi_byte")
    set fileencodings=ucs-bom,utf-8,cp1251,koi8-r,cp866
endif
set keymap=russian-jcukenwin
set spelllang=ru,en
set iminsert=0
set imsearch=0

" }}}

set autoread
set visualbell t_vb=
set title
" Скрывать буфер редактировании другого
set hidden
" Отображать текущую команду
set showcmd
" По умолчанию пользоваться :help справкой
set keywordprg=
set omnifunc=syntaxcomplete#Complete

runtime! macros/matchit.vim
set virtualedit+=block
set backspace=indent,eol,start
" Показывать столбец с номерами строк
set number
set nostartofline " many jump commands move the cursor to the first non-blank character of a line
" Символ показывающий перенос текста
set showbreak=↵
" Сколько строк оставлять при прокрутке с низу и с боку
set scrolljump=4
set scrolloff=4
" Число столбцов отведенное на фолдинг
" set foldcolumn=3
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
set wildignore=*.swp,*.bak,*.pyc,*.class
set pastetoggle=<F3>
set cursorline
set ttyfast
set mouse=a

set autoindent
set smartindent

set splitright
set splitbelow

" Tuneup delays when using escape key
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=10



" List chars {{{

set list
set listchars=tab:»\ ,trail:·,extends:#,nbsp:·

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
augroup END

" }}}

" Tabs and formatting {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set shiftround
set expandtab
set wrap
set linebreak
set textwidth=80
set formatoptions=rqnl1j
set cpoptions+=J

" }}}

let mapleader=","
let maplocalleader="\\"

" Color scheme {{{

if &t_Co < 16
    set t_Co=16
endif
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=light
colorscheme solarized

" }}}

digraphs ru 8381

" }}}
" Backup {{{

set backup
set noswapfile
set undofile

set undodir=$HOME/tmp/vim/undo//
set backupdir=$HOME/tmp/vim/backup//
set directory=$HOME/tmp/vim/swap//

" Make directories
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" Search {{{

set gdefault
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

nnoremap / /\v
vnoremap / /\v
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
noremap <Leader><Space> :silent nohlsearch<CR>

" Visual mode search {{{

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><C-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><C-o>

" }}}

" }}}
" Autocommands {{{
if has('autocmd')
    " Cursor line only in current window and not insert mode
    au WinEnter    * set cursorline
    au WinLeave    * set nocursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline

	" TODO перенести в ftplugin
	autocmd FileType tex setlocal spell textwidth=79
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType python set expandtab
	autocmd FileType html,xml,ant set nolist

    au BufReadPost * if line("'\.") > 0 && line("'\.") <= line("$") | exe 'normal g`.zvzz' | endif
    au BufRead,BufNewFile /etc/nginx/* if &ft == "" | setfiletype nginx | endif
    au BufReadPost *.ledger norm G

    " Set scripts to be executable from shell
    "au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod +x <afile> | endif
    au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent exec "!chmod +x <afile>" | endif
endif
" }}}
" Mappings {{{
" Vim rocks!
nnoremap ; :
inoremap kk <ESC>
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap H ^
nnoremap L g_
inoremap <Leader>l <C-^>

nnoremap J mzJ`z

nnoremap <Leader>n :setlocal number!<cr>
nnoremap <Leader>s :setlocal spell!<cr>
nnoremap <Leader>w :setlocal wrap!<cr>
nnoremap <Leader>l :setlocal list!<cr>

nnoremap <Leader>p :silent! set paste<CR>"*p:set nopaste<CR>
vnoremap <Leader>y "*y

" Disable keys {{{

inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" }}}

nnoremap <Space> za
vnoremap <Space> za

nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Увеличить шаг прокрутки буфера
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Передвигаться держа курсор в центре по вертикале
"map j jzz
"map k kzz
" Двигать блоки
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>V V`]

" Wrapped lines navigation {{{

nnoremap j gj
nnoremap k gk

nnoremap g$ $
nnoremap $ g$
nnoremap g0 0
nnoremap 0 g0
nnoremap g^ ^
nnoremap ^ g^
vnoremap g$ $
vnoremap $ g$
vnoremap g0 0
vnoremap 0 g0
vnoremap g^ ^
vnoremap ^ g^

" }}}

" Speedup moving over windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open current buffer in new tab
noremap <C-w><CR> :tab sp<CR>

" Write file with sudo
cmap w!! w !sudo tee % >/dev/null
map gf :e <cfile><CR>

inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

nnoremap <C-n> :cnext<CR>z.
nnoremap <C-p> :cprevious<CR>z.

" Quick editing {{{

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" }}}

" }}}
" Filetype {{{
" XML {{{

augroup ft_xml
    au!
    au FileType xml nnoremap <buffer> <localleader>z Vatzf
    au FileType xml vnoremap <buffer> <localleader>z zf
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" Ledger {{{
augroup ft_ledger
    au!
    au FileType ledger inoremap <silent><buffer> <Leader>e <Esc>:call ledger#entry()<CR>
    au FileType ledger noremap = :LedgerAlign<CR>
augroup END
" }}}
" Org {{{
augroup ft_org
    au!
    au FileType org setlocal spell nolist tabstop=2 shiftwidth=2
augroup END
" }}}
" QuickFix {{{
augroup ft_qf
    au!
    au FileType qf set nowrap
augroup END
" }}}
" }}}
" Plugins {{{
" Surround {{{

" Surrounds double angle quotes «»
let g:surround_171="« \r »"
let g:surround_187="«\r»"

" }}}
" Syntastic {{{
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump = 0
"let g:syntastic_java_checker = 'javac'
let g:syntastic_mode_map = {
            \ 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java']
            \ }

nnoremap <Leader>C :SyntasticCheck<CR>

" }}}
" Taglist {{{

nnoremap <silent> <F8> :Tlist<CR>

" }}}
" Fuzzy Finder {{{

nnoremap '. :FufFileWithCurrentBufferDir<CR>
nnoremap 'f :FufFile<CR>
nnoremap 'h :FufFile $HOME/<CR>
nnoremap 'k :FufBuffer<CR>

" }}}
" NERD Tree {{{

noremap <F2> :NERDTreeToggle<CR>
noremap <F2> <Esc>:NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer=1

let NERDTreeIgnore = [ '\.pyc$' ]

" }}}
" Scratch {{{

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "norm! :Sscratch\<cr>\<c-w>l"
        let w:is_scratch_window = 1
    endif
endfunction
command! ScratchToggle call ScratchToggle()

nnoremap <silent> <Leader><Tab> :ScratchToggle<cr>

" }}}
" Tabular {{{

function! TabularizeUnderCursos()
    let ch = getline(".")[col(".") - 1]
    call Tabularize('/\V' . ch)
endfunction
nnoremap <silent> <Leader>T :call TabularizeUnderCursos()<cr>

" }}}
" Emmet {{{

let g:user_emmet_expandabbr_key = '<C-e>'

" }}}
" delimitMate {{{

let delimitMate_expand_cr = 1
au FileType html let b:delimitMate_matchpairs="(:),[:],{:}"

" }}}
" Template {{{

let g:templates_directory=$HOME . "/.vim/templates"

" }}}
" }}}
" Load custom local config {{{

let s:local_vimrc=$MYVIMRC . ".local"
if filereadable(s:local_vimrc)
    silent! execute ':source ' . s:local_vimrc
endif

" }}}
