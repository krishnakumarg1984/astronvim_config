return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>E", "<leader>E", desc = "Explorer (oil.nvim)" },
      { "<leader>Ee", "<cmd>lua require('oil').open()<cr>", desc = "Open in oil.nvim" },
    },
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
