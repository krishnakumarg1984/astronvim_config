require("overseer").setup {
  -- strategy = "toggleterm",
  -- templates = { "builtin", "user.cpp_build" },
  component_aliases = {
    default = {
      -- These are the default components listed in the README
      -- You probably want to keep them
      { "display_duration", detail_level = 2 },
      "on_output_summarize",
      "on_exit_set_status",
      "on_complete_notify",
      "on_complete_dispose",
      -- This puts the parsed results into the quickfix
      { "on_result_diagnostics_quickfix", open = true },
      -- This puts the parsed results into neovim's diagnostics
      "on_result_diagnostics",
    },
    default_vscode = {
      "default",
      -- "on_output_quickfix",
      "on_result_diagnostics",
      { "on_output_quickfix", open_on_match = true },
      -- { "on_output_quickfix", open = true },
    },
  },
}
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "OverseerRun" })
