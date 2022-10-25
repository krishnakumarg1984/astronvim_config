local lsp_lines = require "lsp_lines"
lsp_lines.setup {}
vim.keymap.set("", "<Leader>ll", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
