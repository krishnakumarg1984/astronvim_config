-- vim:isk-=-,isk+=.

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity", -- A community repository of common plugin specifications

  -- import/override with your plugins folder

  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" }, -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
  -- { import = "astrocommunity.diagnostics.trouble-nvim" }, -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  -- { import = "astrocommunity.editing-support.suda-vim" }, -- An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows
  -- { import = "astrocommunity.git.neogit" }, -- magit for neovim
  -- { import = "astrocommunity.indent.indent-blankline-nvim" }, -- Indent guides for Neovim
  -- { import = "astrocommunity.lsp.actions-preview-nvim" }, -- Fully customizable previewer for LSP code actions.
  -- { import = "astrocommunity.lsp.garbage-day-nvim" }, -- Garbage collector that stops inactive LSP clients to free RAM
  -- { import = "astrocommunity.lsp.lsp-lens-nvim" }, -- Neovim plugin for displaying references and definition infos upon functions like JB's IDEA.
  -- { import = "astrocommunity.lsp.lsplinks-nvim" }, -- LSP textDocument/documentLink support for neovim
  -- { import = "astrocommunity.lsp.nvim-lsp-endhints" }, --  Display LSP inlay hints at the end of the line, rather than within the line.
  -- { import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Neovim plugin that adds support for file operations using built-in LSP
  -- { import = "astrocommunity.markdown-and-latex.glow-nvim" }, -- A markdown preview directly in your neovim.
  -- { import = "astrocommunity.motion.mini-surround" }, -- Neovim Lua plugin with fast and feature-rich surround actions. Part of 'mini.nvim' library.
  -- { import = "astrocommunity.motion.vim-matchup" }, -- even better %. navigate and highlight matching words. modern matchit and matchparen. Supports both vim and neovim + tree-sitter.
  -- { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" }, -- This plugin specification configures AstroLSP to disable inlay hints in a buffer when going into insert mode and re-enables them when leaving insert mode.
  -- { import = "astrocommunity.recipes.vscode" }, -- Some users may be wanting to integrate their Neovim configuration with their VS Code editor. This spec configures AstroNvim to play nicely with the VS Code Extension vscode-neovim.
  -- { import = "astrocommunity.terminal-integration.flatten-nvim" }, -- Open files and command output from wezterm, kitty, and neovim terminals in your current neovim instance

  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" }, -- IDE-like breadcrumbs, out of the box
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- A Neovim plugin hiding your colorcolumn when unneeded. problematic with a fresh install of astronvim
  -- { import = "astrocommunity.code-runner.compiler-nvim" }, -- Neovim compiler for building and running your code without having to configure anything
  -- { import = "astrocommunity.color.headlines-nvim" }, -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg.
  -- { import = "astrocommunity.color.modes-nvim" },
  -- { import = "astrocommunity.color.tint-nvim" }, -- messes up neotree and other buffers
  -- { import = "astrocommunity.color.twilight-nvim" },
  -- { import = "astrocommunity.colorscheme.github-nvim-theme" }, -- Github's Neovim themes
  -- { import = "astrocommunity.completion.cmp-cmdline" },
  -- { import = "astrocommunity.completion.codeium-vim" }, -- Free, ultra fast Copilot alternative for Vim and Neovim. Problematic with a fresh install of astronvim
  -- { import = "astrocommunity.debugging.nvim-bqf" }, -- Better quickfix window in Neovim, polish old quickfix window.
  -- { import = "astrocommunity.debugging.nvim-dap-virtual-text" }, -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
  -- { import = "astrocommunity.debugging.persistent-breakpoints-nvim" }, -- Neovim plugin for persistent breakpoints.
  -- { import = "astrocommunity.debugging.telescope-dap-nvim" }, -- Integration for nvim-dap with telescope.nvim.
  -- { import = "astrocommunity.editing-support.comment-box-nvim" }, -- Clarify and beautify your comments and plain text files using boxes and lines.
  -- { import = "astrocommunity.editing-support.dial-nvim" }, -- Enhanced increment/decrement plugin for Neovim.
  -- { import = "astrocommunity.editing-support.hypersonic-nvim" },
  -- { import = "astrocommunity.editing-support.neogen" }, -- A better annotation generator. Supports multiple languages and annotation conventions.
  -- { import = "astrocommunity.editing-support.nvim-context-vt" }, -- Virtual text context for neovim treesitter
  -- { import = "astrocommunity.editing-support.nvim-devdocs" }, -- Neovim DevDocs integration
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" }, -- too invasive UI
  -- { import = "astrocommunity.editing-support.text-case-nvim" }, -- An all in one plugin for converting text case in Neovim
  -- { import = "astrocommunity.editing-support.treesj" }, -- Neovim plugin for splitting/joining blocks of code
  -- { import = "astrocommunity.editing-support.wildfire-nvim" },
  -- { import = "astrocommunity.file-explorer.oil-nvim" }, -- Neovim file explorer: edit your filesystem like a buffer
  -- { import = "astrocommunity.git.blame-nvim" },
  -- { import = "astrocommunity.git.diffview-nvim" }, -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- { import = "astrocommunity.git.gist-nvim" }, -- Neovim plugin that allows you to create a Github Gist from the current file
  -- { import = "astrocommunity.git.gitlinker-nvim" }, -- A lua neovim plugin to generate shareable file permalinks (with line ranges) for several git web frontend hosts. Inspired by tpope/vim-fugitive's :GBrowse
  -- { import = "astrocommunity.git.octo-nvim" }, -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor
  -- { import = "astrocommunity.git.openingh-nvim" },
  -- { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.lsp.delimited-nvim" },
  -- { import = "astrocommunity.lsp.inc-rename-nvim" }, -- Incremental LSP renaming based on Neovim's command-preview feature. Requires noice.nvim
  -- { import = "astrocommunity.lsp.lsp-signature-nvim" }, -- LSP signature hint as you type
  -- { import = "astrocommunity.markdown-and-latex.peek-nvim" }, -- figure out how to conditionally install this
  -- { import = "astrocommunity.markdown-and-latex.vimtex" }, -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
  -- { import = "astrocommunity.motion.nvim-spider" }, -- Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
  -- { import = "astrocommunity.motion.tabout-nvim" }, -- tabout plugin for neovim
  -- { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.julia" },
  -- { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.nix" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.programming-language-support.nvim-jqx" }, -- Populate the quickfix with json entries
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- { import = "astrocommunity.search.nvim-hlslens" },
  -- { import = "astrocommunity.terminal-integration.nvim-unception" },
  -- { import = "astrocommunity.test.neotest" }, -- An extensible framework for interacting with tests within Neovim.
  -- { import = "astrocommunity.test.nvim-coverage" }, -- Displays test coverage data in the sign column
  -- { import = "astrocommunity.utility.neodim" }, -- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
  -- { import = "astrocommunity.utility.noice-nvim" }, -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  -- { import = "astrocommunity.workflow.hardtime-nvim" }, -- breaks dropbar.nvim
  -- { import = "astrocommunity.debugging.nvim-dap-repl-highlights" }, -- Add syntax highlighting to the nvim-dap REPL buffer using treesitter.
}
