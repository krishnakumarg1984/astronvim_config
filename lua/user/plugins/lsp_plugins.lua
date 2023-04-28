return {
  {
    "p00f/clangd_extensions.nvim", --  Clangd's off-spec features for neovim's LSP client. Use https://sr.ht/~p00f/clangd_extensions.nvim instead
    init = function() table.insert(astronvim.lsp.skip_setup, "clangd") end,
    ft = { "c", "cpp", "cuda", "objc", "objcpp", "proto" },
    opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
  },
  {
    "onsails/lspkind.nvim", --  vscode-like pictograms for neovim lsp completion items
    opts = {
      -- set some missing symbol types
      symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        Snippet = "",
        String = "",
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- renders diagnostics using virtual lines on top of the real line of code
    keys = { { "<leader>ln", "<leader>ln", desc = "Toggle inline diag" } },
    config = function()
      local lsp_lines = require "lsp_lines"
      lsp_lines.setup()
      vim.keymap.set("", "<leader>ln", lsp_lines.toggle, { desc = "Toggle inline diagnostics" })
    end,
  },
  {
    "ray-x/lsp_signature.nvim", -- LSP signature hint as you type
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
  {
    "weilbith/nvim-code-action-menu", -- Pop-up menu for code actions to show meta-information and diff preview
    -- cmd = "CodeActionMenu",
    lazy = false,
    -- keys = { "<leader>lc", "<cmd>CodeActionMenu<CR>", desc = "Code action(s)" },
    vim.keymap.set("n", "<leader>lc", "<cmd>CodeActionMenu<CR>", { desc = "Code action(s)" }),
  },
  {
    "neovim/nvim-lspconfig", --  Quickstart configs for Nvim LSP
    dependencies = {
      {
        "folke/neoconf.nvim", -- Neovim plugin to manage global and project-local settings
        cmd = "Neoconf",
        config = true,
      },
      {
        "kosayoda/nvim-lightbulb", -- VSCode bulb for neovim's built-in LSP.
        -- event = { "CursorHold", "CursorHoldI" },
        config = function()
          require("nvim-lightbulb").setup {
            sign = { enabled = false },
            virtual_text = { enabled = true },
            autocmd = { enabled = true },
          }
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim", --  Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    opts = {
      sources = {},
    },
    -- opts = function(_, opts)
    --   local builtins = require("null-ls").builtins
    --   opts.sources = { -- add sources that are local
    --     builtins.formatting.bibclean,
    --   }
    --   return opts
    -- end,
  },
  {
    "simrat39/rust-tools.nvim", -- Tools for better development in rust using neovim's builtin lsp
    init = function() table.insert(astronvim.lsp.skip_setup, "rust_analyzer") end,
    ft = { "rust" },
    opts = function()
      local codelldb_dir = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/"
      local codelldb_executable_path = codelldb_dir .. "adapter/codelldb"
      local liblldb_path = codelldb_dir .. "lldb/lib/liblldb.so"
      return {
        -- tools = {
        --   inlay_hints = {
        --     parameter_hints_prefix = "  ",
        --     other_hints_prefix = "  ",
        --   },
        -- },
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_executable_path, liblldb_path),
        },
        server = require("astronvim.utils.lsp").config "rust_analyzer",
      }
    end,
    -- config = function()
    --   require("rust-tools").setup {
    --     tools = {
    --       -- on_initialized = function()
    --       --   vim.cmd [[
    --       --     autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
    --       --   ]]
    --       -- end,
    --       -- inlay_hints = { auto = false },
    --     },
    --     -- server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
    --   }
    -- end,
  },
  {
    "folke/trouble.nvim", -- Helps you solve all the trouble your code is causing
    keys = { { "<leader>x", "<leader>x", desc = "Trouble help" } },
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics",
        use_diagnostic_signs = true,
        action_keys = {
          close = { "q", "<esc>" },
          cancel = "<c-e>",
        },
      }
      vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { desc = "Show document diagnostics" })
      vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Diagnostics (loc list)" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Diagnostics (quickfix list)" })
      vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { desc = "Show workspace diagnostics" })
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle diagnostics window" })
      vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", { desc = "Symbol references (diagnostics window)" })
    end,
  },
}
