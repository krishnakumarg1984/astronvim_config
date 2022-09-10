return {
  -- fastest among all local-rc plugins
  -- after = "project.nvim",
  -- event = "BufReadPost",
  tag = "1.1.1",
  -- commit = "3f1e788",
  config = function() require("config-local").setup {} end,
}
