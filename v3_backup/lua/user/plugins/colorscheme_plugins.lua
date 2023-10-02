return {
  {
    "rebelot/kanagawa.nvim", -- Colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
    -- lazy = false,
    -- event = "VeryLazy",
    config = function()
      require("kanagawa").setup {
        compile = true,
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        -- dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      }
    end,
  },
  -- {
  --   "luisiacc/gruvbox-baby", --  Gruvbox theme for neovim with full christmas_treeTreeSitter support.
  --   cmd = { "Telescope colorscheme" },
  -- },
  -- {
  --   "sainnhe/gruvbox-material", --  Gruvbox with Material Palette
  --   lazy = false,
  -- },
}
