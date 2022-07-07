-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- `plugins.init` table for adding new plugins and disabling/modifying default plugins

return {
  -- Disable/modify AstroNvim built-in plugins (((

  ["max397574/better-escape.nvim"] = { disable = true },
  ["norcalli/nvim-colorizer.lua"] = { event = { nil }, ft = { "html", "javascript", "css" } }, -- look into more filetypes
  ["rcarriga/nvim-notify"] = { disable = true },
  ["windwp/nvim-ts-autotag"] = {
    -- after = { nil },
    requires = { "nvim-treesitter/nvim-treesitter" },
    ft = {
      -- "glimmer",
      -- "handlebars",
      -- "hbs",
      "html",
      "javascript",
      -- "javascriptreact",
      -- "jsx",
      "markdown",
      "php",
      -- "rescript",
      -- "svelte",
      -- "tsx",
      "typescript",
      "typescriptreact",
      "vue",
      "xml",
    },
  },
  ["p00f/nvim-ts-rainbow"] = { disable = true },

  -- )))

  -- Additional plugins (((

  -- Add plugins (packer syntax without the "use" keyword)
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
  -- { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
  { "tyru/capture.vim", cmd = { "Capture" } },
  ["lambdalisue/suda.vim"] = { cmd = { "SudaRead", "SudaWrite" } },
  ["mg979/tasks.vim"] = { -- "tasks.vim" (((
    keys = {
      "<Plug>(Tasks-Choose)",
      "<Plug>(Tasks-Choose!)",
      "<Plug>(Tasks-Profile)",
      "<Plug>)(Tasks-FileNext)",
      "<Plug>(Tasks-FileNext)",
    },
    cmd = {
      "Async!",
      "Async",
      "AsyncBuf!",
      "AsyncBuf",
      "AsyncCmd!",
      "AsyncCmd",
      "Compiler!",
      "Compiler",
      "Grep!",
      "Grep",
      "GrepAdd!",
      "GrepAdd",
      "Jobs!",
      "Jobs",
      "LCompiler!",
      "LCompiler",
      "LGrep!",
      "LGrep",
      "LGrepAdd!",
      "LGrepAdd",
      "LMake!",
      "LMake",
      "Make!",
      "Make",
      "Task!",
      "Task",
      "Tasks!",
      "Tasks",
      "TasksOpen",
      "TasksProfile!",
      "TasksProfile",
    },
  }, -- end 'tasks.vim' )))
  -- ["kenn7/vim-arsync"] = {
  --   -- cmd = { "ARshowConf", "ARsyncUp", "ARsyncUpDelete", "ARsyncDown" },
  -- },
  { "gauteh/vim-cppman", cmd = { "Cppman" } },
  -- { "jeffkreeftmeijer/vim-numbertoggle", event = { "InsertEnter", "FocusLost" } },
  ["Konfekt/vim-DetectSpellLang"] = { -- "vim-DetectSpellLang" (((
    ft = {
      "asciidoc",
      "changelog",
      "context",
      "DiffviewFiles",
      "gitcommit",
      "Neogitcommit",
      "NeogitCommit",
      "NeogitCommitMessage",
      "lsp_markdown",
      "mail",
      "markdown",
      "rst",
      "rtf",
      "tex",
      "texinfo",
      "text",
      "txt",
    },
  }, -- end "vim-DetectSpellLang" )))
  ["dbmrq/vim-dialect"] = { -- "vim-dialect" (((
    ft = {
      "asciidoc",
      "changelog",
      "context",
      "DiffviewFiles",
      "gitcommit",
      "Neogitcommit",
      "NeogitCommit",
      "NeogitCommitMessage",
      "lsp_markdown",
      "mail",
      "markdown",
      "rst",
      "rtf",
      "tex",
      "texinfo",
      "text",
      "txt",
    },
  }, -- end "vim-dialect" )))
  { "Konfekt/vim-sentence-chopper", ft = { "tex", "markdown", "text" } },
  { "andymass/vim-matchup", after = "nvim-treesitter" },
  ["urbainvaes/vim-ripple"] = { -- "vim-ripple" (((
    -- keys = {
    --   "<Plug>(ripple_open_repl)",
    --   "<Plug>(ripple_send_motion)",
    --   "<Plug>(ripple_send_previous)",
    --   "<Plug>(ripple_send_selection)",
    --   "<Plug>(ripple_send_line)",
    --   "<Plug>(ripple_send_buffer)",
    -- },
    ft = { "python", "julia", "r", "ruby", "scheme" },
    -- requires = { "machakann/vim-highlightedyank" },
  }, -- end "vim-ripple" )))
  { "tpope/vim-unimpaired", keys = { "[", "]", "=", "<", ">" } }, -- e (exchange), ob (background), oc (cursorline), od (diff), oh (hlsearch), oi (ignorecase), ol (list), on (number), or (relativenumber), os (spell), ot (colorcolumn), ou (cursorcolumn), ov (virtualedit), ow (wrap), ox (cursorline cursorcolumn), u (encode/decode urls), y (C-string style escaping), n (conflict marker), a (args), b (buffers), l (location), q (quickfix), t (tag), >p Paste after linewise, increasing indent, >P (Paste before linewise, increasing indent), <p (Paste after linewise, decreasing indent), <P (Paste before linewise, decreasing indent), =p (Paste after linewise, reindenting), =P (Paste before linewise, reindenting), x<motion> (xml encode/decode)
  -- { "puremourning/vimspector", cmd = { "VimspectorInstall", "VimspectorUpdate" } },
  { "lervag/vimtex" }, -- ft = "tex" },
  -- { "axvr/zepl.vim" },
  -- { "svban/YankAssassin.vim" },
  -- { "sudormrfbin/cheatsheet.nvim", cmd = { "Cheatsheet", "CheatsheetEdit" } },
  ["p00f/clangd_extensions.nvim"] = { -- "clangd_extensions" (((
    -- https://github.com/wbthomason/packer.nvim/issues/810
    -- requires = { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" }, -- make sure to load after lsp stuff
    ft = { "c", "cpp", "cuda" },
    wants = { "nvim-lsp-installer", "nvim-lspconfig" }, -- make sure to load after lsp stuff
    config = function()
      require("clangd_extensions").setup {
        server = astronvim.lsp.server_settings "clangd",
      }
    end,
  }, -- end "clangd_extensions" )))
  -- ["hrsh7th/cmp-emoji"] = { -- "cmp-emoji" (((
  --   ft = {
  --     "asciidoc",
  --     "changelog",
  --     "context",
  --     "DiffviewFiles",
  --     "gitcommit",
  --     "Neogitcommit",
  --     "NeogitCommit",
  --     "NeogitCommitMessage",
  --     "lsp_markdown",
  --     "mail",
  --     "markdown",
  --     "rst",
  --     "rtf",
  --     "tex",
  --     "texinfo",
  --     "text",
  --     "txt",
  --   },
  --   config = function()
  --     astronvim.add_user_cmp_source "emoji"
  --   end,
  -- }, -- end "cmp-emoji" )))
  -- ["petertriho/cmp-git"] = { -- "cmp-git" (((
  --   after = "nvim-cmp",
  --   config = function()
  --     require("cmp_git").setup {
  --       -- other defaults
  --       filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
  --     }
  --     astronvim.add_user_cmp_source "git"
  --   end,
  -- }, -- end "cmp-git" )))
  --   ["octaltree/cmp-look"] = { -- "cmp-look" (((
  --   after = "nvim-cmp",
  --   config = function()
  --     astronvim.add_user_cmp_source {
  --       name = "look",
  --       max_item_count = 7,
  --       keyword_length = 2,
  --       option = { convert_case = true, loud = true },
  --     }
  --   end,
  -- }, -- end "cmp-look" )))
  { "gpanders/editorconfig.nvim" },
  -- {
  --   "akinsho/git-conflict.nvim", -- A plugin to visualise and resolve merge conflicts in neovim
  --   config = function()
  --     require("git-conflict").setup()
  --   end,
  -- },
  { "ellisonleao/glow.nvim", cmd = { "Glow", "GlowInstall" } },
  -- ["JASONews/glow-hover"] = { after = "nvim-lsp-installer" },
  -- ["lukas-reineke/headlines.nvim"] = { -- This plugin adds 3 kind of horizontal highlights for text filetypes, like `markdown`, `vimwiki` and `orgmode`
  --   ft = { "lsp_markdown", "markdown", "rmd" },
  --   config = function()
  --     require("headlines").setup {
  --       -- markdown = {
  --       --   headline_highlights = { "DiagnosticVirtualTextInfo" },
  --       --   dash_string = "―",
  --       -- },
  --       -- lsp_markdown = {
  --       --   headline_highlights = { "DiagnosticVirtualTextInfo" },
  --       --   dash_string = "―",
  --       -- },
  --       -- rmd = {
  --       --   headline_highlights = { "DiagnosticVirtualTextInfo" },
  --       --   dash_string = "―",
  --       -- },
  --     }
  --   end,
  -- },
  -- ["hkupty/iron.nvim"] = {
  --   config = function()
  --     local iron = require "iron.core"
  --     iron.setup {
  --       config = {
  --         highlight_last = "IronLastSent", -- Highlights the last sent block with bold
  --         should_map_plug = true, -- If iron should expose `<plug>(...)` mappings for the plugins
  --         scratch_repl = true, -- Whether a repl should be discarded or not
  --         close_window_on_exit = true, -- Automatically closes the repl window on process end
  --         -- Your repl definitions come here
  --         repl_definition = {
  --           sh = {
  --             command = { "zsh" },
  --           },
  --           python = require("iron.fts.python").ipython,
  --           -- forcing a default
  --         },
  --         -- repl_open_cmd = require("iron.view").curry.right(60),
  --         -- repl_open_cmd = "belowright 15 split",
  --         -- repl_open_cmd = "belowright 60 vsplit",
  --         -- Alternatively, pass a function, which is evaluated when a repl is open.
  --         repl_open_cmd = require("iron.view").curry.right(function()
  --           return vim.o.columns / 2
  --         end),
  --         -- how the REPL window will be opened, the default is opening a float window of height 40 at the bottom.
  --         buflisted = false, -- If the repl buffer is listed
  --       },
  --     }
  --   end,
  -- },
  { "rebelot/kanagawa.nvim" }, -- event = "BufRead" },
  {
    "ray-x/lsp_signature.nvim",
    -- after = "nvim-cmp",
    -- event = "InsertCharPre",
    -- event = "InsertEnter",
    event = "BufRead",
    config = function()
      local signature_config = {
        -- log_path = vim.fn.expand "$HOME" .. "/tmp/sig.log",
        hi_parameter = "Visual",
        -- hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlighted
        debug = true,
        hint_enable = false,
        -- handler_opts = { border = "single" },
        fix_pos = true,
        -- floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- floating_window_off_x = 75, -- adjust float windows x position.
        -- floating_window_off_y = -10, -- adjust float windows y position.
        max_width = 80,
        max_height = 10, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        toggle_key = "<A-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
        doc_lines = 5,
        zindex = 50, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
        -- transparency = 90, -- disabled by default, allow floating win transparent value 1~100
      }
      require("lsp_signature").setup(signature_config)
    end,
  },
  -- {
  --   "chentoast/marks.nvim",
  --   config = function()
  --     require("marks").setup {}
  --   end,
  -- },
  {
    "echasnovski/mini.nvim", -- refer to: https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/plugins/mini.lua, https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/autocmds.lua
    -- event = "VimEnter",
    keys = { "sa", "sd", "sr", "sf", "sF", "sn" },
    config = function()
      require("mini.surround").setup()
    end,
  },
  ["jghauser/mkdir.nvim"] = { event = "BufWritePre" },
  ["jbyuki/nabla.nvim"] = { module = "nabla" },
  ["danymat/neogen"] = { -- A better annotation generator. Supports multiple languages and annotation conventions
    cmd = { "Neogen", "Neogen func", "Neogen class", "Neogen file", "Neogen type" },
    config = function()
      require("neogen").setup {
        snippet_engine = "luasnip",
        languages = {
          ruby = {
            template = {
              annotation_convention = "tomdoc",
            },
          },
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
          typescript = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
          typescriptreact = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
        },
      }
    end,
  },
  {
    "TimUntersberger/neogit",
    requires = {
      {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
      },
    },
    cmd = { "Neogit" },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  },
  -- {
  --   "Shatur/neovim-cmake",
  --   ft = { "c", "cpp", "cmake", "fortran" },
  --   requires = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("cmake").setup({})
  --   end,
  -- },
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
  {
    "klen/nvim-config-local", -- fastest among all local-rc plugins
    -- after = "project.nvim",
    event = "BufReadPost",
    tag = "1.1.1",
    -- commit = "3f1e788",
    config = function()
      require("config-local").setup {}
    end,
  },
  -- { "jenterkin/vim-autosource" }, -- 2nd fastest among all local-rc plugins
  -- { "embear/vim-localvimrc" }, -- 3rd fastest among all local-rc plugins
  -- { "ii14/exrc.vim" }, -- slowest among all local-rc plugins
  -- {
  --   "mfussenegger/nvim-dap",
  --   -- module = "dap",
  --   config = require "user.plugins.nvim-dap",
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   requires = { "mfussenegger/nvim-dap" },
  --   -- config = function()
  --   --   require("dapui").setup {}
  --   -- end,
  --   config = require "user.plugins.nvim-dap",
  -- },
  {
    "https://gitlab.com/yorickpeterse/nvim-dd", -- Deferring of NeoVim diagnostics
    -- event = { "CursorHold" },
    event = { "InsertLeave" },
    config = function()
      require("dd").setup {
        timeout = 600, -- The time to wait before displaying newly produced diagnostics.
      }
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    keys = { "/", "?", "q/", "q?", "*", "#", "g*", "g#", "n", "N" },
    config = function()
      require("hlslens").setup { calm_down = true }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    -- event = { "BufRead" },
    -- event = { "VimLeavePre", "ExitPre" },
    event = { "BufWinEnter" },
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help", "terminal", "lsp-installer", "lspinfo" },
        lastplace_ignore_filetype = {
          "DiffviewFiles",
          "gitcommit",
          "Neogitcommit",
          "NeogitCommit",
          "NeogitCommitMessage",
          "gitrebase",
          "svn",
          "hgcommit",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NeogitStatus",
          "NeogitPopup",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("nvim-lightbulb").setup {
        sign = { enabled = false },
        virtual_text = { enabled = true },
        autocmd = { enabled = true },
      }
    end,
  },
  { "mfussenegger/nvim-lint", module = "lint" },
  ["https://gitlab.com/yorickpeterse/nvim-pqf"] = {
    config = function()
      require("pqf").setup()
    end,
  },
  ["sitiom/nvim-numbertoggle"] = {
    config = function()
      require("numbertoggle").setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    after = "nvim-treesitter", -- this is a separate plugin, which requires a separate configuration
    config = function()
      require("treesitter-context").setup {}
    end,
  },
  { "eddiebergman/nvim-treesitter-pyfold", requires = { "nvim-treesitter/nvim-treesitter" }, ft = "python" },
  { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  -- { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" },
  -- {
  --   "s1n7ax/nvim-window-picker",
  --   tag = 'v1.*',
  --   -- after = "neo-tree",
  --   config = function()
  --     require'window-picker'.setup()
  --   end,
  -- },
  { "samjwill/nvim-unception" }, -- A plugin that leverages Neovim's native client-server feature to make opening files from within Neovim's terminal emulator without experiencing weird behavior easier and completely automatic.
  {
    "ahmedkhalf/project.nvim",
    after = "telescope.nvim",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".root", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        silent_chdir = false,
      }
      require("telescope").load_extension "projects"
    end,
  },
  ["stevearc/qf_helper.nvim"] = {
    event = { "QuickFixCmdPre", "QuickFixCmdPost" },
    cmd = {
      "QNext",
      "QNext!",
      "QPrev",
      "QPrev!",
      "QFNext",
      "QFNext!",
      "QFPrev",
      "QFPrev!",
      "LLNext",
      "LLNext!",
      "LLPrev",
      "LLPrev!",
      "QFOpen",
      "QFOpen!",
      "LLOpen",
      "LLOpen!",
      "QFToggle",
      "QFToggle!",
      "LLToggle",
      "LLToggle!",
      "Keep",
      "Reject",
    },
    config = function()
      require("qf_helper").setup {
        quickfix = {
          min_height = 5, -- Min qf height when using open() or toggle()
        },
      }
    end,
  },
  {
    "linty-org/readline.nvim",
    event = { "InsertCharPre", "CmdlineEnter" },
    config = function()
      local readline = require "readline"
      vim.keymap.set("!", "<M-f>", readline.forward_word)
      vim.keymap.set("!", "<M-b>", readline.backward_word)
      vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
      vim.keymap.set("!", "<C-e>", readline.end_of_line)
      vim.keymap.set("!", "<M-d>", readline.kill_word)
      vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
      vim.keymap.set("!", "<C-w>", readline.unix_word_rubout)
      vim.keymap.set("c", "<C-k>", readline.kill_line)
      vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
      vim.keymap.set({ "i" }, "<C-f>", "<Right>")
      vim.keymap.set("!", "<C-b>", "<Left>")
    end,
  },
  {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function()
      require("sniprun").setup {
        -- selected_interpreters = { "Python3_jupyter" },
        selected_interpreters = { "Python3_fifo" },
        --# you can combo different display modes as desired
        display = {
          -- "Classic", --# display results in the command-line  area
          -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
          "VirtualTextErr", --# display error results as virtual text
          -- "TempFloatingWindow", --# display results in a floating window
          "LongTempFloatingWindow", --# same as above, but only long results. To use with VirtualText__
          -- "Terminal",                --# display results in a vertical split
          -- "TerminalWithCode",        --# display results and code history in a vertical split
          -- "NvimNotify",              --# display with the nvim-notify plugin
          -- "Api"                      --# return output to a programming interface
        },
        repl_enable = {
          "Python3_fifo",
          "Bash_original",
          "Julia_jupyter",
          "GFM_original",
          "Mathematica_original",
          "R_original",
          "Sage_fifo",
        },
        -- borders = "none",
        -- borders = "shadow",
        -- interpreter_options = {
        --   Python3_fifo = {
        --     intepreter = "python3.9",
        --     venv = { "venv_project1", "venv_project2", "../venv_project2" },
        --   },
        -- },
      }
    end,
    -- keys = { "<leader>r" },
    keys = { "<Plug>SnipRun", "<Plug>SnipRunOperator" },
    cmd = {
      "SnipRun",
      "<Plug>SnipRun",
      "SnipRunOperator",
      "<Plug>SnipRunOperator",
      "SnipReset",
      "SnipClose",
      "SnipInfo",
      "SnipReplMemoryClean",
      "SnipTerminate",
    },
  },
  -- ["abecodes/tabout.nvim"] = {
  --   after = "nvim-cmp",
  --   config = function()
  --     require("tabout").setup {
  --       tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
  --       backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
  --       act_as_tab = true, -- shift content if tab out is not possible
  --       act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  --       default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  --       default_shift_tab = "<C-d>", -- reverse shift default action,
  --       enable_backwards = true, -- well ...
  --       completion = true, -- if the tabkey is used in a completion pum
  --       tabouts = {
  --         { open = "'", close = "'" },
  --         { open = '"', close = '"' },
  --         { open = "`", close = "`" },
  --         { open = "(", close = ")" },
  --         { open = "[", close = "]" },
  --         { open = "{", close = "}" },
  --       },
  --       ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  --       exclude = {}, -- tabout will ignore these filetypes
  --     }
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics",
      }
    end,
  },
  -- {
  --   "lewis6991/spellsitter.nvim",
  --   config = function()
  --     require("spellsitter").setup {
  --       -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
  --       -- enable = true,
  --     }
  --   end,
  -- },
  -- {
  --   "luukvbaal/stabilize.nvim",
  --   config = function()
  --     require("stabilize").setup {
  --       nested = "QuickFixCmdPost,DiagnosticChanged *",
  --     }
  --   end,
  -- },
  -- ["benfowler/telescope-luasnip.nvim"] = {
  --   after = "telescope.nvim",
  --   module = "telescope._extensions.luasnip",
  --   config = function()
  --     require("telescope").load_extension "luasnip"
  --   end,
  -- },
  ["johmsalas/text-case.nvim"] = {
    -- keys = { "ga" },
    config = function()
      require("textcase").setup {}
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    requires = "PlatyPew/format-installer.nvim",
    after = "nvim-lspconfig", -- To prevent null-ls from failing to read buffer
    config = function()
      local null_ls = require "null-ls"
      local formatter_install = require "format-installer"
      local sources = {
        -- insert any manual sources you want here
        -- null_ls.builtins.formatting.clang_format,
      }
      for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
        local config = { command = formatter.cmd }
        table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
      end

      null_ls.setup {
        sources = sources,
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.api.nvim_create_autocmd("BufWritePre", {
              desc = "Auto format before save",
              pattern = "<buffer>",
              callback = function()
                vim.lsp.buf.formatting_sync()
              end,
            })
          end
        end,
      }
    end,
  },

  -- ))) -- ends "additional plugins"
} -- end of 'plugins.init' table

-- Other plugins to consider (((

-- Other lua plugins (((

-- TODO (((

-- 1. Compiling
-- 2. Unit Testing
-- 3. Debugging
-- 4. Tmux integration

-- )))

-- dap notes and hyperlinks (((

-- https://gist.github.com/mehalter/b02b1d35499b650290d89badf0f2abac
-- https://www.reddit.com/r/neovim/comments/silikv/debugging_in_neovim/?sort=old
-- https://github.com/datamonsterr/astronvim_config/blob/main/which-key/mode/n.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/nvim-dap.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/nvim-dapui.lua
-- https://git.mehalter.com/mehalter/AstroNvim_user/src/branch/master/which-key/register_mappings.lua
-- https://code.mehalter.com/projects/68

-- )))

-- Something in my config is messing up URL highlights. Need to investigate
-- https://superuser.com/questions/1485332/how-to-clear-neovim-buffer
-- https://github.com/0styx0/abbreinder.nvim  -- Abbreviation reminder plugin for Neovim 0.5+
-- https://github.com/emmanueltouzery/agitator.nvim
-- https://github.com/henriquehbr/ataraxis.lua  -- A simple zen mode for improving code readability on neovim
-- https://github.com/rmagatti/auto-session  -- A small automated session manager for Neovim
-- https://github.com/protex/better-digraphs.nvim  -- Better digraphs plugin based on idea from Damian Conway
-- https://github.com/jceb/blinds.nvim  -- blinds.nvim emphasizes the current window by shading the non-active windows
-- https://github.com/MordechaiHadad/bob  -- A version manager for neovim
-- https://github.com/lalitmee/browse.nvim  -- browse for anything using your choice of method
-- use { "numtostr/BufOnly.nvim", cmd = { "BufOnly" } }  -- Lua/Neovim port of BufOnly.vim with some changes
-- use { "kwkarlwang/bufresize.nvim" }  --  Keep buffer dimensions in proportion when terminal window is resized
-- https://github.com/saifulapm/chartoggle.nvim  -- Toggle character in Neovim
-- use { "kazhala/close-buffers.nvim", cmd = {} }  -- Delete multiple vim buffers based on different conditions
-- https://github.com/Civitasv/cmake-tools.nvim  --  CMake integration in Neovim
-- https://github.com/rcarriga/cmp-dap  -- nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
-- use { "andersevenrud/cmp-tmux" }  -- Tmux completion source for nvim-cmp and nvim-compe
-- https://github.com/xeluxee/competitest.nvim -- CompetiTest.nvim is a Neovim plugin to automate testcases management and checking for Competitive Programming
-- https://github.com/zbirenbaum/copilot-cmp -- Lua plugin to turn github copilot into a cmp source
-- https://github.com/p00f/cphelper.nvim -- Neovim helper for competitive programming. https://sr.ht/~p00f/cphelper.nvim preferred
-- https://github.com/Pocco81/dap-buddy.nvim
-- https://github.com/jbyuki/dash.nvim
-- https://github.com/monaqa/dial.nvim
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/narutoxy/dim.lua
-- https://github.com/tjdevries/diff-therapy.nvim -- resolve those conflicts and have a happy relationship with git
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/chipsenkbeil/distant.nvim  -- Edit files, run programs, and work with LSP on a remote machine from the comfort of your local environment construction
-- use { "stevearc/dressing.nvim" }
-- https://github.com/NFrid/due.nvim
-- use { "j-hui/fidget.nvim" }
-- https://github.com/Furkanzmc/firvish.nvim
-- https://github.com/ruifm/gitlinker.nvim
-- https://github.com/ThePrimeagen/git-worktree.nvim
-- https://github.com/ray-x/go.nvim
-- https://github.com/olexsmir/gopher.nvim/  -- Neovim plugin for make golang development easiest
-- use { "rmagatti/goto-preview", event = { "CursorHold" } }
-- https://github.com/beauwilliams/focus.nvim
-- https://github.com/pierreglaser/folding-nvim
-- https://github.com/kalvinpearce/gitignore-gen.nvim
-- https://github.com/p00f/godbolt.nvim
-- https://github.com/brymer-meneses/grammar-guard.nvim
-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/Pocco81/HighStr.nvim
-- https://github.com/m-demare/hlargs.nvim
-- https://github.com/lewis6991/hover.nvim --  Hover plugin framework for Neovim
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
-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
-- https://github.com/aspeddro/lsp_menu.nvim
-- https://github.com/jubnzv/mdeval.nvim
-- https://github.com/p00f/mdpreview.nvim
-- https://github.com/numToStr/Navigator.nvim
-- https://github.com/nyngwang/NeoClear.lua
-- https://github.com/sbdchd/neoformat
-- https://github.com/nyngwang/NeoNoName.lua
-- https://github.com/nvim-neotest/neotest  --  An extensible framework for interacting with tests within NeoVim.
-- use { "nyngwang/NeoZoom.lua" }
-- https://github.com/miversen33/netman.nvim -- Neovim (Lua powered) Network File Manager
-- https://github.com/nacro90/numb.nvim
-- use { "kevinhwang91/nvim-bqf", ft = "qf", event = { "CursorHold" } }
-- https://github.com/ojroques/nvim-bufdel
-- https://github.com/s1n7ax/nvim-comment-frame  -- Detects the language using treesitter and adds a comment block
-- https://github.com/haringsrob/nvim_context_vt
-- https://github.com/yamatsum/nvim-cursorline
-- https://github.com/xiyaowong/nvim-cursorword
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/mfussenegger/nvim-dap-python
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/esensar/nvim-dev-container -- Neovim dev container support
-- https://github.com/AllenDang/nvim-expand-expr
-- https://github.com/sakhnik/nvim-gdb
-- https://github.com/booperlv/nvim-gomove
-- https://github.com/SmiteshP/nvim-gps
-- https://github.com/gennaro-tedesco/nvim-jqx
-- https://github.com/nanotee/nvim-lua-guide -- A guide to using Lua in Neovim
-- https://github.com/geg2102/nvim-python-repl
-- https://github.com/bennypowers/nvim-regexplainer
-- use { "petertriho/nvim-scrollbar" }
-- https://github.com/dstein64/nvim-scrollview
-- https://github.com/AckslD/nvim-trevJ.lua
-- use { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
-- https://github.com/yioneko/nvim-yati -- Yet another tree-sitter powered indent plugin for Neovim
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
-- https://github.com/gbprod/substitute.nvim
-- use { "ur4ltz/surround.nvim" }
-- { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
-- https://github.com/nvim-telescope/telescope-bibtex.nvim
-- use { "nvim-telescope/telescope-media-files.nvim" }
-- use { "nvim-telescope/telescope-packer.nvim" }
-- use { "cljoly/telescope-repo.nvim" }
-- https://github.com/TC72/telescope-tele-tabby.nvim
-- https://github.com/da-moon/telescope-toggleterm.nvim
-- https://github.com/mcauley-penney/tidy.nvim
-- https://github.com/aserowy/tmux.nvim
-- use { "folke/todo-comments.nvim" } -- :ToDoQuickFix, :ToDoTrouble, :ToDoTelescope,
-- https://github.com/jedrzejboczar/toggletasks.nvim
-- https://github.com/drybalka/tree-climber.nvim -- Plugin for easy navigation around the syntax-tree produced by the treesitter that also works in comments and multi-language files!
-- https://github.com/David-Kunz/treesitter-unit/
-- https://github.com/Pocco81/TrueZen.nvim
-- use { "folke/twilight.nvim", cmd = { "ZenMode", "Twilight", "TwilightEnable" } }
-- https://github.com/axieax/urlview.nvim
-- https://github.com/psliwka/vim-dirtytalk
-- https://github.com/RRethy/vim-illuminate
-- https://github.com/rcarriga/vim-ultest
-- https://github.com/lukas-reineke/virt-column.nvim -- Display a character as the colorcolumn
-- https://github.com/xiyaowong/virtcolumn.nvim  -- Display a line as the colorcolumn
-- https://github.com/jubnzv/virtual-types.nvim  -- A Neovim plugin that shows type annotations as virtual text
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
-- use { "ludovicchabant/vim-gutentags", event = { "CursorHold" } } -- , event = "BufWinEnter" }
-- https://github.com/azabiong/vim-highlighter
-- use { "petRUShka/vim-opencl", ft = { "opencl" } }  -- note: slow plugin on remote systems
-- https://github.com/ojroques/vim-oscyank
-- https://github.com/thinca/vim-quickrun
-- https://github.com/4513ECHO/vim-readme-viewer
-- use { "urbainvaes/vim-ripple" }  -- REPL
-- use { "Konfekt/vim-sentence-chopper" }
-- https://github.com/jpalardy/vim-slime
-- use { "scrooloose/vim-slumlord", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } } -- also a telescope extension
-- https://github.com/marklcrns/vim-smartq
-- https://github.com/svermeulen/vim-subversive  -- Vim plugin providing operator motions to quickly replace text
-- https://github.com/Matt-A-Bennett/vim-surround-funk
-- https://github.com/mroavi/vim-tomux
-- https://github.com/inkarkat/vim-UnconditionalPaste
-- https://github.com/erietz/vim-terminator
-- https://github.com/Julian/vim-textobj-variable-segment
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

-- )))

-- )))
