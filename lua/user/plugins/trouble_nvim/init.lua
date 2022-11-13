return {
  keys = { "<leader>x" },
  cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
  config = function() require "user.plugins.trouble_nvim.config" end,
}
