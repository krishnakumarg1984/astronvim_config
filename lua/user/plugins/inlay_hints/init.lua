return {
  -- ft = { "go", "lua", "rust" },
  module = "inlay-hints",
  wants = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
  -- config = function() require "user.plugins.inlay_hints.config" end,
  config = function() require("inlay-hints").setup {} end,
}
