return {
  { "goolord/alpha-nvim", enabled = false }, -- A lua powered greeter like vim-startify / dashboard-nvim
  { "max397574/better-escape.nvim", enabled = false }, -- Escape from insert mode without delay when typing
  {
    "stevearc/aerial.nvim",
    opts = {
      open_automatic = function(bufnr)
        return vim.fn.expand "%:t" ~= "init.lua"
          and not vim.opt.diff:get() -- if not in 'diff' mode
          and vim.api.nvim_buf_line_count(bufnr) > 26 -- Enforce a minimum line count
          and require("aerial").num_symbols(bufnr) > 4 -- Enforce a minimum symbol count
          and not require("aerial").was_closed() -- A useful way to keep aerial closed when closed manually
      end,
      -- on_first_symbols = function(bufnr)
      --   local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
      --   if ft == "lua" then require("aerial").tree_set_collapse_level(bufnr, 0) end
      -- end,
      -- backends = { "treesitter", "lsp", "markdown", "man" }, -- use AstroNvim's default list for backends
      highlight_on_hover = true, -- Highlight the symbol in the source buffer when cursor is in the aerial win
      layout = { min_width = 18 },
      placement = "edge",
      close_automatic_events = { "switch_buffer", "unsupported" },
    },
  },
  { "windwp/nvim-autopairs", opts = { disable_filetype = { "TelescopePrompt", "spectre_panel", "dap-repl" } } },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- signcolumn = false,
      -- numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "󰐊", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        untracked = { text = "▎" },
      },
      word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        -- map("n", "]c", function()
        --   if vim.wo.diff then return "]c" end
        --   vim.schedule(function() gs.next_hunk() end)
        --   return "<Ignore>"
        -- end, { expr = true })

        -- map("n", "[c", function()
        --   if vim.wo.diff then return "[c" end
        --   vim.schedule(function() gs.prev_hunk() end)
        --   return "<Ignore>"
        -- end, { expr = true })

        -- Actions
        map({ "n", "v", "x" }, "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
        -- map(
        --   { "n", "v", "x" },
        --   "<leader>g<s-l>",
        --   "<cmd>Gitsigns toggle_current_line_blame<cr>",
        --   { desc = "Toggle current line blame" }
        -- )
        map({ "n", "v", "x" }, "<leader>g<s-r>", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

        map("n", "<leader>g<s-b>", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
        map("n", "<leader>g<s-t>", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = {
        "aerial",
        "alpha",
        "c",
        "cpp",
        "dashboard",
        "dap-repl",
        "help",
        "lazy",
        "neo-tree",
        "neogitstatus",
        "NvimTree",
        "packer",
        "startify",
        "Trouble",
        -- "rust",
      },
      show_first_indent_level = false,
      show_end_of_line = true,
    },
  },
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      symbol_map = {
        -- Class = "",
        -- Class = " ",
        -- Class = "󰌗",
        -- Color = " ",
        -- Color = "󰏘",
        -- Constant = "",
        -- Constant = " ",
        -- Constant = "󰇽",
        -- Constant = "󰏿",
        -- Constructor = "",
        -- Event = " ",
        -- Field = " ",
        -- Field = "󰇽",
        -- File = " ",
        -- File = "",
        -- Folder = " ",
        -- Folder = "󰉋",
        -- Interface = "",
        -- Interface = "",
        -- Interface = "󰜰",
        -- Keyword = " ",
        -- Keyword = "󰌆",
        -- Module = " ",
        -- Module = "󰏗",
        -- Namespace = "󰅩",
        -- Null = "NULL",
        -- Number = "#",
        -- Object = "⦿",
        -- Operator = " ",
        -- Property = "",
        -- Property = " ",
        -- Reference = " ", -- codicons
        -- Reference = "",
        -- Snippet = " ",
        -- String = "",
        -- String = "𝓐",
        -- Struct = " ", -- codicons
        -- Struct = "",
        -- Struct = "" ,
        -- Text = "",
        -- Text = "",
        -- TypeParameter = " ", -- codicons
        -- TypeParameter = "󰅲",
        -- TypeParameter = "󰊄",
        -- Unit = " ",  -- codicons
        -- Unit = "",
        -- Unit = "󰑭",
        -- Value = " ", -- codicons
        -- Variable = " ", -- codicons
        -- Variable = "󰈜",
        Array = "󰅪",
        Boolean = "",
        Class = "󰠱",
        Color = "",
        Constant = "󰐀",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "󰜢",
        File = "󰈙",
        Folder = "",
        Function = "󰊕",
        Interface = "",
        Key = "󰌆",
        Keyword = "󰌋",
        Method = "󰆧",
        Module = "",
        Namespace = "",
        NONE = "",
        Null = "",
        Number = "",
        Object = "",
        Operator = "󰆕",
        Package = "󰏗",
        Property = "",
        Reference = "󰈇",
        Snippet = "",
        String = "",
        Struct = "󰙅",
        Text = "󰉿",
        TypeParameter = " ", -- codicons
        Unit = "",
        Value = "󰎠",
        Variable = "",
      },
    },
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "neotest" }, types = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      -- "jc-doyle/cmp-pandoc-references",
      -- "kdheepak/cmp-latex-symbols",
      -- "saadparwaiz1/cmp_luasnip",
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      local compare = require "cmp.config.compare"
      local luasnip = require "luasnip"
      local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      local utils = require "astronvim.utils"

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "path", priority = 900 },
        { name = "pandoc_references", priority = 800 },
        { name = "latex_symbols", priority = 700 },
        {
          name = "buffer",
          priority = 600,
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "emoji", priority = 500 },
        { name = "calc", priority = 400 },
        { name = "luasnip", priority = 50 },
      }
      opts.sorting = {
        comparators = {
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          require "clangd_extensions.cmp_scores",
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      }

      -- modify the view part of the options table
      opts.view = {
        -- when in cmdline mode, or when the cursor is near the bottom of the screen, and the menu opens above the cursor, it sometimes can be preferable if the menu used a bottom down approach.
        entries = { name = "custom", selection_order = "near_cursor" },
      }

      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        col_offset = -4,
      }

      opts.window = {
        completion = cmp.config.window.bordered(border_opts),
      }

      local function mycmpfmt(myopts)
        if myopts == nil then
          myopts = {}
        end
        if myopts.preset or myopts.symbol_map then
          lspkind.init(myopts)
        end

        return function(entry, vim_item)
          -- https://github.com/hrsh7th/nvim-cmp/issues/980
          local ELLIPSIS_CHAR = "…"
          local MAX_LABEL_WIDTH = 32
          local MIN_LABEL_WIDTH = 32
          -- https://www.reddit.com/r/neovim/comments/unlj8d/is_there_any_way_to_show_types_in_nvimcmp/?sort=new
          local MIN_MENU_DETAIL_WIDTH = 10
          local MAX_MENU_DETAIL_WIDTH = 10

          if myopts.before then
            vim_item = myopts.before(entry, vim_item)
          end

          vim_item.kind = lspkind.symbolic(vim_item.kind, myopts)

          -- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-1844480
          local item = entry:get_completion_item() -- Source
          if item.detail then
            vim_item.menu = item.detail
          elseif myopts.menu ~= nil then
            vim_item.menu = ({
              buffer = "[Buf]",
              calc = "[Calc]",
              dictionary = "[Dictionary]",
              nvim_lsp_signature_help = "[Function Signature]",
              signature_help = "[Function Signature]",
              emoji = "[Emoji]",
              latex_symbols = "[LaTeX]",
              look = "[Dict]",
              git = "[Git]",
              luasnip = "[Snippet]",
              omni = "[Omni]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Nvim_Lua]",
              path = "[Path]",
              spell = "[Spell]",
              tags = "[Tags]",
              tmux = "[Tmux]",
            })[entry.source.name]
            -- })[entry.source.name]
          end
          local my_menu = vim_item.menu
          local truncated_my_menu = vim.fn.strcharpart(my_menu, 0, MAX_MENU_DETAIL_WIDTH)
          if truncated_my_menu ~= my_menu then
            -- vim_item.menu = truncated_my_menu .. myopts.ellipsis_char
            vim_item.menu = truncated_my_menu .. ELLIPSIS_CHAR
          elseif string.len(my_menu) < MIN_MENU_DETAIL_WIDTH then
            local menu_padding = string.rep(" ", MIN_MENU_DETAIL_WIDTH - string.len(my_menu))
            vim_item.menu = my_menu .. menu_padding
          end

          local label = vim_item.abbr
          -- local truncated_label = vim.fn.strcharpart(label, 0, myopts.maxwidth)
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          if truncated_label ~= label then
            -- vim_item.abbr = truncated_label .. myopts.ellipsis_char
            vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
          elseif string.len(label) < MIN_LABEL_WIDTH then
            local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
            vim_item.abbr = label .. padding
          end
          return vim_item
        end
      end
      -- end

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind_status_ok and mycmpfmt(utils.plugin_opts "lspkind.nvim") or nil,
      }

      -- return the new table to be used
      return opts
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text", config = true },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      -- stages = "fade_in_slide_out",
      -- stages = "slide",
      timeout = 200,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- {
      --   "andymass/vim-matchup",
      --   init = function()
      --     vim.g.matchup_matchparen_deferred = 1
      --   end,
      -- },
      { "nvim-treesitter/nvim-treesitter-refactor" },
    },
    opts = {
      auto_install = vim.fn.executable "tree-sitter" == 1, -- Automatically install missing parsers when entering buffer if treesitter-cli is available in PATH
      -- context_commentstring = { enable = true, enable_autocmd = false },
      -- autotag = { enable = true },
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown_inline", "jsonc", "cpp" }
        or (
          vim.fn.executable "tree-sitter" ~= 1
          and {
            "bash",
            "bibtex",
            "c",
            "c_sharp",
            "clojure",
            "cmake",
            "comment", -- difficult to get this working on remote servers?
            "commonlisp",
            "cpp",
            "css",
            "cuda",
            "dart",
            "diff",
            "dockerfile",
            "dot",
            "fennel",
            "fish",
            "foam",
            "git_rebase",
            "gitattributes",
            "glsl",
            "go",
            "html",
            "http",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "jsonc",
            "julia",
            "kotlin",
            "llvm", -- problematic on remote servers?
            "lua", -- problematic on remote servers?
            "make",
            "markdown",
            "markdown_inline",
            "meson",
            "ninja",
            "nix",
            "ocaml",
            "pascal",
            "perl",
            "php",
            "python",
            "query",
            "r",
            "regex",
            "ruby",
            "rust",
            "scss",
            "sql",
            "todotxt",
            "toml",
            "tsx",
            "typescript",
            "verilog",
            "vim", -- problematic on remote servers?
            "vimdoc",
            "yaml",
            -- "fortran",
            -- "gitignore", -- needs treesitter-cli since it needs to be generated from grammar
            -- "haskell",
            -- "latex",
            -- "rst",
          }
        ),
      -- highlight = {
      --   enable = true,
      --   use_languagetree = true, -- Use this to enable language injection
      --   disable = { "css", "help", "latex" },
      --   -- additional_vim_regex_highlighting = false,
      --   additional_vim_regex_highlighting = {
      --     "sh",
      --     "bash",
      --     "bib",
      --     "cmake",
      --     "cmakecache",
      --     "latex",
      --     "tex",
      --     "markdown",
      --   },
      -- },
      query_linter = { -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
        enable = true, -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/settings/treesitter.lua
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
      indent = { -- in upstream AstroNvim
        enable = true,
        disable = { "help", "latex", "python", "yaml", "org" },
      },
      -- matchup = { enable = true }, -- , disable = { "julia" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "grs",
          node_incremental = "grm",
          node_decremental = "grl",
          scope_incremental = "grs",
        },
      },
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
        },
        -- highlight_current_scope = { enable = true },
        -- smart_rename = {
        --   enable = true,
        --   keymaps = {
        --     smart_rename = "grr", -- in the absence of LSP , can use treesitter for smart renaming
        --   },
        -- },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "grd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
      -- ts_funky_keywords = { enable = true }, -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { -- add a new dependency to telescope that is our new plugin
  --     "nvim-telescope/telescope-media-files.nvim",
  --   },
  --   -- the first parameter is the plugin specification
  --   -- the second is the table of options as set up in Lazy with the `opts` key
  --   config = function(plugin, opts)
  --     -- run the core AstroNvim configuration function with the options table
  --     require "plugins.configs.telescope"(plugin, opts)
  --
  --     -- require telescope and load extensions as necessary
  --     local telescope = require "telescope"
  --     telescope.load_extension "media_files"
  --   end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          always_show = { ".github", ".gitignore" },
        },
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = function(_, opts)
      opts.at_edge = require("smart-splits.types").AtEdgeBehavior.stop
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      terminal_mappings = false,
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      window = {
        -- border = "none",
        -- margin = { -10, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        -- margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 3, max = 14 }, -- min and max height of the columns
        width = { min = 10, max = 50 }, -- min and max width of the columns
      },
      plugins = {
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        },
      },
    },
  },
}

