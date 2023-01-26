return {
  module = "neogen",
  cmd = { "Neogen", "Neogen func", "Neogen class", "Neogen file", "Neogen type" },
  config = function() require "user.plugins.neogen_nvim.config" end,
  -- requires = "nvim-treesitter/nvim-treesitter",
}
