-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = false,
    which_key = true,
    neoscroll = true,
    ts_rainbow = false,
    ts_autotag = true,
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
      -- { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
      { "tyru/capture.vim", cmd = { "Capture" } },
      { "kenn7/vim-arsync", cmd = { "ARshowConf", "ARsyncUp", "ARsyncUpDelete", "ARsyncDown" } },
      { "tpope/vim-unimpaired", keys = { "[", "]" } },
      { "lervag/vimtex", ft = "tex" },
      { "svban/YankAssassin.vim", event = { "CursorHold" } },
      { "sudormrfbin/cheatsheet.nvim", cmd = { "Cheatsheet", "CheatsheetEdit" } },
      { "p00f/clangd_extensions.nvim", ft = { "c", "cpp", "cuda" } },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }, -- cmdline completions
      { "ellisonleao/glow.nvim", ft = { "markdown", "lsp_markdown", "rmd" }, cmd = { "Glow", "GlowInstall" } },
      {
        "echasnovski/mini.nvim",
        config = function()
          require("mini.surround").setup()
        end,
      },
      {
        "Shatur/neovim-cmake",
        ft = { "c", "cpp", "cmake", "fortran" },
        requires = { "mfussenegger/nvim-dap" }
      },
      { "nkakouros-original/numbers.nvim" },
      {
        "kevinhwang91/nvim-hlslens",
        keys = { "/", "?", "q/", "q?", "*", "#", "g*", "g#", "n", "N" },
        config = function()
          require("hlslens").setup( { calm_down = true } )
        end,
      },
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
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

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local map = vim.keymap.set
    local set = vim.opt
    -- NOTE: only my preferred settings that are not set by AstroNvim are set here

    -- Commented-out settings (((

    -- set.conceallevel = 0,      -- so that `` is visible in markdown files
    -- set.showmode = false,      -- we don't need to see things like -- INSERT -- anymore

    -- set.Backup settings (((
    -- set.backup = false,       -- creates a backup file
    -- set.writebackup = false,  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    -- )))

    -- )))

    -- Case-sensitivity options (((

    set.infercase = true -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.

    -- )))

    -- Tab settings: shiftwidth, tabstop, softtabstop (((

    set.softtabstop = 2 -- how many spaces to insert with tab key

    -- )))

    -- Indent settings (((

    -- Basic indent settings (((

    set.copyindent = true -- Copy the previous indentation on autoindenting
    set.preserveindent = true
    -- set.smartindent = true  -- make indenting smarter again

    -- )))

    -- Indent wrapped lines (((

    set.wrap = true
    set.linebreak = true -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
    set.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.

    -- )))

    -- )))

    -- swapfile, updatecount and updatetime (((

    set.updatecount = 100 -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).

    -- )))

    -- cursorline settings (((

    set.cursorlineopt = "number"

    -- )))

    -- Scroll-related settings (scrolljump, sidescroll) (((

    set.scrolloff = 2 -- Minimal number of screen lines to keep above and below the cursor
    set.sidescrolloff = 8 -- The minimal number of screen columns to keep to the left and to the right of the cursor
    -- set.scrolljump = 3  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
    -- set.sidescroll = 3  -- The minimal number of columns to scroll horizontally

    -- )))

    -- Gutter (number and signcolumn) settings (((

    set.numberwidth = 4 -- set number column width to 2 {default 4}

    -- )))

    -- Fold settings (((

    set.foldlevel = 2 -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
    set.foldlevelstart = 2
    set.foldcolumn = "auto:5"

    -- )))

    -- Settings for showing matching parenthesis (((

    set.showmatch = true
    set.matchtime = 3 -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

    -- )))

    -- All other settings (((

    set.clipboard = ""
    set.confirm = true -- Give me a prompt instead of just rejecting risky :write, :saveas
    set.guifont = "monospace:h17" -- the font used in graphical neovim applications
    set.lazyredraw = true -- Don't redraw the screen during batch execution
    set.list = true
    set.pumwidth = 35
    set.report = 0 -- Threshold for reporting number of lines changed.
    -- set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds). set to 300 by AstroNvim
    set.winaltkeys = "no"

    -- )))

    -- Set key bindings
    -- map("n", "<C-s>", ":w!<CR>")

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
      --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
          --     ["Foofile"] = "fooscript",
          --   },
          --   pattern = {
            --     ["~/%.config/foo/.*"] = "fooscript",
            --   },
            -- }
          end,
        }

return config
