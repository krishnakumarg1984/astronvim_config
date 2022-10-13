return {
  ft = {
    "c",
    "cmake",
    "cpp",
    "cuda",
    "lua",
    "markdown",
    "opencl",
    "perl",
    "python",
    "rust",
    "sh",
    "yaml",
  },
  -- module = "lsp_lines",
  wants = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  config = function() require "user.plugins.lsplines_nvim.config" end,
}
