return {
  ft = { "qf" },
  event = { "QuickFixCmdPost", "QuickFixCmdPre" },
  config = function() require "user.plugins.vim_qf.config" end,
}
