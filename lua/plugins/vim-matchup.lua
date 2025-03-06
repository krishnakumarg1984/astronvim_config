---@type LazySpec
return {
  "andymass/vim-matchup", -- even better %. navigate and highlight matching words. modern matchit and matchparen. Supports both vim and neovim + tree-sitter.
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            matchup_matchparen_nomode = "i",
            matchup_matchparen_deferred = 1,
            matchup_matchparen_offscreen = {},
            -- matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "WinBar", syntax_hl = 1 },
            -- matchup_override_vimtex = 1,
            -- matchup_surround_enabled = true,
          },
        },
      },
    },
  },
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "andymass/vim-matchup" },
      ---@type TSConfig
      ---@diagnostic disable-next-line: missing-fields
      opts = {
        matchup = { enable = true },
      },
    },
  },
}
