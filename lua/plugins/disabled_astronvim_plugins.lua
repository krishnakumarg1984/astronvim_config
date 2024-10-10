-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "goolord/alpha-nvim", -- A lua powered greeter like vim-startify / dashboard-nvim
    enabled = false,
    opts = function(_, opts)
      opts.section.header.val = { "" } -- customize the dashboard header
      return opts
    end,
  },
  {
    "max397574/better-escape.nvim", -- Map keys without delay when typing
    enabled = false,
    opts = {
      mappings = {
        i = { j = { k = false, j = false } }, -- disable insert mode escape
        t = {
          ["<Esc>"] = { ["<Esc>"] = "<C-\\><C-n>:q<CR>" }, -- add double escape to close
        },
      },
    },
  },
  { "NvChad/nvim-colorizer.lua", enabled = false }, -- The fastest Neovim colorizer.
}
