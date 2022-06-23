return function(client, bufnr)
  if vim.tbl_contains({ "clangd", "taplo", "pylsp" }, client.name) then
    astronvim.lsp.disable_formatting(client)
  end
  vim.keymap.set("n", "<leader>la", "<cmd>CodeActionMenu<CR>", { buffer = bufnr, desc = "Code Action" })
  vim.keymap.del("n", "gd", { buffer = bufnr })
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition(s)", buffer = bufnr })
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

  vim.cmd [[
      " nnoremap gau :lua require('textcase').lsp_rename('to_upper_case')<CR>
      " nnoremap gal :lua require('textcase').lsp_rename('to_lower_case')<CR>
      nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
      " nnoremap gad :lua require('textcase').lsp_rename('to_dash_case')<CR>
      " nnoremap gan :lua require('textcase').lsp_rename('to_constant_case')<CR>
      " nnoremap ga. :lua require('textcase').lsp_rename('to_dot_case')<CR>
      nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
      " nnoremap gac :lua require('textcase').lsp_rename('to_camel_case')<CR>
      " nnoremap gap :lua require('textcase').lsp_rename('to_pascal_case')<CR>
      " nnoremap gat :lua require('textcase').lsp_rename('to_title_case')<CR>
      nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>
      ]]

  -- )))

  -- https://www.reddit.com/r/neovim/comments/uri2p4/comment/i8ydfti/?utm_source=share&utm_medium=web2x&context=3
  local diagnostics_active = true
  local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.show()
    else
      vim.diagnostic.hide()
    end
  end
  vim.keymap.set("n", "<leader>lt", toggle_diagnostics, { buffer = bufnr, desc = "Toggle diagnostics" })

  -- if client.name == "pyright" then
  --   require("folding").on_attach()
  -- end
end
