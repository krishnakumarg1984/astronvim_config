return {
  {
    "jinh0/eyeliner.nvim", --  eyes Move faster with unique f/F indicators.
    enabled = false,
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  {
    "arsham/indent-tools.nvim", --  Neovim plugin for dealing with indentations
    enabled = false,
    dependencies = { "arsham/arshlib.nvim" },
    event = "User AstroFile",
    config = function() require("indent-tools").config {} end,
  },
}
