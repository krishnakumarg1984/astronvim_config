return {
  "echasnovski/mini.surround", -- Fast and feature-rich surround actions
  version = false,
  keys = {
    { "sa", "sa", desc = "Add surrounding" },
    { "sd", "sd", desc = "Delete surrounding" },
    { "sd", "sd", desc = "Replace surrounding" },
    { "sf", "sf", desc = "Find surrounding (right)" },
    { "sF", "sF", desc = "Find surrounding (left)" },
    { "sh", "sh", desc = "Highlight surrounding" },
    { "sn", "sn", desc = "Change neighbour lines" },
  },
  config = function() require("mini.surround").setup() end,
}
