return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "InsertEnter",
  -- event = "BufRead",
  ft = { "c", "cpp", "cuda", "cmake", "lua" },
  config = function() require "user.plugins.lsp_signature.config" end,
}
