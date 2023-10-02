return {
  after = "nvim-dap",
  config = function()
    require("persistent-breakpoints").setup {
      save_dir = vim.fn.stdpath "data" .. "/nvim_checkpoints",
      -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
      perf_record = false,
    }
    vim.api.nvim_create_autocmd(
      { "BufReadPost" },
      { callback = require("persistent-breakpoints.api").load_breakpoints }
    )
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "<F9>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
    -- C = { "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint(vim.fn.input)<cr>", "Set conditional breakpoint", },
    -- c = { "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", "Clear breakpoints", },
  end,
}
