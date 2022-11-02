-- local null_ls = require('null-ls')
require("crates").setup {
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  },
}

vim.keymap.set("n", "<leader>Ct", "<cmd>lua require('crates').toggle()<CR>", { desc = "Toggle crates" })
vim.keymap.set("n", "<leader>Cr", "<cmd>lua require('crates').reload()<CR>", { desc = "Reload crates" })
vim.keymap.set("n", "<leader>Cv", "<cmd>lua require('crates').show_versions_popup()<CR>", { desc = "Show versions" })
vim.keymap.set("n", "<leader>Cf", "<cmd>lua require('crates').show_features_popup()<CR>", { desc = "Show features" })
vim.keymap.set(
  "n",
  "<leader>Cd",
  "<cmd>lua require('crates').show_dependencies_popup()<CR>",
  { desc = "Show dependencies" }
)
vim.keymap.set({ "n", "v" }, "<leader>Cu", "<cmd>lua require('crates').update_crate()<CR>", { desc = "Update crate" })
vim.keymap.set("n", "<leader>Ca", "<cmd>lua require('crates').update_all_crates()<CR>", { desc = "Update all crates" })
vim.keymap.set("n", "<leader>CU", "<cmd>lua require('crates').upgrade_crate()<CR>", { desc = "Upgrade crate" })
vim.keymap.set(
  "v",
  "<leader>CU",
  "<cmd>lua require('crates').upgrade_crates()<CR>",
  { desc = "Upgrade selected crates" }
)
vim.keymap.set(
  "n",
  "<leader>CA",
  "<cmd>lua require('crates').upgrade_all_crates()<CR>",
  { desc = "Upgrade all crates" }
)
vim.keymap.set("n", "<leader>CH", "<cmd>lua require('crates').open_homepage()<CR>", { desc = "Open crate homepage" })
vim.keymap.set(
  "n",
  "<leader>CR",
  "<cmd>lua require('crates').open_repository()<CR>",
  { desc = "Open crate repository" }
)
vim.keymap.set(
  "n",
  "<leader>CD",
  "<cmd>lua require('crates').open_documentation()<CR>",
  { desc = "Open crate documentation" }
)
vim.keymap.set("n", "<leader>CC", "<cmd>lua require('crates').open_crates_io()<CR>", { desc = "Open in crates.io" })
