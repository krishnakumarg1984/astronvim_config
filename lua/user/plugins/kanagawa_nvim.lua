return {
  "rebelot/kanagawa.nvim", -- Colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
  lazy = false,
  config = function()
    require("kanagawa").setup {
      compile = true,
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      -- dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    }
  end,
}
