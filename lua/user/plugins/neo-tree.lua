vim.keymap.set("n", "<leader>bb", "<Cmd>Neotree buffers<CR>", { desc = "Show opened buffers in tree" })
vim.keymap.set("n", "<leader>g<s-s>", "<cmd>Neotree git_status<cr>", { desc = "Status (dashboard)" })
return {
  -- sort_case_insensitive = true, -- used when sorting files and directories in the tree
  default_component_configs = {
    -- container = {
    --   enable_character_fade = false,
    -- },
    indent = {
      padding = 2,
    },
  },
  enable_diagnostics = true,
}
