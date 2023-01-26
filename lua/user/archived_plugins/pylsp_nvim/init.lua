return {
  ft = "python",
  wants = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  config = function() require "user.plugins.pylsp_nvim.config" end,
}
