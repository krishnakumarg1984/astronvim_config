-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
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
  { "jay-babu/mason-null-ls.nvim", enabled = false },
}
