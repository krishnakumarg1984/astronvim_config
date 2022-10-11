return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "InsertEnter",
  -- event = "BufRead",
  ft = { "c", "cpp", "cuda", "cmake", "lua" ,"opencl", "sh", "perl", "python", "rust", "yaml"},
  config = function() require "user.plugins.lsp_signature.config" end,
}
