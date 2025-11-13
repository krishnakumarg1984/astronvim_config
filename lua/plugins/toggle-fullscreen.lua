if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "propet/toggle-fullscreen.nvim",
  -- event = { "TermOpen", "TermEnter" },
  keys = {
    {
      "<M-m>",
      function() require("toggle-fullscreen"):toggle_fullscreen() end,
      desc = "toggle-fullscreen",
    },
  },
}
