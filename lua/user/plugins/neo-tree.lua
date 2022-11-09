vim.keymap.set("n", "<leader>bb", "<Cmd>Neotree buffers<CR>", { desc = "Show opened buffers in tree" })
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
