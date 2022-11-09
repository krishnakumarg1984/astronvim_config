local kind_icons = require("user.global_vars").kind_icons
-- Jump forwards/backwards with '{' and '}'
-- vim.keymap.set("n", "}", "}", { silent = true })
-- vim.keymap.del("n", "}")
-- vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { desc = "Jump back (outline)" })
-- vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { desc = "Jump fwd (outline)" })
-- Jump up the tree with '[[' or ']]'
vim.keymap.set("n", "]]", "]]", { silent = true })
vim.keymap.del("n", "]]")
vim.keymap.set("n", "[[", "[[", { silent = true })
vim.keymap.del("n", "[[")
-- g = { "<cmd>AerialGo<cr>", "Jump to the Nth symbol" },
-- u = { "<cmd>AerialPrevUp<cr>", "Prev symbol (up 1 level)" },
-- vim.keymap.set("n", "<leader>[", "<cmd>AerialPrevUp<cr>", { desc = "Jump up+back (outline)" })
-- vim.keymap.set("n", "<leader>]", "<cmd>AerialNextUp<cr>", { desc = "Jump up+fwd (outline)" })
-- vim.keymap.set('n', '<C-w>o', '<C-w>o:AerialClose<CR>') -- https://github.com/stevearc/aerial.nvim/issues/99
vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<cr>", { desc = "Toggle outline" })
vim.keymap.set(
  "n",
  "<leader>ac",
  "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>",
  { desc = "Close outline" }
)
vim.keymap.set("n", "<leader>aC", "<cmd>AerialTreeCloseAll<cr>", { desc = "Collapse all" })
vim.keymap.set("n", "<leader>an", "<cmd>AerialNext<cr>", { desc = "Next symbol" })
vim.keymap.set("n", "<leader>aN", "<cmd>AerialNextUp<cr>", { desc = "Next symbol (up 1 level)" })
vim.keymap.set(
  "n",
  "<leader>ao",
  "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>",
  { desc = "Open outline" }
)
vim.keymap.set("n", "<leader>aO", "<cmd>AerialTreeOpenAll<cr>", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>ap", "<cmd>AerialPrev<cr>", { desc = "Prev symbol" })
vim.keymap.set("n", "<leader>aP", "<cmd>AerialPrevUp<cr>", { desc = "Prev symbol (up 1 level)" })
vim.keymap.set("n", "<leader>as", "<cmd>AerialTreeSyncFolds<cr>", { desc = "Sync code folding" })
vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle<cr>", { desc = "Toggle outline & move cursor" })
vim.keymap.set("n", "<leader>aT", "<cmd>AerialTreeToggle!<cr>", { desc = "Toggle folds at location" })

return {
  backends = { "treesitter", "lsp", "markdown" },
  -- min_width = 18,
  layout = {
    min_width = 18,
  },
  icons = kind_icons,
  -- placement_editor_edge = true,
  highlight_on_hover = true, -- Highlight the symbol in the source buffer when cursor is in the aerial win
  open_automatic = function(bufnr)
    return vim.fn.expand "%:t" ~= "init.lua"
      and not vim.opt.diff:get() -- if not in 'diff' mode
      and vim.api.nvim_buf_line_count(bufnr) > 26 -- Enforce a minimum line count
      and require("aerial").num_symbols(bufnr) > 3 -- Enforce a minimum symbol count
      and not require("aerial").was_closed() -- A useful way to keep aerial closed when closed manually
  end,
  on_first_symbols = function(bufnr)
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    if ft == "lua" then require("aerial").tree_set_collapse_level(bufnr, 0) end
  end,
}
