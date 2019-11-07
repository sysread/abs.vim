" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif

let b:did_ftplugin = 1

setlocal expandtab
setlocal ts=4
setlocal sw=4
setlocal sts=4

setlocal suffixesadd=.abs
setlocal makeprg=abs

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif
