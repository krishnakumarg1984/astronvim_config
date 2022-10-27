-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
-- add to the global LSP on_attach function
return function(client, bufnr)
  -- 'text-case.nvim' keymaps (((

  vim.keymap.set(
    { "n", "v", "o" },
    "gaA",
    "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>",
    { desc = "LSP rename to phrase_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaF",
    "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>",
    { desc = "LSP rename to path_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaS",
    "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>",
    { desc = "LSP rename to snake_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaT",
    "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>",
    { desc = "LSP rename to title_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaZ",
    "<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>",
    { desc = "LSP rename to dot_case" }
  )

  -- )))
end
