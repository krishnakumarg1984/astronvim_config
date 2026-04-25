if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "theHamsta/nvim-dap-virtual-text",
  init = function(plugin) require("astrocore").on_load("nvim-dap", plugin.name) end,
  opts = {},
}
