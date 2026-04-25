if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "andymass/vim-matchup",
  event = "User AstroFile",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            matchup_matchparen_nomode = "i",
            matchup_matchparen_deferred = 1,
            matchup_matchparen_offscreen = {},
          },
        },
      },
    },
  },
}