-- "AstroNvim/astrotheme"
-- "JoosepAlviste/nvim-ts-context-commentstring"
-- "L3MON4D3/LuaSnip"
-- "MunifTanjim/nui.nvim"
-- "NMAC427/guess-indent.nvim"
-- "NvChad/nvim-colorizer.lua"
-- "Shatur/neovim-session-manager"
-- "b0o/SchemaStore.nvim"
-- "famiu/bufdelete.nvim"
-- "hrsh7th/cmp-buffer"
-- "hrsh7th/cmp-nvim-lsp"
-- "hrsh7th/cmp-path"
-- "jay-babu/mason-null-ls.nvim"
-- "jay-babu/mason-nvim-dap.nvim"
-- "jose-elias-alvarez/null-ls.nvim"
-- "kevinhwang91/nvim-ufo"
-- "kevinhwang91/promise-async"
-- "mfussenegger/nvim-dap"
-- "numToStr/Comment.nvim"
-- "nvim-lua/plenary.nvim"
-- "nvim-telescope/telescope-fzf-native.nvim"
-- "nvim-telescope/telescope.nvim"
-- "nvim-telescope/telescope.nvim"
-- "nvim-tree/nvim-web-devicons"
-- "rafamadriz/friendly-snippets"
-- "rcarriga/nvim-dap-ui"
-- "rebelot/heirline.nvim"
-- "s1n7ax/nvim-window-picker"
-- "saadparwaiz1/cmp_luasnip"
-- "stevearc/dressing.nvim"
-- "williamboman/mason-lspconfig.nvim"
-- "williamboman/mason.nvim"
-- "windwp/nvim-ts-autotag"
-- "folke/lazy.nvim"
-- "neovim/nvim-lspconfig"
