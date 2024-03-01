-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ╭─────────────────────────────────────────────────────────╮
-- │ You can also add or configure plugins by creating       │
-- │ files in this `plugins/` folder                         │
-- │ Here are some examples:                                 │
-- ╰─────────────────────────────────────────────────────────╯

---@type LazySpec
return {
  {
    "rebelot/kanagawa.nvim", -- Colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
    -- lazy = false,
    -- event = "VeryLazy",
    config = function()
      require("kanagawa").setup {
        compile = true,
        -- keywordStyle = { italic = false },
        -- dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      }
    end,
  },
}
