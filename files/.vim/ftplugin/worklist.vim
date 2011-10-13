setl foldmethod=expr
setl foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
setl textwidth=72
setl spell
setl nonumber
