return {
  {
    "willothy/flatten.nvim",
    lazy = false,
    -- event = "VeryLazy",
    -- event = { "TermOpen", "TermEnter", "TermLeave" },
    priority = 1001,
    opts = {
      window = {
        open = "vsplit",
      },
    },
  },
}
