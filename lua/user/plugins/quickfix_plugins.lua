return {
  {
    "yorickpeterse/nvim-pqf", -- Prettier quickfix/location list for Neovim
    -- event = { "QuickFixCmdPre", "QuickFixCmdPost" },
    -- lazy = false,
    event = { "VeryLazy" },
    config = function()
      require("pqf").setup {
        signs = {
          error = "E",
          warning = "W",
          info = "I",
          hint = "H",
        },
        show_multiple_lines = true,
      }
    end,
  },
}
