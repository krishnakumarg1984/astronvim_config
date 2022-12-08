return {
  opt = true,
  setup = function() table.insert(astronvim.file_plugins, "rust.vim") end,
  after = "nvim-treesitter",
}
