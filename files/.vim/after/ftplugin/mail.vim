set spell
set expandtab
set nonumber
set imsearch=1
set iminsert=1
set colorcolumn=+1

" par options
"
" e[expel]
"
"       If expel is 1, superfluous lines are withheld from the output  .
"       Defaults to 0                                                  .
"
" g[guess]
"
"       If guess is 1, then when par is choosing line breaks, whenever
"       it encounters a curious word followed by a capitalized word, it
"       takes one of two special actions. If the two words are separated
"       by a single space in the input, they will be merged into one
"       word with an embedded non-breaking space. If the two words are
"       separated by more than one space, or by a line break, par will
"       insure that they are separated by two spaces, or by a line
"       break, in the output. Defaults to 0.
"
" q[quote]
"
"       If quote is 1, then before each segment is scanned for bodiless
"       lines, par supplies vacant lines between different quotation
"       nesting levels as follows: For each pair of adjacent lines in
"       the segment, (scanned from the top down) which have different
"       quoteprefixes, one of two actions is taken. If invis is 0, and
"       either line consists entirely of quote characters and spaces
"       (or is empty), that line is truncated to the longest common
"       prefix of the two lines (both are truncated if both qualify).
"       Otherwise, a line consisting of the longest common prefix of
"       the two lines is inserted between them. quote also affects the
"       default value of prefix. Defaults to 0. (See also the p and i
"       options.)
"
vmap <F4> :!par 72qeg<CR>gv:s/\v\s*$//<CR>:nohl<CR>

function! <SID>DeleteTrailingWhitespace()
    if ! &binary
        let l:l = line('.')
        let l:c = col('.')
        silent! :%s/[\r \t]\+$//
        call histdel('search', -1)
        call cursor(l:l, l:c)
    endif
endfunction
autocmd BufWritePre,FileWritePre * call <SID>DeleteTrailingWhitespace()
