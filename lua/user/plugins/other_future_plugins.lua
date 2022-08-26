-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Other lua plugins (((

-- TODO (((

-- 1. Unit Testing
-- 2. Debugging
-- 3. Tmux integration

-- )))

-- dap notes and hyperlinks (((

-- https://gist.github.com/mehalter/b02b1d35499b650290d89badf0f2abac
-- https://www.reddit.com/r/neovim/comments/silikv/debugging_in_neovim/?sort=old
-- https://github.com/datamonsterr/astronvim_config/blob/main/which-key/mode/n.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/nvim-dap.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/nvim-dapui.lua
-- https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/which-key/register_mappings.lua
-- https://code.mehalter.com/projects/68
-- https://www.reddit.com/r/neovim/comments/pzm3d8/comment/hf5h71t/?utm_source=share&utm_medium=web2x&context=3
-- https://www.reddit.com/r/neovim/comments/u014b4/a_convenient_python_dap_configuration/?utm_source=share&utm_medium=web2x&context=3
-- https://www.reddit.com/r/neovim/comments/uyg0r3/nvimdap_run_config_and_get_promted_to_input_args/?utm_source=share&utm_medium=web2x&context=3

-- )))

-- https://superuser.com/questions/1485332/how-to-clear-neovim-buffer
-- https://github.com/0styx0/abbreinder.nvim  -- Abbreviation reminder plugin for Neovim 0.5+
-- https://github.com/emmanueltouzery/agitator.nvim
-- https://github.com/henriquehbr/ataraxis.lua  -- A simple zen mode for improving code readability on neovim
-- https://github.com/rmagatti/auto-session  -- A small automated session manager for Neovim
-- https://github.com/protex/better-digraphs.nvim  -- Better digraphs plugin based on idea from Damian Conway
-- https://github.com/jceb/blinds.nvim  -- blinds.nvim emphasizes the current window by shading the non-active windows
-- https://github.com/MordechaiHadad/bob  -- A version manager for neovim
-- https://github.com/lalitmee/browse.nvim  -- browse for anything using your choice of method
-- use { "kwkarlwang/bufresize.nvim" }  --  Keep buffer dimensions in proportion when terminal window is resized
-- https://github.com/saifulapm/chartoggle.nvim  -- Toggle character in Neovim
-- use { "kazhala/close-buffers.nvim", cmd = {} }  -- Delete multiple vim buffers based on different conditions
-- https://github.com/Civitasv/cmake-tools.nvim  --  CMake integration in Neovim
-- https://github.com/rcarriga/cmp-dap  -- nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
-- use { "andersevenrud/cmp-tmux" }  -- Tmux completion source for nvim-cmp and nvim-compe
-- https://github.com/xeluxee/competitest.nvim -- Automate testcases management & checking for Competitive Programming
-- https://github.com/zbirenbaum/copilot-cmp -- Lua plugin to turn github copilot into a cmp source
-- https://github.com/p00f/cphelper.nvim -- Neovim helper for competitive programming
-- https://github.com/Pocco81/dap-buddy.nvim
-- https://github.com/yriveiro/dap-go.nvim/  -- nvim-dap extenstion to make simpler debug Golang using Delve
-- https://github.com/jbyuki/dash.nvim
-- https://gitlab.com/HiPhish/debugpy.nvim  -- Command and configuration frontend for Debugpy and nvim-dap
-- https://github.com/monaqa/dial.nvim
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/narutoxy/dim.lua
-- https://github.com/tjdevries/diff-therapy.nvim  -- resolve those conflicts and have a happy relationship with git
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/chipsenkbeil/distant.nvim  -- Edit files, run programs, and work with LSP on a remote machine
-- use { "stevearc/dressing.nvim" }
-- https://github.com/NFrid/due.nvim
-- use { "j-hui/fidget.nvim" }
-- https://github.com/Furkanzmc/firvish.nvim
-- https://github.com/beauwilliams/focus.nvim
-- https://github.com/pierreglaser/folding-nvim
-- https://github.com/ruifm/gitlinker.nvim
-- https://github.com/ThePrimeagen/git-worktree.nvim
-- https://github.com/ray-x/go.nvim
-- https://github.com/olexsmir/gopher.nvim/  -- Neovim plugin for make golang development easiest
-- use { "rmagatti/goto-preview", event = { "CursorHold" } }
-- https://github.com/kalvinpearce/gitignore-gen.nvim
-- ["JASONews/glow-hover"] = { after = "nvim-lsp-installer" }, -- Leverages 'glow' for LSPs hover responses
-- https://github.com/p00f/godbolt.nvim
-- https://github.com/brymer-meneses/grammar-guard.nvim
-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/Pocco81/HighStr.nvim
-- https://github.com/m-demare/hlargs.nvim
-- https://github.com/lewis6991/hover.nvim   -- Hover plugin framework for Neovim
-- https://github.com/anuvyklack/hydra.nvim  -- Bind a bunch of key bindings together
-- https://github.com/b0o/incline.nvim
-- https://github.com/jbyuki/instant.nvim  -- collaborative editing in Neovim using built-in capabilities
-- https://github.com/hkupty/iron.nvim
-- https://github.com/JoseConseco/iswap.nvim
-- use { "mizlan/iswap.nvim", requires = { { "nvim-treesitter" } } }
-- https://github.com/matbme/JABS.nvim
-- https://github.com/frabjous/knap
-- https://github.com/ggandor/leap.nvim
-- use { "ggandor/lightspeed.nvim", requires = "tpope/vim-repeat", }
-- use { "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }
-- https://github.com/mbpowers/lorem-nvim
-- https://github.com/lukas-reineke/lsp-format.nvim -- A wrapper around Neovims native LSP formatting
-- use { "onsails/lspkind-nvim" }
-- https://github.com/ericpubu/lsp_codelens_extensions.nvim  -- Adds client side code for codelenses commands not in the lsp servers
-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
-- https://github.com/aspeddro/lsp_menu.nvim
-- https://github.com/jubnzv/mdeval.nvim
-- https://github.com/p00f/mdpreview.nvim
-- https://github.com/numToStr/Navigator.nvim
-- https://github.com/nyngwang/NeoClear.lua
-- https://github.com/sbdchd/neoformat
-- https://github.com/nyngwang/NeoNoName.lua
-- https://github.com/nvim-neotest/neotest  -- An extensible framework for interacting with tests within NeoVim https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/neotest.lua
-- use { "nyngwang/NeoZoom.lua" }
-- https://github.com/miversen33/netman.nvim -- Neovim (Lua powered) Network File Manager
-- https://github.com/nacro90/numb.nvim
-- use { "kevinhwang91/nvim-bqf", ft = "qf", event = { "CursorHold" } }
-- https://github.com/ojroques/nvim-bufdel
-- https://github.com/s1n7ax/nvim-comment-frame  -- Detects the language using treesitter and adds a comment block
-- https://github.com/haringsrob/nvim_context_vt
-- https://github.com/yamatsum/nvim-cursorline
-- https://github.com/xiyaowong/nvim-cursorword
-- https://github.com/leoluz/nvim-dap-go  -- configs for launching go debugger (delve) and debugging individual tests
-- https://github.com/mfussenegger/nvim-dap-go  -- configs for launching go debugger (delve) & for individual tests
-- https://github.com/mfussenegger/nvim-dap-python -- default config for python & methods to debug individual tests
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/esensar/nvim-dev-container -- Neovim dev container support
-- https://github.com/AllenDang/nvim-expand-expr
-- https://github.com/sakhnik/nvim-gdb -- Neovim thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB
-- https://github.com/booperlv/nvim-gomove
-- https://github.com/SmiteshP/nvim-gps
-- https://github.com/gennaro-tedesco/nvim-jqx
-- https://github.com/nanotee/nvim-lua-guide -- A guide to using Lua in Neovim
-- "kevinhwang91/nvim-ufo" -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/plugins.lua
-- https://github.com/geg2102/nvim-python-repl
-- https://github.com/bennypowers/nvim-regexplainer
-- use { "petertriho/nvim-scrollbar" }
-- https://github.com/dstein64/nvim-scrollview
-- https://github.com/Badhi/nvim-treesitter-cpp-tools -- C++ Helper Snippets Using Treesitter
-- https://github.com/AckslD/nvim-trevJ.lua
-- https://github.com/yioneko/nvim-yati -- Yet another tree-sitter powered indent plugin
-- https://gitlab.com/yorickpeterse/nvim-window
-- https://github.com/pwntester/octo.nvim
-- https://github.com/rktjmp/paperplanes.nvim
-- https://github.com/koenverburg/peepsight.nvim -- Focus on one function at a time
-- https://github.com/rlane/pounce.nvim
-- https://github.com/anuvyklack/pretty-fold.nvim
-- https://github.com/sheodox/projectlaunch.nvim
-- https://github.com/VonHeikemen/project-settings.nvim -- https://www.reddit.com/r/neovim/comments/tydpmy/using_projectsettingsnvim_to_call_language_servers/?sort=new
-- https://github.com/filipdutescu/renamer.nvim
-- https://github.com/simrat39/rust-tools.nvim  -- Tools for better development in rust using neovim's builtin lsp
-- https://github.com/xuyuanp/scrollbar.nvim
-- https://github.com/rmagatti/session-lens
-- https://github.com/sunjon/Shade.nvim
-- https://github.com/michaelb/sniprun
-- https://github.com/sQVe/sort.nvim
-- https://github.com/stsewd/sphinx.nvim
-- https://github.com/nanotee/sqls.nvim -- Neovim plugin for sqls that leverages the built-in LSP client
-- https://github.com/gbprod/substitute.nvim
-- use { "ur4ltz/surround.nvim" }
-- { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" }, -- Surf through & move elements with treesitter
-- https://github.com/GustavoKatel/tasks.nvim  -- Yet another task runner/manager for Neovim
-- https://github.com/nvim-telescope/telescope-bibtex.nvim -- A telescope extension to search & paste bibtex entries
-- use { "nvim-telescope/telescope-media-files.nvim" }
-- use { "nvim-telescope/telescope-packer.nvim" }
-- use { "cljoly/telescope-repo.nvim" }
-- https://github.com/TC72/telescope-tele-tabby.nvim
-- https://github.com/da-moon/telescope-toggleterm.nvim
-- https://github.com/mcauley-penney/tidy.nvim
-- https://github.com/aserowy/tmux.nvim
-- use { "folke/todo-comments.nvim" } -- :ToDoQuickFix, :ToDoTrouble, :ToDoTelescope,
-- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim  -- toggle LSP diagnostics
-- https://github.com/jedrzejboczar/toggletasks.nvim
-- https://github.com/drybalka/tree-climber.nvim -- Plugin for easy navigation around the syntax-tree
-- https://github.com/David-Kunz/treesitter-unit/
-- https://github.com/Pocco81/TrueZen.nvim
-- use { "folke/twilight.nvim", cmd = { "ZenMode", "Twilight", "TwilightEnable" } }
-- https://github.com/jose-elias-alvarez/typescript.nvim -- A Lua plugin, written in TypeScript, to write TypeScript
-- https://github.com/axieax/urlview.nvim
-- https://github.com/psliwka/vim-dirtytalk
-- https://github.com/RRethy/vim-illuminate
-- https://github.com/rcarriga/vim-ultest
-- https://github.com/lukas-reineke/virt-column.nvim -- Display a character as the colorcolumn
-- https://github.com/xiyaowong/virtcolumn.nvim  -- Display a line as the colorcolumn
-- https://github.com/jubnzv/virtual-types.nvim  -- A Neovim plugin that shows type annotations as virtual text
-- https://github.com/EthanJWright/vs-tasks.nvim  -- Telescope plugin similar to VS Code's task implementation
-- https://github.com/gelguy/wilder.nvim
-- https://github.com/declancm/windex.nvim
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/yaclt/yaclt.nvim
-- https://github.com/cuducos/yaml.nvim  -- YAML toolkit for Neovim users
-- https://github.com/hoschi/yode-nvim
-- use { "folke/zen-mode.nvim", cmd = "ZenMode" }

-- ))) end of 'other lua plugins' fold

-- Other vimscript plugins (((

-- https://github.com/hiphish/awk-ward.nvim
-- https://github.com/AlxHnr/build.vim  -- Vim plugin for building projects
-- https://github.com/dkarter/bullets.vim
-- https://github.com/metakirby5/codi.vim
-- https://github.com/rhysd/conflict-marker.vim
-- https://github.com/whiteinge/diffconflicts
-- https://github.com/direnv/direnv.vim
-- use { "ii14/exrc.vim" } -- "jenterkin/vim-autosource", "embear/vim-localvimrc", "LucHermitte/local_vimrc", "thinca/vim-localrc"
-- use { "Konfekt/FastFold" }
-- https://github.com/axlebedev/footprints
-- https://github.com/aadv1k/gdoc.vim  (python + vimscript)
-- https://github.com/goerz/jupytext.vim
-- https://github.com/iamcco/markdown-preview.nvim
-- https://github.com/Sangdol/mintabline.vim
-- https://github.com/kassio/neoterm   -- promises matlab REPL support
-- https://github.com/svban/PasteSorcerer.vim
-- use { "weirongxu/plantuml-previewer.vim", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } }
-- https://github.com/stefandtw/quickfix-reflector.vim
-- https://github.com/aiya000/vim-quickrepl  -- REPL
-- https://gitlab.com/HiPhish/repl.nvim -- REPL
-- https://github.com/rhysd/reply.vim -- REPL
-- https://github.com/kamykn/spelunker.vim
-- use { "wellle/targets.vim" }
-- https://github.com/epheien/termdbg -- Terminal debugger for vim
-- https://github.com/markonm/traces.vim
-- https://github.com/anufrievroman/vim-angry-reviewer
-- https://github.com/tpope/vim-apathy
-- https://github.com/foosoft/vim-argwrap
-- use { "wsdjeg/vim-assembly" }
-- use { "ntpeters/vim-better-whitespace" }
-- https://github.com/dhruvasagar/vim-buffer-history
-- https://github.com/JoseConseco/vim-case-change
-- https://github.com/jalvesaq/vimcmdline  -- promises matlab support (REPL?)
-- use { "gauteh/vim-cppman", ft = { "c", "cpp" }, cmd = { "Cppman" } }
-- use { "tpope/vim-fugitive", event = "BufWinEnter" }
-- https://github.com/tenfyzhong/vim-gencode-cpp -- auto generate function definition or declaration
-- https://github.com/alepez/vim-gtest  -- Quickly select and run GoogleTest asyncronously
-- use { "ludovicchabant/vim-gutentags", event = { "CursorHold" } } -- , event = "BufWinEnter" }
-- https://github.com/azabiong/vim-highlighter
-- use { "petRUShka/vim-opencl", ft = { "opencl" } }  -- note: slow plugin on remote systems
-- https://github.com/ojroques/vim-oscyank
-- https://github.com/thinca/vim-quickrun
-- https://github.com/4513ECHO/vim-readme-viewer
-- use { "urbainvaes/vim-ripple" }  -- REPL
-- use { "Konfekt/vim-sentence-chopper" }
-- https://github.com/jpalardy/vim-slime
-- use { "scrooloose/vim-slumlord", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } }
-- https://github.com/marklcrns/vim-smartq
-- https://github.com/svermeulen/vim-subversive  -- Vim plugin providing operator motions to quickly replace text
-- https://github.com/Matt-A-Bennett/vim-surround-funk
-- https://github.com/dhruvasagar/vim-table-mode -- Vim Table Mode for instant table creation
-- https://github.com/mroavi/vim-tomux
-- https://github.com/erietz/vim-terminator
-- https://github.com/Julian/vim-textobj-variable-segment
-- https://github.com/inkarkat/vim-UnconditionalPaste
-- https://github.com/mg979/vim-visual-multi
-- use { "tweekmonster/wstrip.vim" }
-- https://github.com/Einenlum/yaml-revealer
-- https://github.com/axvr/zepl.vim  -- (REPL)
-- https://github.com/jalvesaq/zotcite
-- https://www.reddit.com/r/vim/comments/dpj0fz/vim_and_matlab/

-- ))) end of 'other vimscript plugins'

