return {
  "MunifTanjim/exrc.nvim", -- Secure Project Local Config for Neovim
  event = "VimEnter",
  -- config = function()
  -- require("exrc").setup
  -- end,
  opts = {
    files = { ".exrc", ".exrc.lua", ".nvimrc", ".nvimrc.lua", ".vimrc.lua" },
  },
}
