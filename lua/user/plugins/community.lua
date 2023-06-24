return {
  "astroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- A Neovim plugin hiding your colorcolumn when unneeded. problematic with a fresh install of astronvim
  { import = "astrocommunity.color.headlines-nvim" }, -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg. Problematic with a fresh install of astronvim
  -- { import = "astrocommunity.colorscheme.github-nvim-theme" }, -- Github's Neovim themes
  { import = "astrocommunity.completion.codeium-vim" }, -- Free, ultra fast Copilot alternative for Vim and Neovim. Problematic with a fresh install of astronvim
  -- { import = "astrocommunity.debugging.nvim-bqf" }, -- Better quickfix window in Neovim, polish old quickfix window.
  { import = "astrocommunity.diagnostics.trouble-nvim" }, -- Helps you solve all the trouble your code is causing
  { import = "astrocommunity.editing-support.dial-nvim" }, -- Enhanced increment/decrement plugin for Neovim.
  { import = "astrocommunity.editing-support.todo-comments-nvim" }, -- Highlight, list and search todo comments in your projects
  -- { import = "astrocommunity.editing-support.treej" }, -- Neovim plugin for splitting/joining blocks of code
  -- { -- further customize the options set by the community
  --   "treesj",
  --   opts = { use_default_keymaps = true },
  -- },
  { import = "astrocommunity.git.neogit" }, -- magit for neovim
  { import = "astrocommunity.markdown-and-latex.glow-nvim" }, -- A markdown preview directly in your neovim.
  -- { import = "astrocommunity.lsp.inc-rename" }, --  Incremental LSP renaming based on Neovim's command-preview feature.
  -- { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.test.nvim-coverage" }, --  Displays test coverage data in the sign column
  -- { import = "astrocommunity.utility.neodim" }, -- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
  -- { import = "astrocommunity.utility.noice-nvim" }, -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
}
