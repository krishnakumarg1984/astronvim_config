return {
  tag = "*",
  opt = true,
  setup = function() table.insert(astronvim.git_plugins, "git-conflict.nvim") end,
  config = function() require "user.plugins.git_conflict.config" end,
}
