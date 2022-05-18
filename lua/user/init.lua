-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- 'kind_icons' (((

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  -- Constructor = "",
  Constructor = "",
  -- Field = " ",
  Field = "ﰠ",
  -- Variable = " ",
  Variable = "",
  -- Class = " ",
  -- Class = "",
  Class = "ﴯ",
  Interface = "",
  -- Interface = " ",
  -- Module = " ",
  Module = "",
  -- Property = " ",
  Property = "",
  -- Unit = " ",
  Unit = "塞",
  -- Value = " ",
  Value = "",
  -- Enum = " ",
  Enum = "",
  -- Keyword = " ",
  Keyword = "",
  -- Snippet = " ",
  Snippet = "",
  -- Color = " ",
  Color = "",
  -- File = " ",
  File = "",
  -- Reference = " ",
  -- Reference = "",
  Reference = "",
  -- Folder = " ",
  Folder = "",
  -- EnumMember = " ",
  EnumMember = "",
  -- Constant = " ",
  -- Constant = "",
  Constant = "",
  -- Struct = " ",
  Struct = "פּ",
  -- Struct = "" ,
  -- Event = " ",
  Event = "",
  -- Operator = " ",
  Operator = "",
  -- TypeParameter = " ",
  TypeParameter = "",
}

-- )))

