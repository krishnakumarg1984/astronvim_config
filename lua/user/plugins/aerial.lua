local kind_icons = require("user.global_vars").kind_icons
return {
  backends = { "treesitter", "lsp", "markdown" },
  min_width = 18,
  icons = kind_icons,
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "}", "}", { silent = true })
    vim.keymap.del("n", "}")
    vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { buffer = bufnr, desc = "Jump backwards in Aerial" })
    vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { buffer = bufnr, desc = "Jump forwards in Aerial" })
    -- Jump up the tree with '[[' or ']]'
    vim.keymap.set("n", "]]", "]]", { silent = true })
    vim.keymap.del("n", "]]")
    vim.keymap.set("n", "[[", "[[", { silent = true })
    vim.keymap.del("n", "[[")
    vim.keymap.set(
      "n",
      "<leader>[",
      "<cmd>AerialPrevUp<cr>",
      { buffer = bufnr, desc = "Jump up and backwards in Aerial" }
    )
    vim.keymap.set(
      "n",
      "<leader>]",
      "<cmd>AerialNextUp<cr>",
      { buffer = bufnr, desc = "Jump up and forwards in Aerial" }
    )
    -- vim.keymap.set('n', '<C-w>o', '<C-w>o:AerialClose<CR>') -- https://github.com/stevearc/aerial.nvim/issues/99
  end,
  placement_editor_edge = true,
  close_behavior = "global",
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
