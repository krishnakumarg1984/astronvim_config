if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "mrjones2014/smart-splits.nvim",
  -- build = "./kitty/install-kittens.bash",
  opts = { at_edge = "stop" },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<M-h>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
            ["<M-j>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
            ["<M-k>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
            ["<A-l>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
          },
        },
      },
    },
  },
}
