return {
  -- event = { "BufRead" },
  event = { "BufWinEnter" },
  config = function() require "user.plugins.nvim-lastplace.config" end,
}
