return {
  after = "nvim-cmp",
  -- opt = true,
  -- setup = function() table.insert(astronvim.git_plugins, "cmp-git") end,
  config = function() require "user.plugins.cmp_git_nvim.config" end,
}
