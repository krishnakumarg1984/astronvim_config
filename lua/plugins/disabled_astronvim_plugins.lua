-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  -- customize alpha options
  {
    "goolord/alpha-nvim", -- A lua powered greeter like vim-startify / dashboard-nvim
    enabled = false,
    opts = function(_, opts)
      opts.section.header.val = { "" } -- customize the dashboard header
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false }, -- Escape from insert mode without delay when typing
  { "NvChad/nvim-colorizer.lua", enabled = false }, -- The fastest Neovim colorizer.
}
