return {
  -- event = { "CursorHold" },
  wants = { "nvim-lspconfig" },
  event = { "InsertLeave" },
  config = function() require "user.plugins.nvim_dd.config" end,
}
