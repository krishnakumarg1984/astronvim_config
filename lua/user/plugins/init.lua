-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

return {
  -- Disable a few AstroNvim default plugins (((

  ["goolord/alpha-nvim"] = { disable = true }, -- A lua powered greeter like vim-startify / dashboard-nvim
  ["max397574/better-escape.nvim"] = { disable = true }, -- Escape from insert mode without delay when typing
  ["norcalli/nvim-colorizer.lua"] = { disable = true },
  ["rcarriga/nvim-notify"] = { disable = true }, -- A fancy, configurable, notification manager for NeoVim
  ["p00f/nvim-ts-rainbow"] = { disable = true }, -- Rainbow parentheses for neovim using tree-sitter

  -- )))

  -- Install additional plugins (((

  -- Additional vimscript plugins (((

  -- ["tweekmonster/startuptime.vim"] = { cmd = { "StartupTime" } }, -- Breakdown Vim's '--startuptime' output
  -- ["dstein64/vim-startuptime"] = { cmd = { "StartupTime" } }, -- A Vim plugin for profiling Vim's startup time
  ["tyru/capture.vim"] = { cmd = { "Capture" } }, -- Show Ex command output in buffer
  ["lambdalisue/suda.vim"] = { cmd = { "SudaRead", "SudaWrite" } }, -- An alternative sudo.vim for Vim and Neovim
  ["mg979/tasks.vim"] = require "user.plugins.tasks_mg979", -- Async jobs and tasks
  -- ["kenn7/vim-arsync"] = require "user.plugins.vim-arsync", -- Synchronisation of remote & local files using rsync
  ["m-pilia/vim-ccls"] = require "user.plugins.vim-ccls", -- Vim plugin for the ccls language server
  ["gauteh/vim-cppman"] = { cmd = { "Cppman" } }, -- cppman ("C++ 98/11/14 manual pages for Linux/MacOS" ) from vim
  ["Konfekt/vim-DetectSpellLang"] = require "user.plugins.vim-detectspelllang", -- Autodetect the spellcheck language
  ["dbmrq/vim-dialect"] = require "user.plugins.vim-dialect", -- Project specific spellfiles
  ["Konfekt/vim-sentence-chopper"] = { ft = { "tex", "markdown", "text" } }, -- VCS-friendly text formatting
  ["andymass/vim-matchup"] = { after = "nvim-treesitter" }, -- Even better % navigate & highlight matching words
  ["urbainvaes/vim-ripple"] = require "user.plugins.vim-ripple", -- Minimalist plugin to interact with a REPL
  ["tpope/vim-unimpaired"] = require "user.plugins.vim-unimpaired", -- Pairs of handy bracket mappings
  ["lervag/vimtex"] = {}, --  VimTeX: A modern Vim and neovim filetype plugin for LaTeX files
  -- ["svban/YankAssassin.vim"] = {}, -- Don't let the cursor move while Yanking in Vim/Neovim
  -- ["axvr/zepl.vim"] = {}, -- Simple and minimal REPL integration plugin for Vim and Neovim

  -- ))) end of additional vimscript plugins

  -- Additional lua plugins (((

  ["numtostr/BufOnly.nvim"] = { cmd = { "BufOnly" } }, -- Lua/Neovim port of BufOnly.vim with some changes
  -- ["sudormrfbin/cheatsheet.nvim"] = { cmd = { "Cheatsheet", "CheatsheetEdit" } }, -- A cheatsheet plugin
  ["p00f/clangd_extensions.nvim"] = require "user.plugins.clangd_extensions", -- Clangd's off-spec features
  ["hrsh7th/cmp-buffer"] = require "user.plugins.cmp-buffer", -- nvim-cmp source for buffer words
  ["hrsh7th/cmp-emoji"] = require "user.plugins.cmp-emoji", -- nvim-cmp source for emoji
  ["petertriho/cmp-git"] = require "user.plugins.cmp-git", -- Git source for nvim-cmp
  -- ["octaltree/cmp-look"] = require "user.plugins.cmp-look",
  ["gpanders/editorconfig.nvim"] = {}, --  EditorConfig plugin for Neovim
  ["akinsho/git-conflict.nvim"] = require "user.plugins.git-conflict", -- Visualise & resolve merge conflicts
  ["ellisonleao/glow.nvim"] = { cmd = { "Glow", "GlowInstall" } }, -- A markdown preview directly in your neovim
  -- ["JASONews/glow-hover"] = { after = "nvim-lsp-installer" }, -- Leverages 'glow' for LSPs hover responses
  -- ["lukas-reineke/headlines.nvim"] = require "user.plugins.headlines", -- Horizontal highlights for text filetypes
  -- ["hkupty/iron.nvim"] = require "user.plugins.iron", -- Interactive Repl Over Neovim
  ["rebelot/kanagawa.nvim"] = {}, -- Colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature", -- LSP signature hint as you type
  -- ["chentoast/marks.nvim"] = require "user.plugins.marks", -- A better UX for viewing & interacting with Vim marks
  ["echasnovski/mini.nvim"] = require "user.plugins.mini", -- Collection of minimal, independent, & fast Lua modules
  ["jghauser/mkdir.nvim"] = { event = "BufWritePre" }, -- This neovim plugin creates missing folders on save
  ["jbyuki/nabla.nvim"] = { module = "nabla" }, -- Take your scientific notes in Neovim
  ["danymat/neogen"] = require "user.plugins.neogen", -- Annotation generator (multiple languages & conventions)
  ["TimUntersberger/neogit"] = require "user.plugins.neogit", -- Magit for neovim
  ["nvim-neotest/neotest"] = require "user.plugins.neotest", -- An extensible framework for interacting with tests within NeoVim.
  ["nvim-neotest/neotest-python"] = {}, -- Neotest adapter for python. Supports Pytest and unittest test files.
  -- ["Shatur/neovim-cmake"] = require "user.plugins.neovim-cmake", -- CMake integration for Neovim
  ["weilbith/nvim-code-action-menu"] = { cmd = "CodeActionMenu" }, -- Code action pop-up menu (meta-info & diff)
  -- ["xiyaowong/nvim-colorizer.lua"] = require "user.plugins.nvim-colorizer", -- The fastest colorizer
  ["klen/nvim-config-local"] = require "user.plugins.nvim-config-local", -- Secure load local config files for neovim
  -- ["andythigpen/nvim-coverage"] = require "user.plugins.nvim-coverage", -- Displays test coverage data in the sign column
  ["mfussenegger/nvim-dap"] = require "user.plugins.nvim-dap", -- Debug Adapter Protocol client implementation
  ["rcarriga/nvim-dap-ui"] = require "user.plugins.nvim-dapui", -- A UI for nvim-dap
  ["theHamsta/nvim-dap-virtual-text"] = require "user.plugins.nvim-dap-virtual-text", -- slow!
  ["https://gitlab.com/yorickpeterse/nvim-dd"] = require "user.plugins.nvim-dd", -- Deferring of NeoVim diagnostics
  ["kevinhwang91/nvim-hlslens"] = require "user.plugins.nvim-hlslens", -- A hlsearch Lens for Neovim
  ["ethanholz/nvim-lastplace"] = require "user.plugins.nvim-lastplace", -- A Lua rewrite of vim-lastplace
  ["kosayoda/nvim-lightbulb"] = require "user.plugins.nvim-lightbulb", -- VSCode bulb for neovim's built-in LSP.
  ["mfussenegger/nvim-lint"] = { module = "lint" }, -- An asynchronous linter plugin. Loads through local .vimrc.lua
  ["sitiom/nvim-numbertoggle"] = require "user.plugins.nvim-numbertoggle", -- Auto-toggle b/w rel & abs line nos
  ["https://gitlab.com/yorickpeterse/nvim-pqf"] = require "user.plugins.nvim-pqf", -- Prettier quickfix/location list
  ["romgrk/nvim-treesitter-context"] = require "user.plugins.nvim-treesitter-context", -- Show code context
  -- { "eddiebergman/nvim-treesitter-pyfold", after = { "nvim-treesitter" }, ft = "python" }, -- Sane Python folding
  ["nvim-treesitter/nvim-treesitter-refactor"] = { after = "nvim-treesitter" }, -- Treesitter refactor module
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["RRethy/nvim-treesitter-textsubjects"] = require "user.plugins.nvim-treesitter-textsubjects", -- DWIM textobjects
  -- ["s1n7ax/nvim-window-picker"] = {}, -- Prompts to pick a window & returns its window id
  ["samjwill/nvim-unception"] = {}, -- Open files from within Neovim's terminal emulator without weird behavior
  -- ["jbyuki/one-small-step-for-vimkind"] = {}, -- Debug adapter for Neovim plugins
  ["Weissle/persistent-breakpoints.nvim"] = require "user.plugins.persistent-breakpoints",
  ["ahmedkhalf/project.nvim"] = require "user.plugins.project", -- The superior project management solution for nvim
  ["stevearc/qf_helper.nvim"] = require "user.plugins.qf_helper", -- A collection of improvements for quickfix buffer
  ["linty-org/readline.nvim"] = require "user.plugins.readline", -- Readline motions and deletions in Neovim
  -- ["michaelb/sniprun"] = require "user.plugins.sniprun", -- Run lines/blocs of code, supports multiples languages
  -- ["lewis6991/spellsitter.nvim"] = require "user.plugins.spellsitter", -- Treesitter powered spellchecker
  -- ["luukvbaal/stabilize.nvim"] = require "user.plugins.stabilize", -- Stabilize window open/close events
  -- ["abecodes/tabout.nvim"] = require "user.plugins.tabout", -- tabout plugin for neovim
  ["nvim-telescope/telescope-dap.nvim"] = require "user.plugins.telescope-dap", -- Dap-Telescope integration
  -- ["benfowler/telescope-luasnip.nvim"] = require "user.plugins.telescope-luasnip", -- Telescope+LuaSnip integration
  ["johmsalas/text-case.nvim"] = require "user.plugins.text-case", -- An all in one plugin for converting text case
  ["folke/trouble.nvim"] = require "user.plugins.trouble", -- Helps you solve all the trouble your code is causing

  -- ))) -- end of additional lua plugins

  -- ))) -- ends "Install additional plugins"

  -- Modify AstroNvim default plugins (((

  ["jose-elias-alvarez/null-ls.nvim"] = require "user.plugins.null-ls", -- Inject LSP diagnostics, code actions etc
  ["windwp/nvim-ts-autotag"] = require "user.plugins.nvim-ts-autotag", -- Autoclose & rename html tags with treesitter

  -- ))) end of modification of default AstroNvim plugins
}
