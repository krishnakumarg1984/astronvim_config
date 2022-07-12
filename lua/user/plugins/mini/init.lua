return {
  -- event = "VimEnter",
  keys = { "sa", "sd", "sr", "sf", "sF", "sn" },
  config = function() require("mini.surround").setup() end,
}
-- refer to: https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/plugins/mini.lua, https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/autocmds.lua
