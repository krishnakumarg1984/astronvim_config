require("lsp-inlayhints").setup()
vim.keymap.set("n", "<leader>lt", "<cmd>lua require('lsp-inlayhints').toggle()<cr>", { desc = "Toggle inlay hints" })
