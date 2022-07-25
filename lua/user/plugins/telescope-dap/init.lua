return {
  -- wants = { "telescope.nvim", "nvim-dap" },
  after = "nvim-dap",
  config = function() require "user.plugins.telescope-dap.config" end,
}
