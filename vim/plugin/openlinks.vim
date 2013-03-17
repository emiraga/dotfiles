function! SendCommand(cmd, param)
  let cmd = 'echo '.a:cmd.' '.shellescape(a:param).' | nc localhost 52698'
  call system(cmd)

  if (0 != v:shell_error)
    echoerr 'Error executing command!'
    return v:shell_error
  endif
  return 0
endfunction

function! Google(term)
  call SendCommand('google', a:term)
endfunction
command! -nargs=* Google call Google("<args>")

function! Youtube()
  call SendCommand('link', 'http://www.youtube.com/feed/subscriptions')
endfunction
command! -nargs=* Youtube call Youtube()

function! HN()
  call SendCommand('link', 'http://news.ycombinator.com/')
endfunction
command! -nargs=* HN call HN()
command! -nargs=* Hn call HN()

function! Lol(term)
  call SendCommand('lol', term)
endfunction
command! -nargs=* Lol call Lol("<args>")
command! -nargs=* LOL call Lol("<args>")

function! Refresh()
  update
  call SendCommand('refresh', '')
endfunction
command! -nargs=* R call Refresh()
command! -nargs=* Refresh call Refresh()

