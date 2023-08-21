return {
  {
    "echasnovski/mini.surround", -- Fast and feature-rich surround actions
    version = false,
    keys = {
      { "sa", desc = "Add surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete surrounding" },
      { "sF", desc = "Find left surrounding" },
      { "sf", desc = "Find right surrounding" },
      { "sh", desc = "Highlight surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = { n_lines = 200 },
  },
}
