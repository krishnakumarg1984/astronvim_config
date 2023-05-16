return {
  {
    "danymat/neogen", -- A better annotation generator. Supports multiple languages and annotation conventions.
    cmd = { "Neogen", "Neogen func", "Neogen class", "Neogen file", "Neogen type" },
    -- cmd = { "Neogen" },
    keys = {
      -- { "<leader>nn", function() require("neogen").generate { type = "current" } end, desc = "Generate annotation" },
      -- { "<leader>nc", function() require("neogen").generate { type = "class" } end, desc = "Class annotation" },
      -- { "<leader>nf", function() require("neogen").generate { type = "func" } end, desc = "Function annotation" },
      -- { "<leader>ni", function() require("neogen").generate { type = "file" } end, desc = "File annotation" },
      -- { "<leader>nt", function() require("neogen").generate { type = "type" } end, desc = "Type annotation" },
      { "<leader>nc", "<cmd>Neogen class<CR>", desc = "Class annotation" },
      { "<leader>nf", "<cmd>Neogen func<CR>", desc = "Func annotation" },
      { "<leader>ni", "<cmd>Neogen file<CR>", desc = "File annotation" },
      { "<leader>nn", "<cmd>Neogen<CR>", desc = "Generate annotation" },
      { "<leader>nt", "<cmd>Neogen type<CR>", desc = "Type annotation" },
    },
    opts = {
      snippet_engine = "luasnip",
      languages = {
        bash = { template = { annotation_convention = "google_bash" } },
        c = { template = { annotation_convention = "doxygen" } },
        cpp = { template = { annotation_convention = "doxygen" } },
        go = { template = { annotation_convention = "godoc" } },
        java = { template = { annotation_convention = "javadoc" } },
        javascript = { template = { annotation_convention = "jsdoc" } },
        javascriptreact = { template = { annotation_convention = "jsdoc" } },
        lua = { template = { annotation_convention = "ldoc" } },
        python = { template = { annotation_convention = "google_docstrings" } },
        ruby = { template = { annotation_convention = "tomdoc" } },
        rust = { template = { annotation_convention = "rustdoc" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
  {
    "ethanholz/nvim-lastplace", -- A Lua rewrite of vim-lastplace
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help", "terminal", "lspinfo" },
        lastplace_ignore_filetype = {
          "dashboard",
          "DiffviewFiles",
          "gitcommit",
          "gitrebase",
          "hgcommit",
          "mason",
          "neo-tree",
          "Neogitcommit",
          "NeogitCommitMessage",
          "NeogitPopup",
          "neogitstatus",
          "NvimTree",
          "packer",
          "startify",
          "svn",
          "Trouble",
        },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    name = "lint", -- An asynchronous linter plugin. Loads through local .vimrc.lua
  },
  {
    "johmsalas/text-case.nvim", -- An all in one plugin for converting text case
    keys = { { "ga", "ga", desc = "Text case ..." } },
    config = function()
      require("textcase").setup {}

      vim.keymap.set(
        { "n", "o", "v", "x" },
        "gaa",
        "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>",
        { desc = "Convert to phrase case" }
      )
      vim.keymap.set(
        { "n", "o", "v", "x" },
        "gaf",
        "<cmd>lua require('textcase').current_word('to_path_case')<CR>",
        { desc = "Convert to path case" }
      )
      vim.keymap.set(
        { "n", "o", "v", "x" },
        "gas",
        "<cmd>lua require('textcase').current_word('to_snake_case')<CR>",
        { desc = "Convert to snake case" }
      )
      vim.keymap.set(
        { "n", "o", "v", "x" },
        "gat",
        "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
        { desc = "Convert to title case" }
      )
      vim.keymap.set(
        { "n", "o", "v", "x" },
        "gaz",
        "<cmd>lua require('textcase').current_word('to_dot_case')<CR>",
        { desc = "Convert to dot case" }
      )
      vim.keymap.set(
        { "n", "v", "o" },
        "gaA",
        "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>",
        { desc = "LSP rename to phrase_case" }
      )
      vim.keymap.set(
        { "n", "v", "o" },
        "gaF",
        "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>",
        { desc = "LSP rename to path_case" }
      )
      vim.keymap.set(
        { "n", "v", "o" },
        "gaS",
        "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>",
        { desc = "LSP rename to snake_case" }
      )
      vim.keymap.set(
        { "n", "v", "o" },
        "gaT",
        "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>",
        { desc = "LSP rename to title_case" }
      )
      vim.keymap.set(
        { "n", "v", "o" },
        "gaZ",
        "<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>",
        { desc = "LSP rename to dot_case" }
      )
    end,
  },
}
