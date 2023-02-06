return {
  "svban/YankAssassin.vim", -- Don't let the cursor move while Yanking in Vim/Neovim
  -- keys = { "y" },
  init = function() table.insert(astronvim.file_plugins, "YankAssassin.vim") end,
}
