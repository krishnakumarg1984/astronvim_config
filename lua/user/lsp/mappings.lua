-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

return {
  -- normal mode keymaps (((

  n = {
    ["<leader>la"] = { "<cmd>CodeActionMenu<CR>", desc = "Code Action" },
    ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
    ["gl"] = false,
    ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "Symbol references" },

    -- 'trouble.nvim' keymaps (((

    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle diagnostics window" },
    ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", desc = "Open workspace diagnostics" },
    ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", desc = "Open document diagnostics" },
    ["<leader>xl"] = { "<cmd>Trouble loclist<cr>", desc = "Open diagnostics (loclist)" },
    ["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", desc = "Open diagnostics (qflist)" },
    ["gR"] = { "<cmd>Trouble lsp_references<cr>", desc = "Show references (in split)" },

    -- )))

    -- 'text-case.nvim' keymaps (((

    ["gaS"] = { "<Cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>", desc = "To snake case (LSP)" },
    ["ga."] = { "<Cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>", desc = "To dot case (LSP)" },
    ["gaA"] = { "<Cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>", desc = "To phrase case (LSP)" },
    ["gat"] = { "<Cmd>lua require('textcase').lsp_rename('to_title_case')<CR>", desc = "To title case (LSP)" },
    ["gaF"] = { "<Cmd>lua require('textcase').lsp_rename('to_path_case')<CR>", desc = "To path case (LSP)" },

    -- )))
  },
  -- )))
}

-- -- https://www.reddit.com/r/neovim/comments/uri2p4/comment/i8ydfti/?utm_source=share&utm_medium=web2x&context=3
-- local diagnostics_active = true
-- local toggle_diagnostics = function()
--   diagnostics_active = not diagnostics_active
--   if diagnostics_active then
--     vim.diagnostic.show()
--   else
--     vim.diagnostic.hide()
--   end
-- end
-- -- vim.keymap.set("n", "<leader>lt", toggle_diagnostics, { buffer = bufnr, desc = "Toggle diagnostics" })
