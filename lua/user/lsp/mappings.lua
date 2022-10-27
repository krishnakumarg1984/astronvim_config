-- easily add or disable built in mappings added during LSP attaching
return {
  n = {
    ["gl"] = false, -- disable formatting keymap
    ["<leader>la"] = { "<cmd>CodeActionMenu<CR>", desc = "Code Action" },
    ["<leader>lc"] = { "<cmd>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing calls" },
    ["<leader>lC"] = { "<cmd>Telescope lsp_incoming_calls<CR>", desc = "Incoming calls" },
    ["<leader>lI"] = { "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
    ["<leader>xx"] = "<cmd>TroubleToggle<cr>",
    ["<leader>xw"] = "<cmd>Trouble workspace_diagnostics<cr>",
    ["<leader>xd"] = "<cmd>Trouble document_diagnostics<cr>",
    ["<leader>xl"] = "<cmd>Trouble loclist<cr>",
    ["<leader>xq"] = "<cmd>Trouble quickfix<cr>",
    -- ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
    -- ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "References of current symbol" },
    ["gR"] = "<cmd>Trouble lsp_references<cr>",
  },
}
