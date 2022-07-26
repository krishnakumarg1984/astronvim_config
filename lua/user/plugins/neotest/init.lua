return {
  -- cmd = { "Neogit" },
  requires = { "nvim-neotest/neotest-python" },
  config = function() require "user.plugins.neotest.config" end,
}
