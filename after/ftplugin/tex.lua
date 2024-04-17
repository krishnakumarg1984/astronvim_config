-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

if vim.fn.executable "blacktex" == 1 then
  vim.keymap.set("n", "<leader>vB", "my<cmd>%! blacktex %<CR>`y", { desc = "Blacktex (strip comments)" })
  vim.keymap.set("n", "<leader>vb", "mz<cmd>%! blacktex --keep-comments %<CR>`z", { desc = "Blacktex (keep comments)" })
end

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
