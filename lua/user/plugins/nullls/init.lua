return {
  wants = "mason-lspconfig.nvim", -- To prevent null-ls from failing to read buffer
  config = function() require "user.plugins.nullls.config" end,
}
