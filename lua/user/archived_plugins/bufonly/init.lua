return {
  keys = { "<leader>bx" },
  cmd = { "BufOnly" },
  config = function() require "user.plugins.bufonly.config" end,
}