-- ipython/jupyter vim plugins (((

-- https://euporie.readthedocs.io/en/latest/
-- https://github.com/tbung/cell-textobjects.nvim
-- https://alpha2phi.medium.com/jupyter-notebook-vim-neovim-c2d67d56d563
-- https://github.com/luk400/vim-jukit   -- (vimscript + python)
-- https://github.com/sillybun/vim-repl -- (vimscript + python). Good generic REPL
-- { "hanschen/vim-ipython-cell", requires = { "jpalardy/vim-slime" } } -- (python + vimscript)
-- https://www.maxwellrules.com/misc/nvim_jupyter.html
-- "jupyter-vim/jupyter-vim"  (python + vimscript)
-- "untitled-ai/jupyter_ascending"
-- "goerz/jupytext.vim"  -- (pure vimscript)
-- { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- need to set up mappings (python + vimscript)
-- "bfredl/nvim-ipy"  -- (python plugin)
-- https://github.com/ahmedkhalf/jupyter-nvim
-- https://github.com/jupyterlab-contrib/jupyterlab-vim (browser-based)
-- https://github.com/ianhi/jupyterlab-vimrc (browser-based)

-- )))

-- Note-taking systems, Documentation generators, to-do systems (((

--[[

Personal wiki/notes
-------------------
https://github.com/mickael-menu/zk + https://github.com/mickael-menu/zk-nvim  (others: https://github.com/terror/zk, https://github.com/sirupsen/zk, https://github.com/renerocksai/telekasten.nvim)
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
https://github.com/stevearc/gkeep.nvim
]]

-- )))

-- Readings and resources (((

-- https://www.reddit.com/r/neovim/comments/uxwwbw/comment/ia0m8vg/?utm_source=share&utm_medium=web2x&context=3
-- https://www.reddit.com/r/vim/comments/uy0qnx/how_to_create_syntax_file_that_highlights_the/?utm_source=share&utm_medium=web2x&context=3
-- https://github.com/PacktPublishing/Mastering-Vim
-- https://www.reddit.com/r/vim/comments/ti2is7/open_relevant_git_files_in_your_editor/
-- https://www.reddit.com/r/vim/comments/pozc9s/tips_for_working_in_large_projects_with_vim/
-- https://www.reddit.com/r/vim/comments/oqkfur/comment/h6del3b/?utm_source=share&utm_medium=web2x&context=3
-- https://www.youtube.com/watch?v=7LDlUMMbv6k
-- https://www.reddit.com/r/vim/comments/osednx/lesser_known_vim_functionality/
-- https://doriankarter.com/inspect-contents-of-lua-table-in-neovim/
-- https://www.reddit.com/r/vim/comments/osednx/comment/h6pad2n/?utm_source=share&utm_medium=web2x&context=3
-- https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
-- https://github.com/thanhvule0310/dotfiles
-- https://www.integralist.co.uk/posts/vim/
-- https://github.com/cheap-glitch/vim.help
-- https://alexfertel.hashnode.dev/vim-is-actually-worth-it
-- https://github.com/mhinz/vim-galore
-- https://github.com/ArthurSonzogni/Diagon
-- https://github.com/melvio/medical-spell-files
-- https://ploomber.io/
-- https://iamsang.com/en/2022/04/13/vimrc/
-- https://vimtips.strix.dev/
-- https://github.com/ibhagwan/vim-cheatsheet
-- https://jovica.org/posts/vim-edit-multiple-files/
-- https://www.theviminator.com/
-- https://vimgore.netlify.app/
-- https://github.com/pit-ray/win-vind
-- https://gosukiwi.github.io/vim/2022/04/19/vim-advanced-search-and-replace.html

-- Other local-vimrc plugins (((

-- ["jenterkin/vim-autosource"] = {}, -- 2nd fastest among all local-rc plugins
-- ["embear/vim-localvimrc"] = {}, -- 3rd fastest among all local-rc plugins
-- ["ii14/exrc.vim"] = {}, -- slowest among all local-rc plugins
-- ["mfussenegger/nvim-dap"] = {},

-- )))

-- )))
