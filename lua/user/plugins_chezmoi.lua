-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- /lua/custom/plugins/init.lua
return {
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
  { "klen/nvim-config-local" }, -- , event = { "CursorHold" } }
  { "kosayoda/nvim-lightbulb" },
  { "romgrk/nvim-treesitter-context", after = "nvim-treesitter" }, -- this is a separate plugin, which requires a separate configuration
  { "https://gitlab.com/yorickpeterse/nvim-window" },
  { "anuvyklack/pretty-fold.nvim" },
  { "ahmedkhalf/project.nvim" }, -- , event = { "CursorHold" } }
  { "winston0410/range-highlight.nvim", requires = { "winston0410/cmd-parser.nvim", event = "CmdlineEnter" } }, -- , event = { "CmdlineEnter", "CmdwinLeave" } }
  -- { "luukvbaal/stabilize.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "folke/trouble.nvim", cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" } },
  { "folke/which-key.nvim" }, -- , keys = { "<space>", "z", "c", "v", "d", "g", "<", ">", "@", "y", "\"", "<leader>", "<localleader>", "\\" } }
  { "pianocomposer321/yabs.nvim" },
}

-- Other interesting vim plugins (((

-- ipython/jupyter vim plugins (((

-- use("jupyter-vim/jupyter-vim")
-- use("untitled-ai/jupyter_ascending")
-- use "goerz/jupytext.vim"
-- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- need to set up mappings
-- use("bfredl/nvim-ipy")
-- use({ "hanschen/vim-ipython-cell", requires = { "jpalardy/vim-slime" } })

-- )))

-- Pre-filled out packer calls (((

-- use { "goolord/alpha-nvim" }
-- use { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } }
-- use { "akinsho/bufferline.nvim" }
-- use { "numtostr/BufOnly.nvim", cmd = { "BufOnly" } }
-- use { "kwkarlwang/bufresize.nvim" }
-- use { "kazhala/close-buffers.nvim", cmd = {} }
-- use { "andersevenrud/cmp-tmux" }
-- use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
-- use { "narutoxy/dim.lua", requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" }, }
-- use { "chipsenkbeil/distant.nvim" }
-- use { "stevearc/dressing.nvim" }
-- use { "ii14/exrc.vim" } -- "jenterkin/vim-autosource", "embear/vim-localvimrc", "LucHermitte/local_vimrc", "thinca/vim-localrc"
-- use { "Konfekt/FastFold" }
-- use { "j-hui/fidget.nvim" }
-- use { "rmagatti/goto-preview", event = { "CursorHold" } }
-- use { "mizlan/iswap.nvim", requires = { { "nvim-treesitter" } } }
-- use { "ggandor/lightspeed.nvim", requires = "tpope/vim-repeat", }
-- use { "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }
-- use { "onsails/lspkind-nvim" }
-- use { "chentau/marks.nvim", keys = { "m", "dm" }, cmd = { "MarksToggleSigns", "MarksListBuf", "MarksListGlobal", "MarksListAll", "MarksQFListBuf", "MarksQFListGlobal", "MarksQFListAll" } }
-- use { "TimUntersberger/neogit", cmd = { "Neogit" } }
-- use { "nyngwang/NeoZoom.lua" }
-- use { "kevinhwang91/nvim-bqf", ft = "qf", event = { "CursorHold" } }
-- use { "norcalli/nvim-colorizer.lua" }
-- use { "s1n7ax/nvim-comment-frame" }
-- use { "https://gitlab.com/yorickpeterse/nvim-dd", event = { "CursorHold" } }
-- use { "kosayoda/nvim-lightbulb" }
-- use { "mfussenegger/nvim-lint" }
-- use { "https://gitlab.com/yorickpeterse/nvim-pqf" }
-- use { "petertriho/nvim-scrollbar" }
-- use { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
-- use { "tyru/open-browser.vim", event = "BufWinEnter" }
-- use { "weirongxu/plantuml-previewer.vim", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } }
-- use { "lewis6991/spellsitter.nvim" }
-- use { "luukvbaal/stabilize.nvim" }
-- use { "blackCauldron7/surround.nvim" }
-- use { "wellle/targets.vim" }
-- use { "mg979/tasks.vim" }
-- use { "nvim-telescope/telescope-media-files.nvim" }
-- use { "nvim-telescope/telescope-packer.nvim" }
-- use { "cljoly/telescope-repo.nvim" }
-- use { "folke/todo-comments.nvim" } -- :ToDoQuickFix, :ToDoTrouble, :ToDoTelescope,
-- use { "folke/twilight.nvim", cmd = { "ZenMode", "Twilight", "TwilightEnable" } }
-- use { "wsdjeg/vim-assembly" }
-- use { "ntpeters/vim-better-whitespace" }
-- use { "gauteh/vim-cppman", ft = { "c", "cpp" }, cmd = { "Cppman" } }
-- use { "sgur/vim-editorconfig", event = "BufWinEnter" }
-- use { "tpope/vim-fugitive", event = "BufWinEnter" }
-- use { "ludovicchabant/vim-gutentags", event = { "CursorHold" } } -- , event = "BufWinEnter" }
-- use { "andymass/vim-matchup", event = "BufWinEnter" }
-- use { "petRUShka/vim-opencl", ft = { "opencl" } }  -- note: slow plugin on remote systems
-- use { "urbainvaes/vim-ripple" }
-- use { "Konfekt/vim-sentence-chopper" }
-- use { "scrooloose/vim-slumlord", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } } -- also a telescope extension
-- use { "tpope/vim-unimpaired", event = "BufWinEnter" }
-- use { "puremourning/vimspector", fn = "vimspector#Launch", disable = false }
-- use { "tweekmonster/wstrip.vim" }
-- use { "folke/zen-mode.nvim", cmd = "ZenMode" }

-- )))

-- www links to other interesting plugins (((

-- https://github.com/rmagatti/auto-session
-- https://github.com/jceb/blinds.nvim
-- https://github.com/monaqa/dial.nvim
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/Furkanzmc/firvish.nvim
-- https://github.com/beauwilliams/focus.nvim
-- https://github.com/ThePrimeagen/git-worktree.nvim/
-- https://github.com/ruifm/gitlinker.nvim
-- https://github.com/ThePrimeagen/git-worktree.nvim
-- https://github.com/brymer-meneses/grammar-guard.nvim
-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/ggandor/leap.nvim
-- https://github.com/lukas-reineke/lsp-format.nvim
-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
-- https://github.com/iamcco/markdown-preview.nvim
-- https://github.com/Pocco81/MerelyFmt.nvim/tree/dev
-- https://github.com/Sangdol/mintabline.vim
-- https://github.com/danymat/neogen
-- https://github.com/nyngwang/NeoNoName.lua
-- https://github.com/nacro90/numb.nvim
-- https://github.com/mfussenegger/nvim-dap-python
-- https://github.com/booperlv/nvim-gomove
-- https://github.com/bennypowers/nvim-regexplainer
-- https://github.com/rlane/pounce.nvim
-- https://github.com/kitten/prosemd-lsp
-- https://github.com/stefandtw/quickfix-reflector.vim
-- https://github.com/filipdutescu/renamer.nvim
-- https://github.com/rmagatti/session-lens
-- https://github.com/kamykn/spelunker.vim
-- https://github.com/gbprod/substitute.nvim
-- https://github.com/abecodes/tabout.nvim
-- https://github.com/TC72/telescope-tele-tabby.nvim
-- https://github.com/David-Kunz/treesitter-unit/
-- https://github.com/anufrievroman/vim-angry-reviewer
-- https://github.com/tpope/vim-apathy
-- https://github.com/dhruvasagar/vim-buffer-history
-- https://github.com/JoseConseco/vim-case-change
-- https://github.com/ojroques/vim-oscyank
-- https://github.com/4513ECHO/vim-readme-viewer
-- https://github.com/marklcrns/vim-smartq
-- https://github.com/svermeulen/vim-subversive
-- https://github.com/vim-test/vim-test
-- https://github.com/Julian/vim-textobj-variable-segment
-- https://github.com/rcarriga/vim-ultest
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/hoschi/yode-nvim
-- https://github.com/jalvesaq/zotcite

-- )))

-- )))
-- Note-taking systems, Documentation generators, to-do systems (((

--[[

Personal wiki/notes
-------------------
https://github.com/mickael-menu/zk + https://github.com/mickael-menu/zk-nvim  (others: https://github.com/terror/zk, https://github.com/sirupsen/zk)
https://github.com/xwmx/nb
mkdocs material
zeta-note (markdown lsp server)
org-mode (with org-roam)
Markdown + https://github.com/jakewvincent/mkdnflow.nvim + Markor on android + syncthing (or another service to sync)
vim-wiki (is vimscript)
wiki.vim
https://github.com/srid/emanote
neorg
https://github.com/oberblastmeister/neuron.nvim (neuron is deprecated and succeeded by emanote)

ToDo
----
todotxt.org
taskwarrior (taskwiki + vimwiki)

Time tracking
-------------
Timewarrior

Other proprietary systems
-------------------------
google keep (proprietary)
]]

-- )))
