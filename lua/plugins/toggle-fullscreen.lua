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
