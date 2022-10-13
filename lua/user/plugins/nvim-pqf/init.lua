return {
  event = { "QuickFixCmdPre", "QuickFixCmdPost" },
  config = function() require("pqf").setup() end,
}
