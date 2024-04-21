-- vim:isk-=-,isk+=.

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

--   ╭───────────────────────────────────────────────────────────────────────╮
--   │           AstroCommunity: import any community modules here           │
--   │ We import this file in `lazy_setup.lua` before the `plugins/` folder. │
--   │ This guarantees that the specs are processed before any user plugins. │
--   ╰───────────────────────────────────────────────────────────────────────╯

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder

  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.completion.codeium-vim" }, -- Free, ultra fast Copilot alternative for Vim and Neovim. Problematic with a fresh install of astronvim
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" }, -- Helps you solve all the trouble your code is causing
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" }, -- Enhanced increment/decrement plugin for Neovim.
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gist-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.git.neogit" }, -- magit for neovim
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" }, -- A markdown preview directly in your neovim.
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.tabout-nvim" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.test.neotest" },

  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- A Neovim plugin hiding your colorcolumn when unneeded. problematic with a fresh install of astronvim
  -- { import = "astrocommunity.color.headlines-nvim" }, -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg. Problematic with a fresh install of astronvim
  -- { import = "astrocommunity.color.modes-nvim" },
  -- { import = "astrocommunity.color.tint-nvim" }, -- messes up neotree and other buffers
  -- { import = "astrocommunity.colorscheme.github-nvim-theme" }, -- Github's Neovim themes
  -- { import = "astrocommunity.completion.cmp-cmdline" },
  -- { import = "astrocommunity.debugging.nvim-bqf" }, -- Better quickfix window in Neovim, polish old quickfix window.
  -- { import = "astrocommunity.editing-support.hypersonic-nvim" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" }, -- too invasive UI
  -- { import = "astrocommunity.editing-support.treesj" }, -- Neovim plugin for splitting/joining blocks of code
  -- { import = "astrocommunity.editing-support.wildfire-nvim" },
  -- { import = "astrocommunity.git.blame-nvim" },
  -- { import = "astrocommunity.git.openingh-nvim" },
  -- { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.lsp.delimited-nvim" },
  -- { import = "astrocommunity.lsp.inc-rename-nvim" }, -- Incremental LSP renaming based on Neovim's command-preview feature. Requires noice.nvim
  -- { import = "astrocommunity.markdown-and-latex.peek-nvim" }, -- figure out how to conditionally install this
  -- { import = "astrocommunity.motion.vim-matchup" }, -- weird behaviour by inserting gibberish when using split windows
  -- { import = "astrocommunity.pack.julia" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- { import = "astrocommunity.search.nvim-hlslens" },
  -- { import = "astrocommunity.terminal-integration.nvim-unception" },
  -- { import = "astrocommunity.test.nvim-coverage" }, --  Displays test coverage data in the sign column
  -- { import = "astrocommunity.utility.neodim" }, -- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
  -- { import = "astrocommunity.utility.noice-nvim" }, -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  -- { import = "astrocommunity.workflow.hardtime-nvim" }, -- breaks dropbar.nvim
}
