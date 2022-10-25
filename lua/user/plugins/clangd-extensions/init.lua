return {
  -- https://github.com/wbthomason/packer.nvim/issues/810
  ft = { "c", "cpp", "cuda", "opencl" },
  wants = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  config = function() require "user.plugins.clangd-extensions.config" end,
}
