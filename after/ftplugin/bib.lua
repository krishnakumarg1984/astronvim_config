vim.cmd[[
  command! -buffer -bang Lint compiler bibertool | lmake<bang>
  command! -buffer -range=% -bar AddMissingCommas keeppatterns
        \ <line1>,<line2>substitute:\v([}"])(\s*\n)+(\s*\a+\s*\=):\1,\2\3:giep

  augroup VimTeX
    autocmd!
    autocmd BufWrite <buffer=abuf> compiler bibertool | lmake!
    autocmd BufWrite <buffer> exe
        \ 'normal! m`' | silent AddMissingCommas | silent! exe 'normal! g``'
    " autocmd QuickFixCmdPost lmake lwindow
  augroup END

]]
