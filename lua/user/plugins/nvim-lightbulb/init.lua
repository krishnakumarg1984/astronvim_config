return {
  wants = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  event = { "CursorHold", "CursorHoldI" },
  config = function() require "user.plugins.nvim-lightbulb.config" end,
}
