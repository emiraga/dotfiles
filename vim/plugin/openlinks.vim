function! OpenLinksSendCommand(cmd, param)
  let cmd = 'echo '.a:cmd.' '.shellescape(a:param).' | nc localhost 52698'
  call system(cmd)

  if (0 != v:shell_error)
    echoerr 'Error executing command!'
    return v:shell_error
  endif
  return 0
endfunction

function! OpenLinksGoogle(term)
  call OpenLinksSendCommand('google', a:term)
endfunction
command! -nargs=* Google call OpenLinksGoogle("<args>")

function! OpenLinksYoutube()
  call OpenLinksSendCommand('link', 'http://www.youtube.com/feed/subscriptions')
endfunction
command! -nargs=* Youtube call OpenLinksYoutube()

function! OpenLinksHN()
  call OpenLinksSendCommand('link', 'http://news.ycombinator.com/')
endfunction
command! -nargs=* HN call OpenLinksHN()
command! -nargs=* Hn call OpenLinksHN()

function! OpenLinksLol(term)
  call OpenLinksSendCommand('lol', a:term)
endfunction
command! -nargs=* Lol call OpenLinksLol("<args>")
command! -nargs=* LOL call OpenLinksLol("<args>")

function! OpenLinksRefresh()
  argdo update
  call OpenLinksSendCommand('refresh', '')
endfunction
command! -nargs=* R call OpenLinksRefresh()
command! -nargs=* Refresh call OpenLinksRefresh()

