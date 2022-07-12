return {
  config = function()
    require("stabilize").setup {
      nested = "QuickFixCmdPost,DiagnosticChanged *",
    }
  end,
}
