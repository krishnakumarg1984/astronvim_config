if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "mikesmithgh/kitty-scrollback.nvim",
  dependencies = { "AstroNvim/astrocore" },
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  event = "User KittyScrollbackLaunch",
  opts = {},
}
