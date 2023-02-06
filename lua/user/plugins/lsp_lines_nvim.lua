return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- renders diagnostics using virtual lines on top of the real line of code
  keys = { "<leader>ln" },
  config = function()
    local lsp_lines = require "lsp_lines"
    lsp_lines.setup()
    vim.keymap.set("", "<leader>ln", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
  end,
}
