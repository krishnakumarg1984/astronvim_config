return {
  module = "nabla",
  -- config = function() require "user.plugins.nabla_nvim.config" end,
  vim.keymap.set("n", "<leader>N", "<cmd>lua require('nabla').popup()<CR>", { desc = "Scientific preview" }),
}
