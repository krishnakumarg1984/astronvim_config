return {
  -- ft = { "rust" },
  after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
  config = function() require "user.plugins.rust_tools.config" end,
}
