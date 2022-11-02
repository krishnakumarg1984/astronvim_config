require("trouble").setup {
  mode = "document_diagnostics",
}
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle diagnostics window" })
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { desc = "Show workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { desc = "Show document diagnostics" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Diagnostics (loc list)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Diagnostics (quickfix list)" })
