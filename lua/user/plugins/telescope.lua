-- need to fix that these mappings are not loaded until telescope has been loaded
vim.keymap.set("n", "<leader>lc", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Callees list" })
vim.keymap.set("n", "<leader>lC", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Callers list" })
vim.keymap.set("n", "<leader>lI", "<cmd>Telescope implementations<CR>", { desc = "Implementations" })
vim.keymap.set("n", "<leader>f<s-h>", "<cmd>Telescope search_history<cr>", { desc = "Buffer grep history" })
vim.keymap.set("n", "<leader>g<s-c>", "<cmd>Telescope git_bcommits<cr>", { desc = "Checkout buffer commits" })
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Open a vcs-tracked file" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Status (Telescope)" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_stash<cr>", { desc = "Stash all changes" })
-- ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
-- ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "References of current symbol" },
return {
  -- https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/telescope.lua
  defaults = {
    -- winblend = 30,
    -- border = true,
    file_ignore_patterns = {
      "%.zip$",
      "%.tar$",
      "%.tar.gz$",
      "%.so$",
      "%.a$",
      "%.fasl$",
      "%.pyc$",
      "%.whl$",
      "%.bin$",
      "%.db$",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    diagnostics = { theme = "dropdown" },
    -- diagnostics = { layout = { "vertical" } },
    git_status = { theme = "ivy" },
  },
}
