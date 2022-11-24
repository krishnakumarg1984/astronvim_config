local lsp_lines = require "lsp_lines"
lsp_lines.setup {}
vim.keymap.set("", "<leader>ln", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
