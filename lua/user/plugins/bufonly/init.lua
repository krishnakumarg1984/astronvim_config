vim.keymap.set("n", "<leader>bx", "<Cmd>BufOnly<CR>", { desc = "Only current buffer" })
return {
  cmd = { "BufOnly" },
}
