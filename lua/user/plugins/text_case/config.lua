require("textcase").setup {}

vim.keymap.set(
  "n",
  "gaa",
  "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>",
  { desc = "Convert to phrase_case" }
)
vim.keymap.set(
  "n",
  "gaf",
  "<cmd>lua require('textcase').current_word('to_path_case')<CR>",
  { desc = "Convert to path_case" }
)
vim.keymap.set(
  "n",
  "gas",
  "<cmd>lua require('textcase').current_word('to_snake_case')<CR>",
  { desc = "Convert to snake_case" }
)
vim.keymap.set(
  "n",
  "gat",
  "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
  { desc = "Convert to title_case" }
)
vim.keymap.set(
  "n",
  "gaz",
  "<cmd>lua require('textcase').current_word('to_dot_case')<CR>",
  { desc = "Convert to dot_case" }
)
