vim.cmd [[

  command! -buffer -bang Lachecklint compiler lacheck | lmake<bang>
  command! -buffer -bang Chktexlint compiler chktex | lmake<bang>
  " command! -buffer -bang Lint compiler lacheck | LMake<bang>

  " augroup VimTeXlacheck
  "   autocmd!
  "   " autocmd BufWrite <buffer=abuf> compiler lacheck | lmake!
  "   " autocmd BufWrite <buffer=abuf> compiler lacheck | LMake!
  "   autocmd QuickFixCmdPost lmake lwindow
  "   " autocmd QuickFixCmdPost LMake lwindow
  " augroup END

]]
