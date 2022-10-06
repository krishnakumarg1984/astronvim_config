-- add to the global LSP on_attach function
return function(client, bufnr)
  -- if vim.tbl_contains({ "ccls", "clangd", "jsonls", "pylsp", "taplo" }, client.name) then
  --   astronvim.lsp.disable_formatting(client)
  -- end

  vim.keymap.set("n", "<leader>la", "<cmd>CodeActionMenu<CR>", { buffer = bufnr, desc = "Code Action" })
  -- vim.keymap.del("n", "gd", { buffer = bufnr })
  -- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition(s)", buffer = bufnr })
  vim.keymap.set(
    "n",
    "gr",
    "<cmd>Telescope lsp_references<cr>",
    { desc = "References of current symbol", buffer = bufnr }
  )
  vim.keymap.set("n", "gl", "gl")
  vim.keymap.del("n", "gl")

  -- 'trouble.nvim' keymaps (((

  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
  vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
  vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
  vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
  vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
  vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>")

  -- )))

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
