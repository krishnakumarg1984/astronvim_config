return {
  run = "bash ./install.sh",
  -- keys = { "<leader>r" },
  keys = { "<Plug>SnipRun", "<Plug>SnipRunOperator" },
  cmd = {
    "SnipRun",
    "<Plug>SnipRun",
    "SnipRunOperator",
    "<Plug>SnipRunOperator",
    "SnipReset",
    "SnipClose",
    "SnipInfo",
    "SnipReplMemoryClean",
    "SnipTerminate",
  },
  config = function() require "user.plugins.sniprun.config" end,
}
