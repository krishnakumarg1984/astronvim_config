-- vim.keymap.set("n", "<leader>la", "<leader>la", { desc = "Code action(s)" })
-- vim.keymap.del("n", "<leader>la")
vim.keymap.set("n", "<leader>la", "<cmd>CodeActionMenu<CR>", { desc = "Code action(s)" })
return {
  cmd = "CodeActionMenu",
  -- config = function() require "user.plugins.nvim_code_action_menu.config" end,
}
