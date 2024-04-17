-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

vim.cmd [[

  command! -buffer -bang Lint compiler bibertool | lmake<bang>
  " command! -buffer -bang Lint compiler bibertool | LMake<bang>
  command! -buffer -range=% -bar AddMissingCommas keeppatterns
        \ <line1>,<line2>substitute:\v([}"])(\s*\n)+(\s*\a+\s*\=):\1,\2\3:giep

  augroup VimTeXBib
    autocmd!
    " autocmd BufWrite <buffer=abuf> compiler bibertool | lmake!
    autocmd BufWrite <buffer=abuf> compiler bibertool | LMake!
    autocmd BufWrite <buffer> exe
        \ 'normal! m`' | silent AddMissingCommas | silent! exe 'normal! g``'
    autocmd QuickFixCmdPost lmake lwindow
    " autocmd QuickFixCmdPost LMake lwindow
  augroup END

]]
