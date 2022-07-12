return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "InsertEnter",
  event = "BufRead",
  config = function() require "user.plugins.lsp_signature.config" end,
}
