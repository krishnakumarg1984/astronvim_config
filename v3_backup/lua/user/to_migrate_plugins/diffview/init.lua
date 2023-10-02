vim.keymap.set("n", "<leader>g<s-d>", "<cmd>DiffviewOpen<cr>", { desc = "Git Diff (interactive)" })
return {
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
}
