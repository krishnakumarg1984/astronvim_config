return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "BufRead",
  -- ft = { "c", "cpp", "cuda", "cmake", "lua", "opencl", "sh", "perl", "python", "rust", "yaml" },
  after = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  -- event = "InsertEnter",
  config = function() require "user.plugins.lsp_signature_nvim.config" end,
}