-- AstroNvim user-config table (((

local config = {

  -- Startscreen/greeter header (((

  header = {
    " ",
  },

  -- )))

  -- set colorscheme (((

  -- colorscheme = "default_theme",
  colorscheme = "kanagawa",

  -- )))

  -- Set vim options in this lua function (((

  -- NOTE: Only my preferred settings that are not set by AstroNvim are set here
  options = function(defaults)
    defaults.g.loaded_netrwPlugin = nil
    defaults.g.mapleader = "\\" -- sets vim.g.mapleader
    -- defaults.g.null_ls_disable = false

    return vim.tbl_deep_extend("force", defaults, {
      -- vim.opt settings (((

      opt = {
        -- Backup-related settings (((

        backupdir = vim.opt.backupdir - { "." },
        backupext = "nvimbackup",

        -- )))
        -- 'fillchar' settings (((

        -- https://vi.stackexchange.com/questions/21872/change-fold-sign-character
        fillchars = {
          foldclose = "▸",
          foldopen = "▾",
          foldsep = "│",
          horiz = "━",
          -- horiz = '━',
          horizdown = "┳",
          -- horizdown = '┳',
          horizup = "┻",
          -- horizup = '┻',
          vert = "┃",
          -- vert = '┃',
          verthoriz = "╋",
          -- verthoriz = '╋',
          vertleft = "┫",
          -- vertleft  = '┫',
          vertright = "┣",
          -- vertright = '┣',
        },

        -- )))
        -- Scroll-related settings (scrolljump, sidescroll) (((

        scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
        sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
        -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
        -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally

        -- )))
        -- Indent wrapped lines (((

        wrap = true,
        linebreak = true, -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
        breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.

        -- )))
        -- Fold settings (((

        foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
        foldlevelstart = 2,
        foldcolumn = "4",
        -- foldopen=all, -- helps to avoid automatic closing of previously open folds when returning to a buffer

        -- )))
        -- Settings for showing matching parenthesis (((

        showmatch = true,
        matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

        -- )))
        -- All other lua-based options (((

        clipboard = "",
        conceallevel = 2,
        confirm = true, -- Give me a prompt instead of just rejecting risky :write, :saveas
        cursorlineopt = "number",
        foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
        foldmethod = "expr",
        guifont = "monospace:h17", -- the font used in graphical neovim applications
        history = 10000,
        -- inccommand = "split",
        infercase = true, -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
        iskeyword = vim.opt.iskeyword + { "-" },
        lazyredraw = true, -- Don't redraw the screen during batch execution
        list = true,
        listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
        -- listchars = { tab = "▸", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
        pumwidth = 35,
        showbreak = "↪ ",
        signcolumn = "yes:1",
        softtabstop = 2, -- how many spaces to insert with tab key
        -- spell = true,
        -- spelllang = "en_gb",
        report = 0, -- Threshold for reporting number of lines changed.
        updatecount = 100, -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
        winaltkeys = "no",
        wildignorecase = true, -- If supported, make wildmenu completions case-insensitive

        -- )))
        -- Commented-out settings (((

        -- numberwidth = 4, -- set number column width
        -- relativenumber = true, -- sets vim.opt.relativenumber
        -- tagcase = "smart",
        timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds). AstroNvim sets this to 300.

        -- )))
      },

      -- )))
    })
  end,

  -- )))

  -- Default theme configuration (((

  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = function(C)
      C.telescope_green = C.green
      C.telescope_red = C.red
      C.telescope_fg = C.fg
      C.telescope_bg = C.black_1
      C.telescope_bg_alt = C.bg_1
      return C
    end,
    highlights = function(hl)
      local C = require "default_theme.colors"
      hl.TelescopeBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg }
      hl.TelescopeNormal = { bg = C.telescope_bg }
      hl.TelescopePreviewBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
      hl.TelescopePreviewNormal = { bg = C.telescope_bg }
      hl.TelescopePreviewTitle = { fg = C.telescope_bg, bg = C.telescope_green }
      hl.TelescopePromptBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg_alt }
      hl.TelescopePromptNormal = { fg = C.telescope_fg, bg = C.telescope_bg_alt }
      hl.TelescopePromptPrefix = { fg = C.telescope_red, bg = C.telescope_bg_alt }
      hl.TelescopePromptTitle = { fg = C.telescope_bg, bg = C.telescope_red }
      hl.TelescopeResultsBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
      hl.TelescopeResultsNormal = { bg = C.telescope_bg }
      hl.TelescopeResultsTitle = { fg = C.telescope_bg, bg = C.telescope_bg }
      return hl
    end,
  },

  --- )))

  -- Disable AstroNvim ui features (((

  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- )))

  -- 'plugins' table (((

  plugins = {

    -- `plugins.init` table for adding new plugins and disabling/modifying default plugins (((

    init = {
      -- Disable/modify AstroNvim built-in plugins (((

      ["max397574/better-escape.nvim"] = { disable = true },
      ["norcalli/nvim-colorizer.lua"] = { event = { nil }, ft = { "html", "javascript", "css" } },
      ["rcarriga/nvim-notify"] = { disable = true },
      ["windwp/nvim-ts-autotag"] = { after = { nil }, ft = { "html", "vue", "php" } },
      ["p00f/nvim-ts-rainbow"] = { disable = true },

      -- )))

      -- Additional plugins (((

      -- Add plugins (packer syntax without the "use" keyword)
      -- { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
      -- { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
      -- { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
      { "tyru/capture.vim", cmd = { "Capture" } },
      { "kenn7/vim-arsync", cmd = { "ARshowConf", "ARsyncUp", "ARsyncUpDelete", "ARsyncDown" } },
      -- { "jeffkreeftmeijer/vim-numbertoggle", event = { "InsertEnter", "FocusLost" } },
      {
        "Konfekt/vim-DetectSpellLang",
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
      },
      {
        "dbmrq/vim-dialect",
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
      },
      { "andymass/vim-matchup", after = "nvim-treesitter" },
      { "tpope/vim-unimpaired", keys = { "[", "]" } }, -- e (exchange), ob (background), oc (cursorline), od (diff), oh (hlsearch), oi (ignorecase), ol (list), on (number), or (relativenumber), os (spell), ot (colorcolumn), ou (cursorcolumn), ov (virtualedit), ow (wrap), ox (cursorline cursorcolumn), u (encode/decode urls), y (C-string style escaping), n (conflict marker), a (args), b (buffers), l (location), q (quickfix), t (tag), >p Paste after linewise, increasing indent, >P (Paste before linewise, increasing indent), <p (Paste after linewise, decreasing indent), <P (Paste before linewise, decreasing indent), =p (Paste after linewise, reindenting), =P (Paste before linewise, reindenting), x<motion> (xml encode/decode)
      { "lervag/vimtex", ft = "tex" },
      { "svban/YankAssassin.vim" },
      { "sudormrfbin/cheatsheet.nvim", cmd = { "Cheatsheet", "CheatsheetEdit" } },
      {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp", "cuda" },
        config = function()
          require("clangd_extensions").setup {
            server = {
              cmd = { vim.fn.stdpath "data" .. "/lsp_servers/clangd/clangd/bin/clangd" },
              capabilities = {
                offsetEncoding = "utf-8",
                memoryUsageProvider = true,
              },
              on_attach = require("configs.lsp.handlers").on_attach,
            },
          }
        end,
      },
      ["hrsh7th/cmp-buffer"] = {
        config = function()
          astronvim.add_user_cmp_source(require("user.cmp_sources").buffer_source)
        end,
      },
      {
        "hrsh7th/cmp-emoji",
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
        config = function()
          astronvim.add_user_cmp_source "emoji"
        end,
      },
      ["petertriho/cmp-git"] = {
        after = "nvim-cmp",
        config = function()
          require("cmp_git").setup {
            -- other defaults
            filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
          }
          astronvim.add_user_cmp_source "git"
        end,
      },
      {
        "octaltree/cmp-look",
        after = "nvim-cmp",
        config = function()
          astronvim.add_user_cmp_source {
            name = "look",
            max_item_count = 7,
            keyword_length = 2,
            option = { convert_case = true, loud = true },
          }
        end,
      },
      { "gpanders/editorconfig.nvim" },
      -- {
      --   "akinsho/git-conflict.nvim", -- A plugin to visualise and resolve merge conflicts in neovim
      --   config = function()
      --     require("git-conflict").setup()
      --   end,
      -- },
      {
        "ellisonleao/glow.nvim",
        ft = { "markdown", "lsp_markdown", "rmd" },
        cmd = { "Glow", "GlowInstall" },
      },
      ["lukas-reineke/headlines.nvim"] = {
        ft = { "lsp_markdown", "markdown", "rmd" },
        config = function()
          require("headlines").setup {
            -- markdown = {
            --   headline_highlights = { "DiagnosticVirtualTextInfo" },
            --   dash_string = "―",
            -- },
            -- lsp_markdown = {
            --   headline_highlights = { "DiagnosticVirtualTextInfo" },
            --   dash_string = "―",
            -- },
            -- rmd = {
            --   headline_highlights = { "DiagnosticVirtualTextInfo" },
            --   dash_string = "―",
            -- },
          }
        end,
      },
      { "rebelot/kanagawa.nvim" },
      {
        "ray-x/lsp_signature.nvim",
        event = "InsertCharPre",
        config = function()
          local signature_config = {
            -- log_path = vim.fn.expand "$HOME" .. "/tmp/sig.log",
            debug = true,
            hint_enable = false,
            -- handler_opts = { border = "single" },
            fix_pos = true,
            max_width = 70,
            -- toggle_key = "<A-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
          }
          require("lsp_signature").setup(signature_config)
        end,
      },
      {
        "echasnovski/mini.nvim",
        -- event = "VimEnter",
        keys = { "sa", "sd", "sr" },
        config = function()
          require("mini.surround").setup()
        end,
      },
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
      {
        "nkakouros-original/numbers.nvim",
        event = "InsertCharPre",
        config = function()
          require("numbers").setup {
            excluded_filetypes = {
              "alpha",
              "TelescopePrompt",
              "TelescopeResults",
              "nerdtree",
              "unite",
            },
          }
        end,
      },
      {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
      },
      {
        "klen/nvim-config-local",
        tag = "1.1.1",
        config = function()
          require("config-local").setup {}
        end,
      }, -- fastest among all local-rc plugins
      -- { "jenterkin/vim-autosource" }, -- 2nd fastest among all local-rc plugins
      -- { "embear/vim-localvimrc" }, -- 3rd fastest among all local-rc plugins
      -- { "ii14/exrc.vim" }, -- slowest among all local-rc plugins
      {
        "https://gitlab.com/yorickpeterse/nvim-dd", -- Deferring of NeoVim diagnostics
        event = { "CursorHold" },
        config = function()
          require("dd").setup {
            timeout = 500, -- The time to wait before displaying newly produced diagnostics.
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
        event = { "BufRead" },
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
      {
        "mfussenegger/nvim-lint",
        module = "lint",
      },
      -- { "jamestthompson3/nvim-remote-containers" },
      {
        "romgrk/nvim-treesitter-context",
        after = "nvim-treesitter", -- this is a separate plugin, which requires a separate configuration
        config = function()
          require("treesitter-context").setup {}
        end,
      },
      {
        "eddiebergman/nvim-treesitter-pyfold",
        ft = "python",
      },
      {
        "nvim-treesitter/nvim-treesitter-refactor",
        after = "nvim-treesitter",
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
      },
      -- {
      --   "s1n7ax/nvim-window-picker",
      --   tag = 'v1.*',
      --   -- after = "neo-tree",
      --   config = function()
      --     require'window-picker'.setup()
      --   end,
      -- },
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
      ["abecodes/tabout.nvim"] = {
        after = "nvim-cmp",
        config = function()
          require("tabout").setup {
            tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
            default_shift_tab = "<C-d>", -- reverse shift default action,
            enable_backwards = true, -- well ...
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
              { open = "'", close = "'" },
              { open = '"', close = '"' },
              { open = "`", close = "`" },
              { open = "(", close = ")" },
              { open = "[", close = "]" },
              { open = "{", close = "}" },
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {}, -- tabout will ignore these filetypes
          }
        end,
      },
      {
        "folke/trouble.nvim",
        -- ft = { "c", "cpp", "cuda", "fortran", "lua", "rust" }
        -- keys = { "<leader>xx", "<leader>xw", "<leader>xd", "<leader>xq", "<leader>xl" },
        keys = { "\\xx", "\\xw", "\\xd", "\\xq", "\\xl" },
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
      ["benfowler/telescope-luasnip.nvim"] = {
        after = "telescope.nvim",
        module = "telescope._extensions.luasnip",
        config = function()
          require("telescope").load_extension "luasnip"
        end,
      },

      -- ))) -- ends "additional plugins"
    },

    -- ))) ends 'plugins.init' table

    -- Each entry below overrides the setup() call for default AstroNvim plugins (((

    -- 'aerial' override setup() (((

    aerial = {
      backends = { "treesitter", "lsp", "markdown" },
      min_width = 18,
      icons = kind_icons,
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "}", "}", { silent = true })
        vim.keymap.del("n", "}")
        vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { buffer = bufnr, desc = "Jump backwards in Aerial" })
        vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { buffer = bufnr, desc = "Jump forwards in Aerial" })
        -- Jump up the tree with '[[' or ']]'
        vim.keymap.set("n", "]]", "]]", { silent = true })
        vim.keymap.del("n", "]]")
        vim.keymap.set("n", "[[", "[[", { silent = true })
        vim.keymap.del("n", "[[")
        vim.keymap.set(
          "n",
          "<leader>[",
          "<cmd>AerialPrevUp<cr>",
          { buffer = bufnr, desc = "Jump up and backwards in Aerial" }
        )
        vim.keymap.set(
          "n",
          "<leader>]",
          "<cmd>AerialNextUp<cr>",
          { buffer = bufnr, desc = "Jump up and forwards in Aerial" }
        )
        -- vim.keymap.set('n', '<C-w>o', '<C-w>o:AerialClose<CR>') -- https://github.com/stevearc/aerial.nvim/issues/99
      end,
      placement_editor_edge = true,
      close_behavior = "global",
      highlight_on_hover = true, -- Highlight the symbol in the source buffer when cursor is in the aerial win
      open_automatic = function(bufnr)
        return vim.fn.expand "%:t" ~= "init.lua"
          and not vim.opt.diff:get() -- if not in 'diff' mode
          and vim.api.nvim_buf_line_count(bufnr) > 26 -- Enforce a minimum line count
          and require("aerial").num_symbols(bufnr) > 3 -- Enforce a minimum symbol count
          and not require("aerial").was_closed() -- A useful way to keep aerial closed when closed manually
      end,
      on_first_symbols = function(bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
        if ft == "lua" then
          require("aerial").tree_set_collapse_level(bufnr, 0)
        end
      end,
    },

    -- )))

    -- 'alpha' override setup() (((

    alpha = function(config)
      local buttons = config.layout[4].val
      local new_file = buttons[4]
      new_file.opts.shortcut = new_file.opts.shortcut .. ", ESC, q"

      table.remove(buttons, 4)
      table.insert(buttons, 1, new_file)

      return config
    end,

    -- )))

    -- 'bufferline' override setup() (((

    bufferline = {
      options = {
        -- numbers = "ordinal",
        close_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ""
          end
          local icon = level:match "error" and " " or " "
          return " " .. icon .. count
          -- local s = " "
          -- for e, n in pairs(diagnostics_dict) do
          --   local sym = e == "error" and " "
          --   or (e == "warning" and " " or "" )
          --   s = s .. n .. sym
          -- end
          -- return s
        end,
        -- groups = {
        --   options = {
        --     toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        --   },
        --   items = {
        --     {
        --       name = "Tests", -- Mandatory
        --       highlight = {gui = "underline", guisp = "blue"}, -- Optional
        --       priority = 2, -- determines where it will appear relative to other groups (Optional)
        --       icon = "", -- Optional
        --       matcher = function(buf) -- Mandatory
        --         return buf.name:match('%_test') or buf.name:match('%_spec')
        --       end,
        --     },
        --     {
        --       name = "Docs",
        --       highlight = {gui = "undercurl", guisp = "green"},
        --       auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
        --       matcher = function(buf)
        --         return buf.name:match('%.md') or buf.name:match('%.txt')
        --       end,
        --       separator = { -- Optional
        --         style = require('bufferline.groups').separator.tab
        --       },
        --     }
        --   }
        -- },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            -- highlight = "Directory",
            highlight = "NeoTreeNormalNC",
            text_align = "left",
            padding = 1,
          },
        },
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
            end

            if warning ~= 0 then
              table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
            end

            if hint ~= 0 then
              table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
            end

            if info ~= 0 then
              table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
            end
            return result
          end,
        },
      },
    },

    -- )))

    -- 'cmp' override setup() (((

    cmp = function(config)
      local cmp = require "cmp"
      -- https://github.com/hrsh7th/nvim-cmp/issues/980
      local ELLIPSIS_CHAR = "…"
      local MAX_LABEL_WIDTH = 25
      local MIN_LABEL_WIDTH = 25
      -- https://www.reddit.com/r/neovim/comments/unlj8d/is_there_any_way_to_show_types_in_nvimcmp/?sort=new
      local MIN_MENU_DETAIL_WIDTH = 15
      local MAX_MENU_DETAIL_WIDTH = 15

      return vim.tbl_deep_extend("force", config, {
        -- Yeah, to enable this you will probably need to not lazy load clangd_extensions and add that to your cmp setup override in plugins.cmp and then also modify the lazy loading to load cmp after clangd_extensions
        -- You could probably add a change in your cmp setup to check for the existence of clangd_extensions and add the sorting table if it's available
        -- And then keep the lazy loading for clangd_extensions and at the end of your config function add something like require("configs.cmp").config() to reconfigure cmp once clangd is loaded
        -- But this is a pretty specific use case that would require a non 0 amount of lua knowledge
        -- sorting = {
        --   comparators = {
        --     cmp.config.compare.offset,
        --     cmp.config.compare.exact,
        --     cmp.config.compare.recently_used,
        --     require("clangd_extensions.cmp_scores"),
        --     cmp.config.compare.kind,
        --     cmp.config.compare.sort_text,
        --     cmp.config.compare.length,
        --     cmp.config.compare.order,
        --   },
        -- },
        experimental = {
          ghost_text = true,
        },
        view = {
          entries = { name = "custom", selection_order = "near_cursor" },
        },
        window = {
          documentation = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
            -- border = { " ", " ", " ", " ", " ", " ", " ", " " },
          },
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            -- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-1844480
            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
              vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
            elseif string.len(label) < MIN_LABEL_WIDTH then
              local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
              vim_item.abbr = label .. padding
            end
            -- vim_item.abbr = string.sub(vim_item.abbr, 1, 25)
            -- Source
            local item = entry:get_completion_item()
            if item.detail then
              vim_item.menu = item.detail
            else
              vim_item.menu = ({
                buffer = "[Buf]",
                cmp_tabnine = "[Tabnine]",
                dictionary = "[Dictionary]",
                nvim_lsp_signature_help = "[Function Signature]",
                signature_help = "[Function Signature]",
                emoji = "[Emoji]",
                latex_symbols = "[LaTeX]",
                look = "[Dict]",
                git = "[Git]",
                luasnip = "[Snippet]",
                nuspell = "[Nuspell]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Nvim_Lua]",
                path = "[Path]",
                spell = "[Spell]",
                tags = "[Tags]",
                tmux = "[Tmux]",
              })[entry.source.name]
            end
            local my_menu = vim_item.menu
            local truncated_my_menu = vim.fn.strcharpart(my_menu, 0, MAX_MENU_DETAIL_WIDTH)
            if truncated_my_menu ~= my_menu then
              vim_item.menu = truncated_my_menu .. ELLIPSIS_CHAR
            elseif string.len(my_menu) < MIN_MENU_DETAIL_WIDTH then
              local menu_padding = string.rep(" ", MIN_MENU_DETAIL_WIDTH - string.len(my_menu))
              vim_item.menu = my_menu .. menu_padding
            end
            return vim_item
          end,
        },
        mapping = {
          ["<C-j>"] = cmp.config.disable,
          ["<C-k>"] = cmp.config.disable,
        },
      })
    end,

    -- )))

    -- 'gitsigns' override setup() (((

    gitsigns = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        -- delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
    },

    -- )))

    -- 'indent-blankline' override setup() (((

    indent_blankline = {
      show_first_indent_level = false,
    },

    -- )))

    -- 'lualine' override setup() (((

    lualine = function(config)
      table.insert(config.sections.lualine_c, 1, "filename")
      -- add aerial to beginning of lualine_x section
      -- table.insert(config.sections.lualine_x, 1, "aerial")
      return config
    end,

    -- )))

    -- 'neo-tree' override setup() (((

    ["neo-tree"] = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      enable_diagnostics = true,
      event_handlers = {
        {
          event = "after_render",
          handler = function(_)
            if vim.bo.filetype == "neo-tree" then
              local status_ok, alpha = pcall(require, "alpha")
              if status_ok then
                alpha.redraw()
              end
            end
          end,
        },
      },
    },

    -- )))

    -- 'null-ls' configuration (((

    ["null-ls"] = function(config)
      -- Formatting and linting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim
      local null_ls = require "null-ls"

      -- Check supported formatters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting

      -- Check supported linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics

      config.sources = {
        formatting.black,
        formatting.clang_format,
        formatting.fprettify,
        formatting.perltidy,
        formatting.reorder_python_imports,
        formatting.rustfmt,
        formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
        formatting.standardrb,
        formatting.stylua.with {
          condition = function(utils)
            return utils.root_has_file { "stylua.toml", ".stylua.toml" }
          end,
        },
        diagnostics.ansiblelint,
        diagnostics.chktex,
        -- diagnostics.codespell,
        diagnostics.cppcheck,
        -- diagnostics.cspell,  -- requires 'npm'
        diagnostics.flake8,
        diagnostics.hadolint,
        diagnostics.jsonlint,
        diagnostics.markdownlint,
        diagnostics.mypy,
        diagnostics.proselint,
        diagnostics.pydocstyle,
        diagnostics.pylint,
        diagnostics.pylama,
        -- diagnostics.selene,
        -- will show code and source name
        diagnostics.revive.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
        diagnostics.rstcheck,
        diagnostics.shellcheck.with { diagnostics_format = "[#{c}] #{m} (#{s})" },
        diagnostics.staticcheck.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
        diagnostics.stylint,
        diagnostics.vale,
        -- diagnostics.vulture, -- usually not available in path
        diagnostics.vint,
        diagnostics.write_good,
        diagnostics.yamllint,
        null_ls.builtins.hover.dictionary,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting and not vim.g.null_ls_disable then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = function()
              vim.lsp.buf.formatting_sync()
            end,
          })
        end
      end
      return config -- return the final config table
    end,

    -- )))

    -- 'nvim-lsp-installer' override setup() (((

    ["nvim-lsp-installer"] = {
      automatic_installation = true,
      ensure_installed = { "clangd" },
    },

    -- )))

    -- 'telescope' override setup() (((
    telescope = {
      pickers = {
        diagnostics = { theme = "dropdown" },
        -- diagnostics = { layout = { "vertical" } },
        git_status = { theme = "ivy" },
      },
    },

    -- )))

    -- 'treesitter' override setup() (((

    treesitter = {
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cmake",
        -- "comment",
        "cpp",
        "css",
        "cuda",
        "dart",
        "dockerfile",
        "dot",
        "fish",
        "fortran",
        "go",
        "haskell",
        "html",
        "http",
        "java",
        -- "javascript",
        "json",
        "json5",
        "jsonc",
        "julia",
        -- "latex",
        "lua", -- problematic on remote servers?
        "make",
        "markdown",
        "ninja",
        "perl",
        "python",
        "r",
        "regex",
        -- "rst",
        "ruby",
        -- "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "verilog",
        "vim", -- problematic on remote servers?
        "yaml",
      },
      highlight = {
        use_languagetree = true,
        disable = { "latex" },
      },
      context_commentstring = {
        config = {
          vim = '" %s',
        },
      },
      indent = {
        enable = true,
        disable = { "yaml", "python", "latex" },
      },
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
        },
        -- highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ax"] = "@class.outer",
            ["ix"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader><leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader><leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = "@function.outer", -- "m" for method
            ["]x"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]X"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[x"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[X"] = "@class.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader><leader>df"] = "@function.outer",
            ["<leader><leader>dc"] = "@class.outer",
          },
        },
      },
      pyfold = {
        enable = true,
        custom_foldtext = true, -- Sets provided foldtext on window where module is active
      },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
        -- [options]
      },
    },

    -- )))

    -- 'which-key' override setup() (((

    ["which-key"] = {
      window = {
        -- margin = { -10, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 3, max = 12 }, -- min and max height of the columns
        width = { min = 10, max = 40 }, -- min and max width of the columns
      },
      plugins = {
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        },
      },
    },

    -- )))

    -- 'packer' override setup() (((

    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    -- )))

    -- )))
  },

  -- ))) end of 'plugins' table

  -- Source priorities of 'cmp' (((

  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      luasnip = 1000,
      git = 900,
      nvim_lsp = 750,
      nvim_lsp_signature_help = 700,
      pandoc_references = 600,
      buffer = 500,
      path = 250,
      emoji = 200,
      dictionary = 150,
    },
    setup = function()
      local cmp = require "cmp"
      local user_source = astronvim.get_user_cmp_source
      local git_sources = cmp.config.sources(
        { user_source "git" },
        { user_source(require("user.cmp_sources").buffer_source) }
      )
      return {
        filetype = {
          gitcommit = { sources = git_sources },
          NeogitCommitMessage = { sources = git_sources },
          -- lua = {
          --   sources = {
          --     user_source "lsp",
          --   },
          -- },
        },
        -- cmd = {
        --   [":"] = {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources({
        --       user_source "path",
        --     }, {
        --       user_source "cmd",
        --     }),
        --   },
        -- },
      }
    end,
  },

  -- )))

  -- Diagnostics configuration (for vim.diagnostics.config({})) (((

  diagnostics = {
    virtual_text = false,
    underline = false,
    update_in_insert = false,
    severity_sort = true, -- <---
    -- float = {
    --   prefix = "■ ",
    --   source = "always",
    -- },
  },

  -- )))

  -- Extend LSP configuration (((

  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      "clangd", -- requires a reasonably new version of glibc
      "cmake",
      "fortls",
      "ltex",
      "prosemd_lsp",
      "pylsp",
      -- "r_language_server", -- needs R in path
      "sumneko_lua",
      -- "pyright"
      "zk",
    },

    -- add to the server on_attach function
    on_attach = function(client, bufnr)
      if client.name == "clangd" or client.name == "pylsp" then
        client.resolved_capabilities.document_formatting = false
      end
      vim.keymap.set("n", "<leader>la", "<cmd>CodeActionMenu<CR>", { buffer = bufnr, desc = "Code Action" })
      vim.keymap.del("n", "gd", { buffer = bufnr })
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition(s)", buffer = bufnr })
      vim.keymap.set(
        "n",
        "gr",
        "<cmd>Telescope lsp_references<cr>",
        { desc = "References of current symbol", buffer = bufnr }
      )
      vim.keymap.set("n", "gj", "gj")
      vim.keymap.del("n", "gj")
      vim.keymap.set("n", "gk", "gk")
      vim.keymap.del("n", "gk")
      vim.keymap.set("n", "gl", "gl")
      vim.keymap.del("n", "gl")
      vim.keymap.set("n", "go", "go")
      vim.keymap.del("n", "go")

      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
      vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
      vim.keymap.set("n", "<leader>xw", "<cmd>Trouble document_diagnostics<cr>")
      vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
      vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
      vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>")

      -- if client.name == "pyright" then
      --   require("folding").on_attach()
      -- end
    end,

    -- override the lsp installer server-registration function
    server_registration = function(server, opts)
      if server ~= "clangd" then
        require("lspconfig")[server].setup(opts)
      end
    end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for adding schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- )))

  -- Options for 'LuaSnip' (((

  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- )))

  -- Rules for 'nvim-autopairs' (((

  ["nvim-autopairs"] = {
    add_rules = function(npairs)
      local Rule = require "nvim-autopairs.rule"
      -- npairs.clear_rules()

      return {
        Rule(" ", " "):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
        Rule("( ", " )")
          :with_pair(function()
            return false
          end)
          :with_move(function(opts)
            return opts.prev_char:match ".%)" ~= nil
          end)
          :use_key ")",
        Rule("{ ", " }")
          :with_pair(function()
            return false
          end)
          :with_move(function(opts)
            return opts.prev_char:match ".%}" ~= nil
          end)
          :use_key "}",
        Rule("[ ", " ]")
          :with_pair(function()
            return false
          end)
          :with_move(function(opts)
            return opts.prev_char:match ".%]" ~= nil
          end)
          :use_key "]",
      }
    end,
  },

  -- )))

  -- Modify 'which-key' keybindings registration (((

  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          a = {
            name = "Code Outline",
            a = { "<cmd>AerialToggle!<cr>", "Toggle outline" },
            C = { "<cmd>AerialTreeCloseAll<cr>", "Collapse all" },
            c = { "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>", "Close outline" },
            -- g = { "<cmd>AerialGo<cr>", "Jump to the Nth symbol" },
            N = { "<cmd>AerialNextUp<cr>", "Next symbol (up 1 level)" },
            n = { "<cmd>AerialNext<cr>", "Next symbol" },
            O = { "<cmd>AerialTreeOpenAll<cr>", "Open all folds" },
            o = { "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>", "Open outline" },
            P = { "<cmd>AerialPrevUp<cr>", "Prev symbol (up 1 level)" },
            p = { "<cmd>AerialPrev<cr>", "Prev symbol" },
            s = { "<cmd>AerialTreeSyncFolds<cr>", "Sync code folding" },
            T = { "<cmd>AerialTreeToggle!<cr>", "Toggle folds at location" },
            t = { "<cmd>AerialToggle<cr>", "Toggle outline & move cursor" },
            -- u = { "<cmd>AerialPrevUp<cr>", "Prev symbol (up 1 level)" },
          },
          d = { "<cmd>windo diffthis<CR>", "diff buffers" },
          e = { "<cmd>Neotree action=show toggle=true<CR>", "File Explorer" },
          f = { name = "File/Buffer" },
          g = {
            B = {
              "<cmd>Gitsigns stage_buffer<CR>",
              "Stage Buffer",
            },
            C = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
            D = { "<cmd>DiffviewOpen<cr>", "Git Diff (interactive)" },
            f = { "<cmd>Telescope git_files<cr>", "Open file in repo" },
            g = { nil },
            h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
            H = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
            -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            n = { "<cmd>Neogit<cr>", "Neogit" },
            s = { "<cmd>Telescope git_status<cr>", "Status" },
            t = { "<cmd>Telescope git_stash<cr>", "Stash all changes" },
            U = {
              function()
                astronvim.toggle_term_cmd "gitui"
              end,
              "GitUI",
            },
          },
          h = { nil },
          l = {
            j = {
              "<cmd>lua vim.diagnostic.goto_next()<CR>",
              "Next Diagnostic",
            },
            k = {
              "<cmd>lua vim.diagnostic.goto_prev()<cr>",
              "Prev Diagnostic",
            },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            -- q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
            w = {
              "<cmd>Telescope diagnostics<cr>",
              "Workspace Diagnostics",
            },
            y = {
              "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
              "Workspace Symbols",
            },
          },
          n = {
            name = "Neogen annotation",
            c = {
              -- "<cmd>:lua require('neogen').generate({ type = 'class' })<CR>>",
              "<cmd>Neogen class<CR>",
              "Class annotation",
            },
            f = {
              -- "<cmd>:lua require('neogen').generate({ type = 'func' })<CR>>",
              "<cmd>Neogen func<CR>",
              "Func annotation",
            },
            i = {
              -- "<cmd>:lua require('neogen').generate({ type = 'file' })<CR>>",
              "<cmd>Neogen file<CR>",
              "File annotation",
            },
            n = {
              -- "<cmd>:lua require('neogen').generate()<CR>>",
              "<cmd>Neogen<CR>",
              "Generate annotation",
            },
            t = {
              -- "<cmd>:lua require('neogen').generate({ type = 'type' })<CR>>",
              "<cmd>Neogen type<CR>",
              "Type annotation",
            },
          },
          p = {
            p = { "<cmd>PackerProfile<CR>", "Profile plugins" },
          },
          q = { nil },
          s = {
            name = "Search/Set",
            a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
            -- b = { "nil", "Builtins" },
            b = { "<cmd>Telescope builtin<cr>", "Builtins" },
            B = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in Current Buffer" },
            C = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
            d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
            g = { "<cmd>Telescope grep_string<cr>", "Search String" },
            H = { "<cmd>Telescope highlights<cr>", "Highlight Group" },
            i = { "<cmd>Telescope symbols<cr>", "Icons (Unicode Emojis/Symbols)" },
            j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
            p = { "<cmd>Telescope projects<cr>", "Projects" },
            q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
            R = { "<cmd>Telescope resume<cr>", "Resume Last" },
            s = { "<cmd>Telescope treesitter<cr>", "Outline Symbols (from treesitter)" },
            S = { "<cmd>Telescope luasnip<cr>", "Code Snippets" },
            t = { "<cmd>Telescope tags<cr>", "Tags in Project" },
            T = { "<cmd>Telescope tagstack<cr>", "Tagstack" },
            v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
            y = { "<cmd>Telescope filetypes<cr>", "Choose filetype" },
          },
          t = {
            l = { nil },
            g = {
              function()
                astronvim.toggle_term_cmd "gitui"
              end,
              "GitUI",
            },
          },
          w = { nil },
        },
      },
    },
  },

  -- )))

  -- This 'polish' function is run last (good place to configure mappings and vim options) (((

  polish = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "black", bold = true }) -- https://www.reddit.com/r/neovim/comments/tpmnlv/psa_make_your_window_separator_highlight_bold_of/ Set `fg` to the color you want your window separators to have

    vim.wo.colorcolumn = ""

    -- https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
    vim.wo.foldnestmax = 3
    vim.o.foldtext =
      [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

    -- Vimscript-based options (((

    vim.cmd [[

      let g:detectspelllang_langs = {
      \ 'aspell'   : [ 'en_GB', 'en_US', 'cs', 'cy', 'da', 'de_DE', 'el', 'es', 'fr', 'gd', 'hu', 'id', 'it', 'ms', 'nl', 'pl', 'pt', 'ro', 'ru', 'sk', 'sl', 'sv' ],
      \ 'hunspell' : [ 'en_GB', 'en_US', 'cs_CS', 'cy_CY', 'da_DA', 'de_DE', 'el_GR', 'gd_GD', 'es_ES', 'fr_FR', 'hu_HU', 'id_ID', 'it_IT', 'ms_MS', 'nl_NL', 'pl_PL', 'pt_PT', 'ro_RO', 'ru_RU', 'sk_SK', 'sl_SL', 'sv_SV' ],
      \ }

      let g:matchup_matchparen_offscreen = {'method': 'popup'}
      let g:matchup_surround_enabled = 1
      let g:matchup_matchparen_enabled = 0
      let g:matchup_matchparen_deferred = 1
      let g:matchup_override_vimtex = 1

      let g:python3_host_prog = "python3"

    " let mapleader = "\\"

    set whichwrap+=<,>,[,],h,l

    " " https://www.reddit.com/r/neovim/comments/sofaax/is_there_a_way_to_change_neovims_way_of/
    " function FoldText()
    "   let line = getline(v:foldstart)
    "   let numOfLines = v:foldend - v:foldstart
    "   let fillCount = winwidth('%') - len(line) - len(numOfLines) - 14
    "   return line . '  ' . repeat('.', fillCount) . ' (' . numOfLines . ' L)'
    " endfunction
    " set foldtext=FoldText()
    set fillchars=fold:\  " removes trailing dots. Mind that there is a whitespace after the \!

    " Linebreak settings (((

    " let &showbreak='→ '
    " let &showbreak='… '
    " let &showbreak='↪ '
    set breakat=\ \ ;:,!? " which characters might cause a line break if 'linebreak' is on.
    set breakindentopt=shift:2,sbr

    " )))

    " formatoptions (((

    " set formatoptions-=cro " TODO: this doesn't seem to work
    set formatoptions-=t " Disable 'auto-wrap text using textwidth'
    set formatoptions+=n " When formatting text, recognize numbered lists. This actually uses the 'formatlistpat' option, thus any kind of list can be used. Helps to avoid joining distinct items as if they were a single paragraph.

    " )))

    " Wildignore and low-priority suffixes/filetype-extensions (((

    " Ignore the following type of files when tab completing. " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
    set wildignore+=*.4ct,*.4tc,*.7z,*.a,*.acn,*.acr,*.alg,*.auxlock,*.backup,*.bcf,*.beam,*.bin,*.blg,*.bmp,*.brf,*.cb,*.cb2,*.class,*.cpt,*.cut,*.dats,*.db,*.dll,*.dmg,*.docx,*.dpth,*.DS_Store,*.dx64fsl,*.el,*.end,*.ent,*.eps,*.exe,*.fasl,*.fdb_latexmk,*.fff,*.fls,*.flv,*.fmt,*.fot,*.gaux,*.gem,*.gif,*.git,*.glg,*.glo,*.gls,*.glsdefs,*.glstex,*.gtex,*.hg,*.hst,*.idv,*.idx,*.ilg,*.img,*.ind,*.ini,*.ist,*.jpeg,*.JPG,*.la,*.lb,*.lg,*.listing,*.lnk,*.loa,*.load,*.loe,*.lof,*.lol,*.lot,*.lox,*.ltjruby,*.luac,*.lx64fsl,*.maf,*.manifest,*.mf,*.mkv,*.mlf,*.mlt,*.mo,*.mod,*.mp,*.mp4,*.mw,*.nav,*.nlg,*.nlo,*.nls,*.o,*.obj,*.orig,*.pax,*.pdf,*.pdfpc,*.pdfsync,*.png,*.pre,*.ps,*.psd,*.pyc,*.pyg,*.pyo,*.pytxcode,*.rar,*.rbc,*.rbo,*.run.xml,*.save,*.snm,*.so,*.soc,*.sout,*.spl,*.sqlite,*.sta,*.svg,*.svn,*.sw?,*.swp,*.sympy,*.synctex,*.synctex.gz,*.tar,*.tar.bz2,*.tar.gz,*.tar.xz,*.tdo,*.texpadtmp,*.tfm,*.thm,*.tiff,*.toc,*.trc,*.ttt,*.upa,*.upb,*.ver,*.vrb,*.wrt,*.xcp,*.xdv,*.xdy,*.xlsx,*.xmpi,*.xpm,*.xref,*.xyc,*.xz,*.zip,*/.bundle/*,*/.cls,*/.fdb*/,*/.git/*,*/.glo,*/.ist,*/.sass-cache/*,*/.svn/*,*/.toc,*/.vim$,*/__pycache__/*,*/builds/*,*/dist*/*,*/node_modules/*,*/target/*,*/tmp/*,*/vendor/cache/*,*/vendor/gems/*,*/venv/*,*\\tmp\\*,*~,./tags,._*,.git/,.git/*,.idea/,\~$,_site,bower_components/*,CVS,CVS/*,media/*,migrations,tags,types_*taghl,vendor/cache/**,vendor/rails/**,


    " This gives files lower priority, instead of outright ignoring them
    set suffixes+=*.info,*.aux,*.log,*/.log,*.dvi,*.bbl,*.out,*/.out,*.old,*.bak

    " )))

    " Custom 'Underline' command using user-defined function (((

    " https://vim.fandom.com/wiki/Underline_using_dashes_automatically
    function! s:Underline(chars) abort
      let chars = empty(a:chars) ? '-' : a:chars
      let nr_columns = virtcol('$') - 1
      let uline = repeat(chars, (nr_columns / len(chars)) + 1)
      put =strpart(uline, 0, nr_columns)
    endfunction
    command! -nargs=? Underline call s:Underline(<q-args>)

    " )))

    " Formatlistpat settings (((

    " A pattern that is used to recognize a list header.  This is used for the "n" flag in 'formatoptions'. The pattern must match exactly the text that will be the indent for the line below it.  You can use |/\ze| to mark the end of the match while still checking more characters.  There must be a character following the pattern, when it matches the whole line it is handled like there is no match. The default recognizes a number, followed by an optional punctuation character and white space.

    set formatlistpat=^\\s*                " Optional leading whitespace
    set formatlistpat+=[                   " Start character class
    set formatlistpat+=\\[({]\\?           " |  Optionally match opening punctuation
    set formatlistpat+=\\(                 " |  Start group
    set formatlistpat+=[0-9]\\+            " |  |  Numbers
    set formatlistpat+=\\\|                " |  |  or
    set formatlistpat+=[a-zA-Z]\\+         " |  |  Letters
    set formatlistpat+=\\)                 " |  End group
    set formatlistpat+=[\\]:.)}            " |  Closing punctuation
    set formatlistpat+=]                   " End character class
    set formatlistpat+=\\s\\+              " One or more spaces
    set formatlistpat+=\\\|                " or
    set formatlistpat+=^\\s*[-–+o*•]\\s\\+ " Bullet points

    " )))

    " Global g:tex_ settings (((

    " https://damrah.netlify.app/post/note-taking-with-latex-part-1/
    " let g:tex_no_error=1   " The <tex.vim> supports lexical error checking of various sorts.  Thus, although the error checking is ofttimes very useful, it can indicate errors where none actually are.  If this proves to be a problem for you, you may put in your vimrc the following statement: > let g:tex_no_error=1 and all error checking by <syntax/tex.vim> will be suppressed.
    let g:tex_comment_nospell= 1
    let g:tex_conceal='abdmgs'
    let g:tex_flavor = 'latex'
    let g:tex_fold_enabled=1
    let g:tex_isk='48-57,a-z,A-Z,192-255,:,_'

    " )))

    " Disable unnecessary internal plugins (((

    let g:did_install_default_menus = 1
    :let did_install_default_menus  = 1
    let g:did_install_syntax_menu   = 1
    :let did_install_syntax_menu    = 1
    " let g:did_indent_on             = 1    " raises an error: Vim(doautocmd):E216: No such group or event: filetypeindent FileType markdown
    let g:did_load_ftplugin         = 1
    let g:skip_loading_mswin        = 1

    " " I prefer filtering text with Unix tools
    let g:loaded_logiPat            = 1

    " let g:loaded_man      = 1
    " let g:loaded_matchit  = 1
    let g:loaded_matchparen = 1
    :let loaded_matchparen  = 1

    " I don't use Vim servers
    " let g:loaded_rrhelper = 1   " doesn't exist in neovim

    let g:loaded_shada_plugin       = 1
    let g:loaded_spellfile_plugin   = 1
    " let g:loaded_tutor_mode_plugin  = 1

    " let g:loaded_netrw              = 1
    let g:netrw_nogx                = 1

      let g:loaded_ruby_provider = 0  " To disable Ruby support
      :let g:loaded_perl_provider = 0 " To disable perl support
      :let g:loaded_node_provider = 0 " To disable Node.js support

    " )))

    " Folding-related global(g:) variables for various languages (((

    let g:markdown_folding        = 1
    let g:markdown_enable_folding = 1
    let g:tex_fold_enabled        = 1
    let g:vimsyn_folding          = 'af'
    let g:xml_syntax_folding      = 1
    let g:javaScript_fold         = 1
    let g:sh_fold_enabled         = 7
    let g:ruby_fold               = 1
    let g:perl_fold               = 1
    let g:perl_fold_blocks        = 1
    let g:r_syntax_folding        = 1
    let g:rust_fold               = 1
    let g:php_folding             = 1

    " )))

    " Diff-mode settings (((

    set diffopt+=vertical,foldcolumn:0,context:2,iwhiteall,hiddenoff
    " set diffopt+=internal,indent-heuristic,algorithm:histogram
    set diffopt+=indent-heuristic,algorithm:minimal

    " )))

    " " Settings for 'listchars' which define extra list display characters (((
    "
    " set listchars=
    " " set listchars+=tab:▸\     " Tab characters, preserve width
    " set listchars+=tab:→\     " Tab characters, preserve width
    " set listchars+=trail:·    " Trailing spaces
    " set listchars+=extends:>  " Unwrapped text to screen right
    " set listchars+=precedes:< " Unwrapped text to screen left
    " set listchars+=nbsp:␣
    "
    " " )))

    " Title (GUI/terminal) settings (((

    set title
    set titleold="Terminal"

    " https://github.com/factorylabs/vimfiles/blob/ad1f9ffcd8c1e620a75a28822aaefc2097640b0d/home/.vimrc#L309
    " Set the title bar to something meaningful

    " set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
    " set titlestring=%f%(\ [%M]%)
    " set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

    set titlestring=
    set titlestring+=%f\                " file name
    set titlestring+=%h%m%r%w           " flags
    set titlestring+=\ -\ %{v:progname} " program name

    " )))

    " Settings for grepprg and grepformat (((

    if executable('rg')
      set grepprg=rg\ -H\ --no-heading\ --vimgrep
      set grepformat^=%f:%l:%c:%m
    endif

    " )))

    " Other non-conditional settings/declarations (set xxxxxxx) (((

    " set path+=**    " Search current directory's whole tree
    set cpoptions-=a  " Stop the :read command from annoyingly setting the alternative buffer
    set fileformats=unix,dos,mac " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer:
    set isfname-==
    set isfname-={,}
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Probably overridden by status-line plugins
    set virtualedit+=block " Allow movement beyond buffer text only in visual block mode

    " )))

    " Mappings (((

    " https://github.com/neovim/neovim/issues/9953
    " if &wildoptions == 'pum'
    "     cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "\<up>"
    "     cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\<down>"
    " endif
    "
    " cnoremap <c-n> <down>
    " cnoremap <c-p> <up>

    " Replace :w with :up
    cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

    " https://stackoverflow.com/questions/3131393/remapping-help-in-vim-to-open-in-a-new-tab
    cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
    cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
    cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
    cnoreabbrev <expr> Man getcmdtype() == ":" && getcmdline() == 'Man' ? 'tab Man' : 'Man'

    " nnoremaps (((

    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> <Down> (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
    noremap <silent> <expr> <Up> (v:count == 0 ? 'gk' : 'k')

    " replace the word under cursor
    nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

    " https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
    " nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
    nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>

    nmap cg* *Ncgn

    noremap <c-w>" <c-w>t<c-w>K    " change vertical to horizontal with -
    noremap <c-w>% <c-w>t<c-w>H    " change horizontal to vertical with %

    " )))

    " Make jump-selections work better in visual block mode (((

    xnoremap <expr>  G   'G' . virtcol('.') . "\|"
    xnoremap <expr>  }   '}' . virtcol('.') . "\|"
    xnoremap <expr>  {   '{' . virtcol('.') . "\|"

    " )))

    " Substitute word under cursor and dot repeat (((

    " https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
    " nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
    " nnoremap <leader><leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
    " xnoremap <silent> \\C "sy:let @/=@s<CR>cgn

    " )))

    " Plugin keymaps (vimscript-based) (((

    " Bufferline keymaps (vimscript-based) (((

    " These commands will navigate through buffers in order regardless of which mode you are using
    " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent>[b :BufferLineCyclePrev<CR>
    nnoremap <silent>]b :BufferLineCycleNext<CR>
    " nnoremap <silent><leader><leader>[ :BufferLineMovePrev<CR>
    " nnoremap <silent><leader><leader>] :BufferLineMoveNext<CR>
    nnoremap <silent><leader><leader>d :BufferLineSortByDirectory<CR>
    nnoremap <silent><leader><leader>e :BufferLineSortByExtension<CR>
    nnoremap <silent><leader><leader>p :BufferLinePick<CR>
    nnoremap <silent><leader><leader>c :BufferLinePickClose<CR>
    nnoremap <silent><leader><leader>P :BufferLineTogglePin<CR>
    nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
    nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
    nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
    nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
    nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
    nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
    nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
    nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
    nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

    " )))

    " )))

    " )))

    " Dictionary settings (((

    if has('unix')
      silent! set dictionary+=/usr/share/dict/words
      silent! set dictionary+=/usr/share/dict/american-english
      silent! set dictionary+=/usr/share/dict/british-english
      silent! set dictionary+=/usr/share/dict/cracklib-small
    endif

    " )))

    " Custom highlights (((

    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let’s highlight these so we can’t miss them: https://vimways.org/2018/vim-and-git/

    " )))

    " shortmess settings (((

    set shortmess+=I  " Don't give the intro message when starting Vim |:intro|.
    set shortmess+=c  " Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
    set shortmess-=x  " Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions

    " )))

    set tags=~/.cache/tags

    ]]

    -- )))

    -- Autogroups & Autocommands (lua-based) (((

    -- Autogroup for Alpha bindings (((

    vim.api.nvim_create_augroup("alpha_bindings", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set alpha bindings",
      group = "alpha_bindings",
      pattern = "alpha",
      callback = function()
        vim.keymap.set("n", "q", "<cmd>enew<cr>", { buffer = 0 })
        vim.keymap.set("n", "<esc>", "<cmd>enew<cr>", { buffer = 0 })
      end,
    })

    -- )))

    -- Autogroup for automatically reload packer configs after saving (((

    -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   desc = "Sync packer after modifying init.lua",
    --   group = "packer_conf",
    --   pattern = "init.lua",
    --   command = "source <afile> | PackerSync",
    -- })

    -- )))

    -- )))

    -- Autocommands (vimscript-based) (((

    vim.cmd [[

  " _general_settings autogroup (((

  augroup _general_settings
    autocmd!

    " ft help autocommands (((

    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>

    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>

    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>

    " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
    autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

    autocmd FileType help setlocal number relativenumber
    autocmd FileType gitcommit,help,NeogitCommit,NeogitCommitMessage setlocal nolist

    " )))

    " autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 400})
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=650 }

    " autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    " autocmd BufWinEnter *.txt set iskeyword+=- iskeyword+=: iskeyword+=.

    autocmd BufWinEnter * set formatoptions-=cro

    " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
    " autocmd FileType help :tabnew % | tabprevious | quit | tabnext
    autocmd FileType help set buflisted

    autocmd FileType qf set nobuflisted

    autocmd FileType asciidoc,changelog,context,gitcommit,NeogitCommit,NeogitCommitMessage,lsp_markdown,mail,markdown,rst,rtf,tex,texinfo,text,txt setlocal spell
    autocmd FileType gitcommit,NeogitCommit,NeogitCommitMessage setlocal wrap textwidth=80

  augroup end

  " )))

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  " Autocommand to set ft to julia for files ending in .jl (((

  " augroup _julia
  "   autocmd!
  "   autocmd BufRead,BufNewFile *.jl set filetype=julia
  " augroup END

  " )))

  " Autocommand for file changed alert (((

  augroup FileChangedAlert
    " Helps if you have to use another editor on the same file https://vimhelp.org/vim_faq.txt.html
    autocmd!
    autocmd FileChangedShell *
    \ echohl WarningMsg |
    \ echo "File has been changed outside of vim." |
    \ echohl None
  augroup END

  " )))

  " Autocommand for disabling undofile in /tmp on non-windows systems (((

  if !has('win32') || !has('win64')
    augroup disableTempUndo
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
    augroup END
  endif

  " )))

  " " Autocommand for remembering cursor position (((
  "
  " " :help restore-cursor
  " augroup vimrc-remember-cursor-position
  "   autocmd!
  "   autocmd BufRead * autocmd FileType <buffer> ++once
  "   \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
  " augroup END
  "
  " " )))

  " Autocommand to stop insert when focus is lost (((

  augroup FocusLostAucmd
    autocmd!
    autocmd FocusLost * stopinsert
  augroup END

  " )))

  " Autocommands for LaTeX filetype (((

  augroup LaTeXSettings
    autocmd!
    autocmd FileType tex setlocal foldcolumn=auto:7
    autocmd InsertCharPre *.tex set conceallevel=0
    autocmd InsertLeave *.tex set conceallevel=2
  augroup END

  augroup FtLuaSettings
    autocmd!
    autocmd FileType lua setlocal foldcolumn=auto:7
  augroup END

  " )))

  ]]

    -- )))

    -- Add custom filetypes (lua-based config from nvim 0.7+) (((

    -- vim.filetype.add {
    --   extension = {
    --     jl = "julia",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- )))

    -- keybindings (lua-based) (((

    -- Declare local variables for keymaps (options and shortened names) (((

    local opts_noremapsilent = { noremap = true, silent = true }
    local opts_noremapverbose = { noremap = true, silent = false }
    local opts_remapsilent = { noremap = false, silent = true }
    -- local vim.keymap.set = vim.keymap.set

    -- )))

    -- Disable some unnecessary/confusing default mappings (((

    vim.keymap.set({ "n", "i" }, "<f1>", "<Nop>", opts_noremapsilent)
    vim.keymap.set({ "n", "x" }, "s", "<Nop>", opts_remapsilent) -- Disable 's' as recommended by sandwich.vim help file

    -- )))

    -- Disable AstroNvim mappings that override important vim defaults (((

    vim.keymap.del("t", "<esc>")
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { silent = true })
    vim.keymap.set("n", "<leader>w", "<leader>w", { silent = true })
    vim.keymap.del("n", "<leader>w")
    vim.keymap.set("n", "<leader>q", "<leader>q", { silent = true })
    vim.keymap.del("n", "<leader>q")
    vim.keymap.set("n", "<leader>h", "<leader>h", { silent = true })
    vim.keymap.del("n", "<leader>h")
    vim.keymap.set("n", "}", "}", { silent = true })
    vim.keymap.del("n", "}")
    vim.keymap.set("n", "{", "{", { silent = true })
    vim.keymap.del("n", "{")
    vim.keymap.set("n", "<C-q>", "<Nop>", { silent = true })
    vim.keymap.del("n", "<C-q>")
    vim.keymap.set("n", "<C-s>", "<Nop>", { silent = true })
    vim.keymap.del("n", "<C-s>")
    vim.keymap.set("n", "<leader>h", "<Nop>", { silent = true })
    vim.keymap.set("n", "H", "H", { silent = true })
    vim.keymap.del("n", "H")
    vim.keymap.set("n", "L", "L", { silent = true })
    vim.keymap.del("n", "L")
    vim.keymap.set("x", "J", "J", { silent = true })
    vim.keymap.del("x", "J")
    vim.keymap.set("x", "K", "K", { silent = true })
    vim.keymap.del("x", "K")
    vim.keymap.del("t", "<c-j>")
    vim.keymap.del("t", "<c-k>")
    -- vim.keymap.set('x', "<A-j>", "<Nop>", { silent = true })
    -- vim.keymap.del("x", "<A-j>")
    -- vim.keymap.set('x', "<A-k>", "<Nop>", { silent = true })
    -- vim.keymap.del("x", "<A-k>")

    -- )))

    vim.keymap.set({ "n", "x" }, "&", ":&&<CR>", opts_noremapsilent) -- Remap normal/visual '&' to preserve substitution flags
    -- vim.keymap.set({ "n" }, "<leader>*", ":%s;\<<c-r><c-w>\>;;g<left><left>") -- replace the word under cursor

    -- Normal mode keymaps -- (((

    -- vim.keymap.set("n", "<leader>e", ":Lexplore 20<cr>", opts_noremapsilent)
    vim.keymap.set("n", "<C-w>f", "<C-w>vgf", opts_noremapsilent) -- is a more generic mode remap required?
    vim.keymap.set("n", "J", "mzJ`zmz", opts_noremapsilent)
    vim.keymap.set("n", "'", "`", opts_noremapsilent)
    vim.keymap.set("n", "<C-]>", "g<C-]>", opts_noremapsilent) -- show options if tag has multiple matches

    -- Keymaps for navigating folds (((

    -- vim.keymap.set("n", "zf", "zMzvzz", opts_noremapsilent)
    -- vim.keymap.set("n", "zj", "zcjzOzz", opts_noremapsilent)
    -- vim.keymap.set("n", "zk", "zckzOzz", opts_noremapsilent)
    vim.keymap.set("n", "<Space>", "za", opts_noremapsilent)

    -- )))

    -- )))

    -- Insert mode keymaps -- (((

    vim.keymap.set("i", "<c-c>", "<ESC>", opts_noremapsilent) -- CTRL-C doesn't trigger the InsertLeave autocmd. Map to <ESC> instead.

    -- )))

    -- Visual mode keymaps -- (((

    vim.keymap.set("v", "y", "myy`ymy", opts_noremapsilent)
    vim.keymap.set("v", "Y", "myY`ymy", opts_noremapsilent)

    -- )))

    -- Visual block mode keymaps  -- (((

    -- Stay in indent mode in visual-block mode (((

    vim.keymap.set("x", "<", "<gv", opts_noremapsilent)
    vim.keymap.set("x", ">", ">gv", opts_noremapsilent)

    -- )))

    -- )))

    -- Command-line mode keymaps -- (((

    vim.keymap.set("c", "<c-n>", "<down>", opts_noremapverbose)
    vim.keymap.set("c", "<c-p>", "<up>", opts_noremapverbose)

    -- )))

    -- Keymaps that leverage various plugins (((

    -- 'gitsigns' keymaps (((

    vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
    vim.keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    vim.keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")

    -- )))

    -- Resize keymaps with 'smart-splits' (((

    if astronvim.is_available "smart-splits.nvim" then
      vim.keymap.set("n", "<A-h>", function()
        require("smart-splits").resize_left()
      end, { desc = "Move to left split" })
      vim.keymap.set("n", "<A-j>", function()
        require("smart-splits").resize_down()
      end, { desc = "Move to below split" })
      vim.keymap.set("n", "<A-k>", function()
        require("smart-splits").resize_up()
      end, { desc = "Move to above split" })
      vim.keymap.set("n", "<A-l>", function()
        require("smart-splits").resize_right()
      end, { desc = "Move to right split" })
    end

    -- )))

    -- -- 'telescope' keymaps (((
    --
    -- vim.keymap.set("n", "<leader>fF", function()
    --   require("telescope.builtin").find_files { hidden = true }
    -- end, { desc = "Search all files" })
    --
    -- -- )))

    -- ))) end of plugin keybindings (lua-based) fold

    -- ))) -- end of keybindings (lua-based) fold
  end, -- end of 'polish' function

  -- ))) end of 'polish' fold
} -- end of 'config' table

