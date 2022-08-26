-- overrides `require("treesitter").setup(...)`
return {
  wants = "mason-lspconfig.nvim", -- To prevent null-ls from failing to read buffer
  config = function() require "user.plugins.null-ls.config" end,
}
