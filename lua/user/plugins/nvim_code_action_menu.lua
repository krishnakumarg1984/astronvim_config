vim.keymap.set("n", "<leader>lc", "<cmd>CodeActionMenu<CR>", { desc = "Code action(s)" })
return {
  "weilbith/nvim-code-action-menu", -- Pop-up menu for code actions to show meta-information and diff preview
  -- cmd = "CodeActionMenu",
  lazy = false,
  -- keys = { "<leader>lc", "<cmd>CodeActionMenu<CR>", desc = "Code action(s)" },
}
