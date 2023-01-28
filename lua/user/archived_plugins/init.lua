-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

return {
  -- Modify/Disable a few AstroNvim default plugins (((

  ["goolord/alpha-nvim"] = { disable = true }, -- A lua powered greeter like vim-startify / dashboard-nvim
  ["max397574/better-escape.nvim"] = { disable = true }, -- Escape from insert mode without delay when typing
  ["rcarriga/nvim-notify"] = { disable = true }, -- A fancy, configurable, notification manager for NeoVim
  ["windwp/nvim-ts-autotag"] = require "user.plugins.nvim-ts-autotag", -- Autoclose & rename html tags with treesitter
  ["p00f/nvim-ts-rainbow"] = { disable = true }, -- Rainbow parentheses for neovim using tree-sitter

  -- )))

  -- Install additional plugins (((

  -- Additional vimscript plugins (((

  ["tweekmonster/startuptime.vim"] = require "user.plugins.startuptime_vim", -- Breakdown Vim's '--startuptime' output

  ["AndrewRadev/bufferize.vim"] = require "user.plugins.bufferize_vim", -- Execute a :command and show the output in a temporary buffer
  ["rust-lang/rust.vim"] = require "user.plugins.rust_vim", -- Vim configuration for Rust. (must be loaded before 'rust-tools')
  ["lambdalisue/suda.vim"] = require "user.plugins.suda_vim", -- An alternative sudo.vim for Vim and Neovim
  ["andymass/vim-matchup"] = require "user.plugins.vim_matchup", -- Even better '%' navigate & highlight matching words
  ["romainl/vim-qf"] = require "user.plugins.vim_qf", -- Tame the quickfix window.
  ["Konfekt/vim-sentence-chopper"] = require "user.plugins.vim_sentence_chopper", -- VCS-friendly text formatting
  ["tpope/vim-unimpaired"] = require "user.plugins.vim_unimpaired", -- Pairs of handy bracket mappings
  ["lervag/vimtex"] = require "user.plugins.vimtex", -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files
  ["svban/YankAssassin.vim"] = require "user.plugins.yank_assassin", -- Don't let the cursor move while Yanking in Vim/Neovim

  -- ))) end of additional vimscript plugins

  -- Additional lua plugins (((

  ["numtostr/BufOnly.nvim"] = require "user.plugins.bufonly", -- Lua/Neovim port of BufOnly.vim with some changes
  ["saecki/crates.nvim"] = require "user.plugins.crates_nvim", -- A neovim plugin that helps managing crates.io dependencies
  ["hrsh7th/cmp-buffer"] = require "user.plugins.cmp_buffer", -- nvim-cmp source for buffer words
  ["hrsh7th/cmp-emoji"] = require "user.plugins.cmp_emoji", -- nvim-cmp source for emoji
  ["petertriho/cmp-git"] = require "user.plugins.cmp_git_nvim", -- Git source for nvim-cmp
  ["MunifTanjim/exrc.nvim"] = require "user.plugins.exrc_nvim", -- Secure Project Local Config for Neovim
  ["rebelot/kanagawa.nvim"] = {}, -- require "user.plugins.kanagawa", -- Colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
  ["lvimuser/lsp-inlayhints.nvim"] = require "user.plugins.lsp_inlayhints",
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = require "user.plugins.lsplines_nvim", -- renders diagnostics using virtual lines on top of the real line of code
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature_nvim", -- LSP signature hint as you type
  ["echasnovski/mini.nvim"] = require "user.plugins.mini", -- Collection of minimal, independent, & fast Lua modules
  ["jghauser/mkdir.nvim"] = { event = "BufWritePre" }, -- This neovim plugin creates missing folders on save
  ["danymat/neogen"] = require "user.plugins.neogen_nvim", -- Annotation generator (multiple languages & conventions)
  ["TimUntersberger/neogit"] = require "user.plugins.neogit_nvim", -- Magit for neovim
  ["weilbith/nvim-code-action-menu"] = require "user.plugins.nvim_code_action_menu", -- Code action pop-up menu (meta-info & diff)
  ["ethanholz/nvim-lastplace"] = require "user.plugins.nvim_lastplace", -- A Lua rewrite of vim-lastplace
  ["kosayoda/nvim-lightbulb"] = require "user.plugins.nvim_lightbulb", -- VSCode bulb for neovim's built-in LSP.
  ["mfussenegger/nvim-lint"] = { module = "lint" }, -- An asynchronous linter plugin. Loads through local .vimrc.lua
  ["https://gitlab.com/yorickpeterse/nvim-pqf"] = require "user.plugins.nvim_pqf", -- Prettier quickfix/location list
  ["stevearc/overseer.nvim"] = require "user.plugins.overseer_nvim", -- A task runner and job management plugin for Neovim
  ["linty-org/readline.nvim"] = require "user.plugins.readline_nvim", -- Readline motions and deletions in Neovim
  ["simrat39/rust-tools.nvim"] = require "user.plugins.rust_tools", -- Tools for better development in rust using neovim's builtin lsp
  ["johmsalas/text-case.nvim"] = require "user.plugins.text_case", -- An all in one plugin for converting text case
  ["folke/trouble.nvim"] = require "user.plugins.trouble_nvim", -- Helps you solve all the trouble your code is causing

  -- ))) -- end of additional lua plugins

  -- ))) -- ends "Install additional plugins"
}