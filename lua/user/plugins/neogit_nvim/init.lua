vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Git dashboard" })
return {
  opt = true,
  setup = function() table.insert(astronvim.git_plugins, "neogit") end,
  requires = {
    -- ["sindrets/diffview.nvim"] = { require "user.plugins.diffview" },
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
    },
  },
  -- cmd = { "Neogit" },
  config = function() require "user.plugins.neogit_nvim.config" end,
}
