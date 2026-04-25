if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvim-mini/mini.move",
  keys = {
    { "<M-l>", mode = { "n", "v" } },
    { "<M-k>", mode = { "n", "v" } },
    { "<M-j>", mode = { "n", "v" } },
    { "<M-h>", mode = { "n", "v" } },
  },
  opts = {},
}
