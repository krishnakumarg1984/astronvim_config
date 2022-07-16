return {
  -- https://github.com/wbthomason/packer.nvim/issues/810
  -- requires = { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" }, -- make sure to load after lsp stuff
  ft = { "c", "cpp", "cuda", "opencl" },
  wants = { "nvim-lsp-installer", "nvim-lspconfig" }, -- make sure to load after lsp stuff
  config = function() require "user.plugins.clangd_extensions.config" end,
}
