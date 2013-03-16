if exists('b:did_indent')
  let s:did_indent=b:did_indent
  unlet b:did_indent
endif
exe 'runtime! indent/xml.vim'
if exists('s:did_indent')
  let b:did_indent=s:did_indent
endif
 
setlocal indentexpr=GetXhpIndent()
setlocal indentkeys=0{,0},0),:,!^F,o,O,e,*<Return>,=?>,=<?,=*/
setlocal indentkeys+=<>>,<<>,/,{,}
 
fu! GetXhpIndent()
  let ind = GetPhpIndent()
  let lnum = prevnonblank(v:lnum - 1)
  let prevsyn = synIDattr(synID(lnum, strlen(getline(lnum)) - 1, 1), 'name')
 
  if ind == -1
    if prevsyn =~ 'xml' || prevsyn =~ 'xhp'
      let ind = XmlIndentGet(v:lnum,0)
      if getline(v:lnum) =~? '^\s*\/>\s*;\='
        let ind = ind - &sw
      endif
    else
      let ind = indent(v:lnum)
    endif
  endif
 
  return ind
endfu
