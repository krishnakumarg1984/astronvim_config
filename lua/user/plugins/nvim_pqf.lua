return {
  "https://gitlab.com/yorickpeterse/nvim-pqf", -- Prettier quickfix/location list
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
}
