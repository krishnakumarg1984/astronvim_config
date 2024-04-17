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
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gist-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.tabout-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.terminal-integration.nvim-unception" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.utility.neodim" },
  { import = "astrocommunity.workflow.hardtime-nvim" },

  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- { import = "astrocommunity.color.modes-nvim" },
  -- { import = "astrocommunity.color.tint-nvim" }, -- messes up neotree and other buffers
  -- { import = "astrocommunity.completion.cmp-cmdline" },
  -- { import = "astrocommunity.editing-support.hypersonic-nvim" },
  -- { import = "astrocommunity.editing-support.wildfire-nvim" },
  -- { import = "astrocommunity.git.openingh-nvim" },
  -- { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.lsp.delimited-nvim" },
  -- { import = "astrocommunity.lsp.inc-rename-nvim" }, -- requires noice.nvim
  -- { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- { import = "astrocommunity.search.nvim-hlslens" },
  -- { import = "astrocommunity.utility.noice-nvim" },
}
