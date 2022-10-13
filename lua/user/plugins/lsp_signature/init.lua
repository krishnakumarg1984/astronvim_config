return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "BufRead",
  -- ft = { "c", "cpp", "cuda", "cmake", "lua", "opencl", "sh", "perl", "python", "rust", "yaml" },
  wants = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
  event = "InsertEnter",
  config = function() require "user.plugins.lsp_signature.config" end,
}
