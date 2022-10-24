return {
  -- event = { "BufRead" },
  event = { "BufWinEnter" },
  config = function() require "user.plugins.nvim_lastplace.config" end,
}
