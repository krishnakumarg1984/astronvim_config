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
      filetype_exclude = {
        "aerial",
        "alpha",
        "c",
        "cpp",
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
      local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      local utils = require "astronvim.utils"

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
      -- modify the view part of the options table
      opts.view = {
        -- when in cmdline mode, or when the cursor is near the bottom of the screen, and the menu opens above the cursor, it sometimes can be preferable if the menu used a bottom down approach.
        entries = { name = "custom", selection_order = "near_cursor" },
      }

      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        col_offset = -3,
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
          local MAX_LABEL_WIDTH = 42
          local MIN_LABEL_WIDTH = 42
          -- https://www.reddit.com/r/neovim/comments/unlj8d/is_there_any_way_to_show_types_in_nvimcmp/?sort=new
          local MIN_MENU_DETAIL_WIDTH = 0
          local MAX_MENU_DETAIL_WIDTH = 0

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
        -- fields = { "kind", "abbr", "menu" },
        fields = { "kind", "abbr" },
        format = lspkind_status_ok and mycmpfmt(utils.plugin_opts "lspkind.nvim") or nil,
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
      highlight = {
        enable = true,
        use_languagetree = true, -- Use this to enable language injection
        disable = { "css", "help", "latex" },
        -- additional_vim_regex_highlighting = false,
        additional_vim_regex_highlighting = {
          "sh",
          "bash",
          "bib",
          "cmake",
          "cmakecache",
          "latex",
          "tex",
          "markdown",
        },
      },
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

-- { "AstroNvim/astrotheme", version = "^1.1", enabled = false },
-- {
--   "JoosepAlviste/nvim-ts-context-commentstring",
--   commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3",
--   enabled = false,
-- },
-- { "L3MON4D3/LuaSnip", version = "^1", enabled = false },
-- { "MunifTanjim/nui.nvim", commit = "698e75814cd7c56b0dd8af4936bcef2d13807f3c", enabled = false },
-- { "NMAC427/guess-indent.nvim", commit = "b8ae749fce17aa4c267eec80a6984130b94f80b2", enabled = false },
-- { "NvChad/nvim-colorizer.lua", commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7", enabled = false },
-- { "Shatur/neovim-session-manager", commit = "fd92e73506601a48adb843cdc0a15f2e63513754", enabled = false },
-- { "b0o/SchemaStore.nvim", commit = "15f37630d3abfb98607dd8e4625b731a8558b96d", enabled = false },
-- { "famiu/bufdelete.nvim", commit = "8933abc09df6c381d47dc271b1ee5d266541448e", enabled = false },
-- { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa", enabled = false },
-- { "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef", enabled = false },
-- { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23", enabled = false },
-- { "jay-babu/mason-null-ls.nvim", version = "^2", enabled = false },
-- { "jay-babu/mason-nvim-dap.nvim", version = "^2", enabled = false },
-- { "jose-elias-alvarez/null-ls.nvim", commit = "77e53bc3bac34cc273be8ed9eb9ab78bcf67fa48", enabled = false },
-- { "kevinhwang91/nvim-ufo", version = "^1", enabled = false },
-- { "kevinhwang91/promise-async", version = "^1", enabled = false },
-- { "mfussenegger/nvim-dap", version = "^0.6", enabled = false },
-- { "numToStr/Comment.nvim", version = "^0.8", enabled = false },
-- { "nvim-lua/plenary.nvim", version = "^0.1", enabled = false },
-- { "nvim-telescope/telescope-fzf-native.nvim", commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2", enabled = false },
-- { "nvim-telescope/telescope.nvim", version = "^0.1", enabled = false }, -- the commit at HEAD had broken vscode/tasks.json with overseer in May 2023
-- { "nvim-telescope/telescope.nvim", commit = "066bda8ea44fd981bc15b86730cc36ebc92d9788", enabled = false }, -- last working commit that works with vscode/tasks.json (overseer.nvim)
-- { "nvim-tree/nvim-web-devicons", commit = "e283ab937e0197b37ec5d8013e49495193407324", enabled = false },
-- { "rafamadriz/friendly-snippets", commit = "ef6547d2f586e08e071efeebac835e545f3015cc", enabled = false },
-- { "rcarriga/nvim-dap-ui", version = "^3", enabled = false },
-- { "rebelot/heirline.nvim", commit = "2a151df2dc870e79b138a59ebaaaddf3d1b0d703", enabled = false },
-- { "s1n7ax/nvim-window-picker", version = "^1", enabled = false },
-- { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566", enabled = false },
-- { "stevearc/dressing.nvim", commit = "2f17eee4d7709dacfad2a28f35e2acfe9a6cb09d", enabled = false },
-- { "williamboman/mason-lspconfig.nvim", version = "^1.1", enabled = false },
-- { "williamboman/mason.nvim", version = "^1", enabled = false },
-- { "windwp/nvim-ts-autotag", commit = "40615e96075c743ef47aaf9de966dc348bec6459", enabled = false },
-- { "stevearc/aerial.nvim", commit = "189bf4cce7f029ca8b3684441dd9d8ca5e6925a4" },
-- { "goolord/alpha-nvim", commit = "1838ae926e8d49fe5330d1498ee8289ae2c340bc" },
-- { "max397574/better-escape.nvim", commit = "7031dc734add47bb71c010e0551829fa5799375f" },
-- { "lewis6991/gitsigns.nvim", version = "^0.6" },
-- { "lukas-reineke/indent-blankline.nvim", version = "^2" },
-- { "folke/lazy.nvim", version = "^9" },
-- { "onsails/lspkind.nvim", commit = "57610d5ab560c073c465d6faf0c19f200cb67e6e" },
-- { "folke/neodev.nvim", version = "^2" },
-- { "nvim-neo-tree/neo-tree.nvim", version = "^2" },
-- { "hrsh7th/nvim-cmp", commit = "a9c701fa7e12e9257b3162000e5288a75d280c28" },
-- { "rcarriga/nvim-notify", version = "^3" },
-- { "nvim-treesitter/nvim-treesitter", commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16" },
-- { "mrjones2014/smart-splits.nvim", version = "^1" },
-- { "akinsho/toggleterm.nvim", version = "^2" },
-- { "folke/which-key.nvim", version = "^1" },
-- { "neovim/nvim-lspconfig", commit = "1c13e529bd5683b54a39b633a560d2f00fcb25af", enabled = false },
