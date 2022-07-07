-- Add 'which-key' bindings
return {
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
      b = {
        name = "Bufferline",
        ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 1" },
        ["2"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 2" },
        ["3"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 3" },
        ["4"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 4" },
        ["5"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 5" },
        ["6"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 6" },
        ["7"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 7" },
        ["8"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 8" },
        ["9"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 9" },
        d = { "<Cmd>BufferLineSortByDirectory<CR>", "Sort bufferline by directory" },
        e = { "<Cmd>BufferLineSortByExtension<CR>", "Sort bufferline by extension" },
        c = { "<Cmd>BufferLinePick<CR>", "Choose buffer (interactive)" },
        C = { "<Cmd>BufferLinePickClose<CR>", "Pick buffer to close (interactive)" },
        M = { "<Cmd>BufferLineMovePrev<CR>", "Reorder (move left)" },
        m = { "<Cmd>BufferLineMoveNext<CR>", "Reorder (move right)" },
        p = { "<Cmd>BufferLineTogglePin<CR>", "Pin buffer (toggle)" },
      },
      D = { "<cmd>windo diffthis<CR>", "diff buffers" },
      d = {
        name = "Debug",
        b = {
          function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
          "Set conditional breakpoint",
        },
        B = {
          function() require("dap").list_breakpoints() end,
          "List breakpoints",
        },
        C = {
          function() require("dap").clear_breakpoints() end,
          "Clear breakpoints",
        },
        -- c = {
        --   function()
        --     require("dap").continue()
        --   end,
        --   "Continue",
        -- },
        -- i = {
        --   function()
        --     require("dap").step_into()
        --   end,
        --   "Step Into",
        -- },
        L = {
          function() require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end,
          "Lop point message (debug)",
        },
        l = {
          function() require("dap").run_last() end,
          "Run last debugged",
        },
        -- o = {
        --   function()
        --     require("dap").step_over()
        --   end,
        --   "Step Over",
        -- },
        q = {
          function() require("dap").close() end,
          "Close debug session",
        },
        Q = {
          function() require("dap").terminate() end,
          "Terminate debug session",
        },
        r = {
          function() require("dap").repl.toggle() end,
          "Debug REPL Toggle",
        },
        R = {
          function() require("dap").repl.open() end,
          "Debug REPL Open",
        },
        -- s = {
        --   function()
        --     require("dapui").float_element "scopes"
        --   end,
        --   "Scopes (debug-ui)",
        -- },
        -- t = {
        --   function()
        --     require("dapui").float_element "stacks"
        --   end,
        --   "Threads (debug-ui)",
        -- },
        -- u = {
        --   function()
        --     require("dapui").toggle()
        --   end,
        --   "Toggle Debugger UI",
        -- },
        -- w = {
        --   function()
        --     require("dapui").float_element "watches"
        --   end,
        --   "Watches (debug-ui)",
        -- },
        -- x = {
        --   function()
        --     require("dap.ui.widgets").hover()
        --   end,
        --   "Inspect (debug-ui)",
        -- },
        -- v = { ":DapVirtualTextToggle<cr>", "Virtual Text" },
      },
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
          function() astronvim.toggle_term_cmd "gitui" end,
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
        -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
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
      N = { "<cmd>lua require('nabla').popup()<CR>", "Scientific preview" },
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
        -- l = { nil },
        g = {
          function() astronvim.toggle_term_cmd "gitui" end,
          "GitUI",
        },
      },
      w = { nil },
    },
  },
}