return config

-- ))) -- end of 'config' fold

-- Other plugins to consider (((

-- Other lua plugins (((

-- https://github.com/rmagatti/auto-session
-- https://github.com/jceb/blinds.nvim
-- use { "numtostr/BufOnly.nvim", cmd = { "BufOnly" } }
-- use { "kwkarlwang/bufresize.nvim" }
-- use { "kazhala/close-buffers.nvim", cmd = {} }
-- https://github.com/Civitasv/cmake-tools.nvim
-- use { "andersevenrud/cmp-tmux" }
-- https://github.com/monaqa/dial.nvim
-- https://github.com/narutoxy/dim.lua
-- https://github.com/tjdevries/diff-therapy.nvim -- resolve those conflicts and have a happy relationship with git
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/chipsenkbeil/distant.nvim  -- Edit files, run programs, and work with LSP on a remote machine from the comfort of your local environment construction
-- use { "stevearc/dressing.nvim" }
-- use { "j-hui/fidget.nvim" }
-- https://github.com/Furkanzmc/firvish.nvim
-- https://github.com/ruifm/gitlinker.nvim
-- https://github.com/ThePrimeagen/git-worktree.nvim
-- use { "rmagatti/goto-preview", event = { "CursorHold" } }
-- https://github.com/beauwilliams/focus.nvim
-- https://github.com/pierreglaser/folding-nvim
-- https://github.com/kalvinpearce/gitignore-gen.nvim
-- https://github.com/brymer-meneses/grammar-guard.nvim
-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/jbyuki/instant.nvim  -- collaborative editing in Neovim using built-in capabilities
-- https://github.com/hkupty/iron.nvim
-- use { "mizlan/iswap.nvim", requires = { { "nvim-treesitter" } } }
-- https://github.com/ggandor/leap.nvim
-- use { "ggandor/lightspeed.nvim", requires = "tpope/vim-repeat", }
-- use { "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }
-- https://github.com/mbpowers/lorem-nvim
-- https://github.com/lukas-reineke/lsp-format.nvim -- A wrapper around Neovims native LSP formatting
-- use { "onsails/lspkind-nvim" }
-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
-- use { "chentoast/marks.nvim", keys = { "m", "dm" }, cmd = { "MarksToggleSigns", "MarksListBuf", "MarksListGlobal", "MarksListAll", "MarksQFListBuf", "MarksQFListGlobal", "MarksQFListAll" } }
-- https://github.com/nyngwang/NeoClear.lua
-- https://github.com/nyngwang/NeoNoName.lua
-- use { "nyngwang/NeoZoom.lua" }
-- https://github.com/miversen33/netman.nvim -- Neovim (Lua powered) Network File Manager
-- https://github.com/nacro90/numb.nvim
-- use { "kevinhwang91/nvim-bqf", ft = "qf", event = { "CursorHold" } }
-- https://github.com/ojroques/nvim-bufdel
-- https://github.com/s1n7ax/nvim-comment-frame  -- Detects the language using treesitter and adds a comment block
-- https://github.com/mfussenegger/nvim-dap-python
-- https://github.com/booperlv/nvim-gomove
-- use { "https://gitlab.com/yorickpeterse/nvim-pqf" }
-- https://github.com/bennypowers/nvim-regexplainer
-- use { "petertriho/nvim-scrollbar" }
-- https://github.com/dstein64/nvim-scrollview
-- use { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
-- https://github.com/yioneko/nvim-yati -- Yet another tree-sitter powered indent plugin for Neovim
-- https://gitlab.com/yorickpeterse/nvim-window
-- https://github.com/rlane/pounce.nvim
-- https://github.com/filipdutescu/renamer.nvim
-- https://github.com/rmagatti/session-lens
-- https://github.com/gbprod/substitute.nvim
-- use { "ur4ltz/surround.nvim" }
-- use { "nvim-telescope/telescope-media-files.nvim" }
-- use { "nvim-telescope/telescope-packer.nvim" }
-- use { "cljoly/telescope-repo.nvim" }
-- https://github.com/TC72/telescope-tele-tabby.nvim
-- use { "folke/todo-comments.nvim" } -- :ToDoQuickFix, :ToDoTrouble, :ToDoTelescope,
-- https://github.com/David-Kunz/treesitter-unit/
-- use { "folke/twilight.nvim", cmd = { "ZenMode", "Twilight", "TwilightEnable" } }
-- https://github.com/rcarriga/vim-ultest
-- https://github.com/jubnzv/virtual-types.nvim  -- A Neovim plugin that shows type annotations as virtual text
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/hoschi/yode-nvim
-- use { "folke/zen-mode.nvim", cmd = "ZenMode" }

-- ))) end of 'other lua plugins' fold

-- Other vimscript plugins (((

-- https://github.com/rhysd/conflict-marker.vim
-- https://github.com/whiteinge/diffconflicts
-- use { "ii14/exrc.vim" } -- "jenterkin/vim-autosource", "embear/vim-localvimrc", "LucHermitte/local_vimrc", "thinca/vim-localrc"
-- use { "Konfekt/FastFold" }
-- https://github.com/iamcco/markdown-preview.nvim
-- https://github.com/Sangdol/mintabline.vim
-- use { "weirongxu/plantuml-previewer.vim", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } }
-- https://github.com/stefandtw/quickfix-reflector.vim
-- https://github.com/kamykn/spelunker.vim
-- use { "wellle/targets.vim" }
-- use { "mg979/tasks.vim" }
-- https://github.com/anufrievroman/vim-angry-reviewer
-- https://github.com/tpope/vim-apathy
-- https://github.com/foosoft/vim-argwrap
-- use { "wsdjeg/vim-assembly" }
-- use { "ntpeters/vim-better-whitespace" }
-- https://github.com/dhruvasagar/vim-buffer-history
-- https://github.com/JoseConseco/vim-case-change
-- use { "gauteh/vim-cppman", ft = { "c", "cpp" }, cmd = { "Cppman" } }
-- use { "tpope/vim-fugitive", event = "BufWinEnter" }
-- use { "ludovicchabant/vim-gutentags", event = { "CursorHold" } } -- , event = "BufWinEnter" }
-- use { "petRUShka/vim-opencl", ft = { "opencl" } }  -- note: slow plugin on remote systems
-- https://github.com/ojroques/vim-oscyank
-- https://github.com/4513ECHO/vim-readme-viewer
-- use { "urbainvaes/vim-ripple" }
-- use { "Konfekt/vim-sentence-chopper" }
-- use { "scrooloose/vim-slumlord", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } } -- also a telescope extension
-- https://github.com/marklcrns/vim-smartq
-- https://github.com/svermeulen/vim-subversive
-- https://github.com/Julian/vim-textobj-variable-segment
-- use { "tweekmonster/wstrip.vim" }
-- https://github.com/jalvesaq/zotcite

-- ))) end of 'other vimscript plugins'

-- ipython/jupyter vim plugins (((

-- "jupyter-vim/jupyter-vim"
-- "untitled-ai/jupyter_ascending"
-- "goerz/jupytext.vim"
-- { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- need to set up mappings
-- "bfredl/nvim-ipy"
-- { "hanschen/vim-ipython-cell", requires = { "jpalardy/vim-slime" } }

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

-- )))
