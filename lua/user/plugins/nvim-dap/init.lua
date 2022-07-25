return {
  -- module = "dap",
  keys = { "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<leader>dg", "<F10>", "<F11>", "<F12>" },
  config = function() require "user.plugins.nvim-dap.config" end,
}
