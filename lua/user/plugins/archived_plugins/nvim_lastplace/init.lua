return {
  -- event = { "BufRead" }, event = { "BufWinEnter" },
  opt = true,
  setup = function() table.insert(astronvim.file_plugins, "nvim-lastplace") end,
  config = function() require "user.plugins.nvim_lastplace.config" end,
}
