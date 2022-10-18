return {
  -- module = "dap",
  -- after = "neotest",
  keys = { "<F5>", "<F9>", "<leader>dg", "<F10>", "<F11>", "<F12>", "<leader><S-t>d" },
  config = function() require "user.plugins.nvim-dap.config" end,
}
