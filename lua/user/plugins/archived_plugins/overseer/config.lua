require("overseer").setup {
  print "hi from overseer setup",
  component_aliases = {
    default = {
      -- These are the default components listed in the README
      -- You probably want to keep them
      "on_output_summarize",
      "on_exit_set_status",
      "on_complete_notify",
      "on_complete_dispose",
      -- This puts the parsed results into the quickfix
      { "on_result_diagnostics_quickfix", open = true },
      -- This puts the parsed results into neovim's diagnostics
      "on_result_diagnostics",
    },
  },
}
