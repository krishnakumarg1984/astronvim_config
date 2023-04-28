return {
  {
    "stevearc/aerial.nvim",
    -- init = function() table.insert(astronvim.file_plugins, "aerial.nvim") end,
    event = "User AstroFile",
    opts = {
      open_automatic = function(bufnr)
        return vim.fn.expand "%:t" ~= "init.lua"
          and not vim.opt.diff:get() -- if not in 'diff' mode
          and vim.api.nvim_buf_line_count(bufnr) > 26 -- Enforce a minimum line count
          and require("aerial").num_symbols(bufnr) > 3 -- Enforce a minimum symbol count
          and not require("aerial").was_closed() -- A useful way to keep aerial closed when closed manually
      end,
      -- on_first_symbols = function(bufnr)
      --   local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
      --   if ft == "lua" then require("aerial").tree_set_collapse_level(bufnr, 0) end
      -- end,
      attach_mode = "global",
      backends = { "treesitter", "lsp", "markdown", "man" },
      highlight_on_hover = true, -- Highlight the symbol in the source buffer when cursor is in the aerial win
      -- icons = require("user.global_vars").kind_icons,
      layout = { min_width = 18 },
      placement = "edge",
      close_automatic_events = { "switch_buffer", "unsupported" },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
  },
  { "goolord/alpha-nvim", enabled = false }, -- A lua powered greeter like vim-startify / dashboard-nvim
  { "max397574/better-escape.nvim", enabled = false }, -- Escape from insert mode without delay when typing
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
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
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
      buftype_exclude = {
        "nofile",
        "terminal",
      },
      filetype_exclude = {
        "aerial",
        "alpha",
        -- "cpp",
        "dashboard",
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
      context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      char = "▏",
      context_char = "▏",
      show_current_context = true,
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
        -- Class = "",
        -- Color = " ",
        -- Color = "",
        -- Constant = "",
        -- Constant = " ",
        -- Constant = "",
        -- Constant = "",
        -- Constructor = "",
        -- Event = " ",
        -- Field = " ",
        -- Field = "",
        -- File = " ",
        -- File = "",
        -- Folder = " ",
        -- Folder = "",
        -- Interface = "",
        -- Interface = "",
        -- Interface = "ﰮ",
        -- Keyword = " ",
        -- Keyword = "",
        -- Module = " ",
        -- Module = "",
        -- Namespace = "",
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
        -- TypeParameter = "",
        -- TypeParameter = "",
        -- Unit = " ",  -- codicons
        -- Unit = "",
        -- Unit = "塞",
        -- Value = " ", -- codicons
        -- Variable = " ", -- codicons
        -- Variable = "",
        Array = "",
        Boolean = "",
        Class = "ﴯ",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "ﰠ",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Key = "",
        Keyword = "",
        Method = "",
        Module = "",
        Namespace = "",
        NONE = "",
        Null = "",
        Number = "",
        Object = "",
        Operator = "",
        Package = "",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "",
        Struct = "פּ",
        Text = "",
        TypeParameter = " ", -- codicons
        Unit = "",
        Value = "",
        Variable = "",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      -- "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-path",
      -- "jc-doyle/cmp-pandoc-references",
      -- "kdheepak/cmp-latex-symbols",
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
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
            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
          },
        },
        { name = "emoji", priority = 500 },
        { name = "calc", priority = 400 },
        { name = "luasnip", priority = 50 },
      }

      -- return the new table to be used
      return opts
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      -- stages = "fade_in_slide_out",
      stages = "slide",
      timeout = 500,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- {
      --   "andymass/vim-matchup", -- Even better '%' navigate & highlight matching words
      --   keys = { "%", "g%", "[%", "]%", "z%" },
      --   -- init = function() table.insert(astronvim.file_plugins, "vim-matchup") end,
      --   init = function()
      --     vim.g.matchup_matchparen_deferred = 1
      --     -- vim.api.nvim_create_autocmd("FileType", {
      --     --   desc = "Disable matchup for julia",
      --     --   group = vim.api.nvim_create_augroup("julia_matchup", { clear = true }),
      --     --   pattern = "julia",
      --     --   callback = function()
      --     --     vim.g.matchup_matchparen_enabled = 0
      --     --     vim.g.matchup_motion_enabled = 0
      --     --     vim.g.matchup_text_obj_enabled = 0
      --     --   end,
      --     -- })
      --   end,
      -- },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      {
        "nvim-treesitter/nvim-treesitter-refactor",
      },
    },
    opts = {
      auto_install = vim.fn.executable "tree-sitter" == 1, -- Automatically install missing parsers when entering buffer if treesitter-cli is available in PATH
      -- context_commentstring = { enable = true, enable_autocmd = false },
      -- autotag = { enable = true },
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }
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
            "help",
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
      --   additional_vim_regex_highlighting = { "bib", "cmake", "cmakecache", "latex", "tex", "markdown" },
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
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            aA = "@attribute.outer",
            iA = "@attribute.inner",
            aB = "@block.outer",
            iB = "@block.inner",
            aD = "@conditional.outer",
            iD = "@conditional.inner",
            aF = "@function.outer",
            iF = "@function.inner",
            aL = "@loop.outer",
            iL = "@loop.inner",
            aP = "@parameter.outer",
            iP = "@parameter.inner",
            aR = "@regex.outer",
            iR = "@regex.inner",
            aX = "@class.outer",
            iX = "@class.inner",
            aS = "@statement.outer",
            iS = "@statement.outer",
            aN = "@number.inner",
            iN = "@number.inner",
            aC = "@comment.outer",
            iC = "@comment.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]["] = { query = "@block.outer", desc = "Next block start" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
            ["]x"] = { query = "@class.outer", desc = "Next class start" },
            ["]/"] = { query = "@comment.outer", desc = "Next comment start" },
          },
          goto_next_end = {
            ["]]"] = { query = "@block.outer", desc = "Next block end" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
            ["]X"] = { query = "@class.outer", desc = "Next class end" },
            ["]\\"] = { query = "@comment.outer", desc = "Next comment end" },
          },
          goto_previous_start = {
            ["[["] = { query = "@block.outer", desc = "Previous block start" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
            ["[x"] = { query = "@class.outer", desc = "Previous class start" },
            ["[/"] = { query = "@comment.outer", desc = "Previous comment start" },
          },
          goto_previous_end = {
            ["[]"] = { query = "@block.outer", desc = "Previous block end" },
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
            ["[X"] = { query = "@class.outer", desc = "Previous class end" },
            ["[\\"] = { query = "@comment.outer", desc = "Previous comment end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [">B"] = { query = "@block.outer", desc = "Swap next block" },
            [">F"] = { query = "@function.outer", desc = "Swap next function" },
            [">P"] = { query = "@parameter.inner", desc = "Swap next parameter" },
          },
          swap_previous = {
            ["<B"] = { query = "@block.outer", desc = "Swap previous block" },
            ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
            ["<P"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
          },
        },
        lsp_interop = {
          enable = true,
          border = "single",
          peek_definition_code = {
            ["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
            ["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
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
        filtered_items = {
          always_show = { ".github", ".gitignore" },
        },
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = function(_, opts) opts.at_edge = require("smart-splits.types").AtEdgeBehavior.stop end,
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
