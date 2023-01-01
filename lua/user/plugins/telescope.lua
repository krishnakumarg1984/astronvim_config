-- need to fix that these mappings are not loaded until telescope has been loaded
vim.keymap.set("n", "<leader>lc", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Callees list" })
vim.keymap.set("n", "<leader>lC", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Callers list" })
-- vim.keymap.set("n", "<leader>lI", "<cmd>Telescope implementations<CR>", { desc = "Implementations" })
vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type definitions" })
vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>lY", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
vim.keymap.set(
  "n",
  "<leader>ly",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
  { desc = "Dynamic workspace symbols" }
)
vim.keymap.set("n", "<leader>f<s-h>", "<cmd>Telescope search_history<cr>", { desc = "Buffer grep history" })
vim.keymap.set("n", "<leader>g<s-c>", "<cmd>Telescope git_bcommits<cr>", { desc = "Checkout buffer commits" })
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Open a vcs-tracked file" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Status (Telescope)" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_stash<cr>", { desc = "Stash all changes" })
-- ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
-- ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "References of current symbol" },
vim.keymap.set("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Autocommands" })
vim.keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>sB", "<cmd>Telescope current_buffer_tags<cr>", { desc = "Tags in current buffer" })
vim.keymap.set("n", "<leader>sC", "<cmd>Telescope colorscheme<cr>", { desc = "Pick colorscheme" })
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find (buffer)" })
vim.keymap.set("n", "<leader>sG", "<cmd>Telescope highlights<cr>", { desc = "Highlight groups" })
vim.keymap.set("n", "<leader>sH", "<cmd>Telescope command_history<cr>", { desc = "Command history" })
vim.keymap.set("n", "<leader>si", "<cmd>Telescope symbols<cr>", { desc = "Icons (emojis/symbols)" })
vim.keymap.set("n", "<leader>sj", "<cmd>Telescope jumplist<cr>", { desc = "Jumplist" })
vim.keymap.set("n", "<leader>sl", "<cmd>Telescope loclist<cr>", { desc = "Location list" })
vim.keymap.set("n", "<leader>sL", "<cmd>Telescope reloader<cr>", { desc = "Reloader" })
vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Projects" })
vim.keymap.set("n", "<leader>sP", "<cmd>Telescope spell_suggest<cr>", { desc = "Spell suggest" })
vim.keymap.set("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>sQ", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix history" })
vim.keymap.set("n", "<leader>sR", "<cmd>Telescope resume<cr>", { desc = "Resume last" })
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope treesitter<cr>", { desc = "Outline symbols" })
vim.keymap.set("n", "<leader>sS", "<cmd>Telescope luasnip<cr>", { desc = "Code snippets" })
vim.keymap.set("n", "<leader>st", "<cmd>Telescope tags<cr>", { desc = "Tags in project" })
vim.keymap.set("n", "<leader>sT", "<cmd>Telescope tagstack<cr>", { desc = "Tagstack" })
vim.keymap.set("n", "<leader>sv", "<cmd>Telescope vim_options<cr>", { desc = "Vim options" })
vim.keymap.set("n", "<leader>sy", "<cmd>Telescope filetypes<cr>", { desc = "Choose filetype" })
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
