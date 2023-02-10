return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "andymass/vim-matchup", -- Even better '%' navigate & highlight matching words
      keys = { "%", "g%", "[%", "]%", "z%" },
      -- init = function() table.insert(astronvim.file_plugins, "vim-matchup") end,
      init = function()
        vim.g.matchup_matchparen_deferred = 1

        vim.api.nvim_create_autocmd("FileType", {
          desc = "Disable matchup for julia",
          group = vim.api.nvim_create_augroup("julia_matchup", { clear = true }),
          pattern = "julia",
          callback = function()
            vim.g.matchup_matchparen_enabled = 0
            vim.g.matchup_motion_enabled = 0
            vim.g.matchup_text_obj_enabled = 0
          end,
        })
      end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    autotag = { enable = true },
    auto_install = vim.fn.executable "tree-sitter" == 1, -- Automatically install missing parsers when entering buffer if treesitter-cli is available in PATH
    ensure_installed = { "c", "help", "lua", "vim" }
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
    highlight = {
      enable = true,
      use_languagetree = true, -- Use this to enable language injection
      disable = { "css", "help", "latex" },
      -- additional_vim_regex_highlighting = false,
      additional_vim_regex_highlighting = { "bib", "cmake", "cmakecache", "latex", "tex", "markdown" },
    },
    query_linter = { -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
      enable = true, -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/settings/treesitter.lua
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    indent = {
      enable = true,
      disable = { "help", "latex", "python", "yaml", "org" },
    },
    matchup = { enable = true, disable = { "julia" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
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
          smart_rename = "grr", -- in the absence of LSP , can use treesitter for smart renaming
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
          ["]c"] = { query = "@comment.outer", desc = "Next comment start" },
        },
        goto_next_end = {
          ["]]"] = { query = "@block.outer", desc = "Next block end" },
          ["]F"] = { query = "@function.outer", desc = "Next function end" },
          ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
          ["]X"] = { query = "@class.outer", desc = "Next class end" },
          ["]C"] = { query = "@comment.outer", desc = "Next comment end" },
        },
        goto_previous_start = {
          ["[["] = { query = "@block.outer", desc = "Previous block start" },
          ["[f"] = { query = "@function.outer", desc = "Previous function start" },
          ["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
          ["[x"] = { query = "@class.outer", desc = "Previous class start" },
          ["[c"] = { query = "@comment.outer", desc = "Previous comment start" },
        },
        goto_previous_end = {
          ["[]"] = { query = "@block.outer", desc = "Previous block end" },
          ["[F"] = { query = "@function.outer", desc = "Previous function end" },
          ["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
          ["[X"] = { query = "@class.outer", desc = "Previous class end" },
          ["[C"] = { query = "@comment.outer", desc = "Previous comment end" },
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
    ts_funky_keywords = { enable = true }, -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
  },
}
