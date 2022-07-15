return {
  -- after = "nvim-cmp",
  -- event = "InsertCharPre",
  -- event = "InsertEnter",
  -- event = "BufRead",
  ft = require("user.global_vars").lsp_servers,
  config = function() require "user.plugins.lsp_signature.config" end,
}
