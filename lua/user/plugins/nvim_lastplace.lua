return {
  "ethanholz/nvim-lastplace", -- A Lua rewrite of vim-lastplace
  -- init = function() table.insert(astronvim.file_plugins, "nvim-lastplace") end,
  event = "BufRead",
  opts = {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help", "terminal", "lspinfo" },
    lastplace_ignore_filetype = {
      "dashboard",
      "DiffviewFiles",
      "gitcommit",
      "gitrebase",
      "hgcommit",
      "mason",
      "neo-tree",
      "Neogitcommit",
      "NeogitCommitMessage",
      "NeogitPopup",
      "neogitstatus",
      "NvimTree",
      "packer",
      "startify",
      "svn",
      "Trouble",
    },
    lastplace_open_folds = true,
  },
}
