return {
  "johmsalas/text-case.nvim", -- An all in one plugin for converting text case
  keys = { { "ga", "ga", desc = "Text case ..." } },
  config = function()
    require("textcase").setup {}

    vim.keymap.set(
      { "n", "o", "v", "x" },
      "gaa",
      "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>",
      { desc = "Convert to phrase case" }
    )
    vim.keymap.set(
      { "n", "o", "v", "x" },
      "gaf",
      "<cmd>lua require('textcase').current_word('to_path_case')<CR>",
      { desc = "Convert to path case" }
    )
    vim.keymap.set(
      { "n", "o", "v", "x" },
      "gas",
      "<cmd>lua require('textcase').current_word('to_snake_case')<CR>",
      { desc = "Convert to snake case" }
    )
    vim.keymap.set(
      { "n", "o", "v", "x" },
      "gat",
      "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
      { desc = "Convert to title case" }
    )
    vim.keymap.set(
      { "n", "o", "v", "x" },
      "gaz",
      "<cmd>lua require('textcase').current_word('to_dot_case')<CR>",
      { desc = "Convert to dot case" }
    )
    vim.keymap.set(
      { "n", "v", "o" },
      "gaA",
      "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>",
      { desc = "LSP rename to phrase_case" }
    )
    vim.keymap.set(
      { "n", "v", "o" },
      "gaF",
      "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>",
      { desc = "LSP rename to path_case" }
    )
    vim.keymap.set(
      { "n", "v", "o" },
      "gaS",
      "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>",
      { desc = "LSP rename to snake_case" }
    )
    vim.keymap.set(
      { "n", "v", "o" },
      "gaT",
      "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>",
      { desc = "LSP rename to title_case" }
    )
    vim.keymap.set(
      { "n", "v", "o" },
      "gaZ",
      "<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>",
      { desc = "LSP rename to dot_case" }
    )
  end,
}
