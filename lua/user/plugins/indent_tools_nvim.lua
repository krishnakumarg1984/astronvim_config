return {
  "arsham/indent-tools.nvim",
  dependencies = { "arsham/arshlib.nvim" },
  init = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
  config = function() require("indent-tools").config {} end,
}
