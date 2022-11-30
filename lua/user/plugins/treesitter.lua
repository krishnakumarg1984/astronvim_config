-- overrides `require("treesitter").setup(...)`
return {
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

  -- ignore_install = { "latex" },
  highlight = {
    enable = true,
    use_languagetree = true, -- Use this to enable language injection
    disable = { "css", "help", "latex" },
    -- additional_vim_regex_highlighting = false,
    additional_vim_regex_highlighting = { "bib", "latex", "tex", "markdown" },
  },
  query_linter = { -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
    enable = true, -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/settings/treesitter.lua
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  context_commentstring = {
    enable = true,
    config = {
      vim = '" %s',
    },
  },
  indent = {
    enable = true,
    disable = { "help", "latex", "python", "yaml", "org" },
  },
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
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader><leader>a"] = "@parameter.inner" }, -- https://www.reddit.com/r/neovim/comments/tlkieq/swapping_objects_with_nvimtreesittertextobjects/?sort=old
      swap_previous = { ["<leader><leader>A"] = "@parameter.inner" },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer", -- "m" for method
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
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
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
  },
  -- pyfold = {
  --   enable = true,
  --   custom_foldtext = true, -- Sets provided foldtext on window where module is active
  -- },
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },
  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = "Q",
      accept = "<leader><cr>",
    },
    header_extension = "h",
    source_extension = "cxx",
    custom_define_class_function_commands = {
      TSCppImplWrite = {
        output_handle = pcall(require, '("nvim-treesitter.nt-cpp-tools.output_handlers").get_add_to_cpp()'),
      },
    },
  },
  ts_funky_keywords = { enable = true }, -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
}
