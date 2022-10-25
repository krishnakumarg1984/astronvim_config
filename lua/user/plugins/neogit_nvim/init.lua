return {
  requires = {
    -- ["sindrets/diffview.nvim"] = { require "user.plugins.diffview" },
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
    },
  },
  cmd = { "Neogit" },
  config = function() require "user.plugins.neogit_nvim.config" end,
}
