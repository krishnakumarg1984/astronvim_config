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
        name = "Buffers",
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
        x = { "<Cmd>BufOnly<CR>", "Only current buffer" },
      },
      D = { "<cmd>windo diffthis<CR>", "diff buffers" },
      d = {
        name = "Debug",
        -- B = { function() require("dap").list_breakpoints() end, "List breakpoints" },
        B = { "<cmd>Telescope dap list_breakpoints<cr>", "List breakpoints" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        -- C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
        -- C = {
        --   function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
        --   "Set conditional breakpoint",
        -- },
        C = {
          "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint(vim.fn.input)<cr>",
          "Set conditional breakpoint",
        },
        -- c = { function() require("dap").clear_breakpoints() end, "Clear breakpoints" },
        -- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        -- c = { function() require("dap").continue() end, "Continue", },
        c = {
          "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
          "Clear breakpoints",
        },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
        f = { "<Cmd>Telescope dap frames<cr>", "Frames" },
        G = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        -- g = { ":lua require'dap'.goto_()", "Goto line (skip rest)" },
        -- set_breakpoint({condition}, {hit_condition}, {log_message})
        -- goto_({line})
        h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
        -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        -- i = { function() require("dap").step_into() end, "Step Into", },
        L = {
          function() require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end,
          "Lop point message (debug)",
        },
        l = { function() require("dap").run_last() end, "Run last debugged" },
        m = { "<Cmd>Telescope dap commands<cr>", "Debug commands" },
        n = { "<Cmd>Telescope dap configurations<cr>", "Debug configurations" },
        -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        -- o = { function() require("dap").step_over() end, "Step Over", },
        p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        -- q = { function() require("dap").close() end, "Close debug session", },
        Q = { function() require("dap").terminate() end, "Terminate debug session" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        -- r = { function() require("dap").repl.toggle() end, "Debug REPL Toggle", },
        R = { function() require("dap").repl.open() end, "Debug REPL Open" },
        S = {
          "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>",
          "Scopes (floating centered)",
        },
        -- s = { "<cmd>lua require'dap.ui.widgets'.scopes<cr>", "Scopes" },
        s = { function() require("dapui").float_element "scopes" end, "Scopes (debug-ui)" },
        T = { function() require("dapui").float_element "stacks" end, "Threads (debug-ui)" },
        t = { function() require("dapui").float_element "console" end, "Console (Floating)" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
        -- u = { function() require("dapui").toggle() end, "Toggle Debugger UI", },
        v = { "<Cmd>Telescope dap variables<cr>", "Variables" },
        w = { function() require("dapui").float_element "watches" end, "Watches (debug-ui)" },
        -- x = { function() require("dap.ui.widgets").hover() end, "Inspect (debug-ui)", },
        -- v = { ":DapVirtualTextToggle<cr>", "Virtual Text" },
      },
      e = { "<cmd>Neotree action=show toggle=true<CR>", "File explorer" },
      f = { name = "File/Buffer" },
      g = {
        B = { "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer" },
        -- b = branches, -- astronvim default
        C = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
        -- c = commits, -- astronvim default
        D = { "<cmd>DiffviewOpen<cr>", "Git Diff (interactive)" },
        -- d = diffs, -- astronvim default
        f = { "<cmd>Telescope git_files<cr>", "Open file in repo" },
        -- g = lazygit, -- astronvim default
        h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
        -- j = next hunk, -- astronvim default
        -- k = previous hunk, -- astronvim default
        -- l = blame, -- astronvim default
        L = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" },
        n = { "<cmd>Neogit<cr>", "Neogit" },
        -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        -- p = preview hunk, -- astronvim default
        -- R = reset buffer, -- astronvim default
        R = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
        s = { "<cmd>Telescope git_status<cr>", "Status" },
        t = { "<cmd>Telescope git_stash<cr>", "Stash all changes" },
        T = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle deleted" },
        -- u = Undo stage hunk, -- astronvim default
        U = { function() astronvim.toggle_term_cmd "gitui" end, "GitUI" },
      },
      l = {
        j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        -- q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        y = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
      },
      N = { "<cmd>lua require('nabla').popup()<CR>", "Scientific preview" },
      n = {
        name = "Annotate",
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
      s = {
        name = "Search/Set",
        a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
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
      T = {
        name = "Unit Tests",
      },
      t = {
        -- l = lazygit -- astronvim default
        g = { function() astronvim.toggle_term_cmd "gitui" end, "GitUI" },
      },
      x = { name = "Diagnostics" },
    },
  },
  v = {
    ["leader"] = {
      d = { name = "Debug", e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" } },
    },
  },
}

-- https://github.com/David-Kunz/vim/blob/master/init.lua
-- function diffThisBranch()
--   local branch = vim.fn.input("Branch: ", "")
--   require"gitsigns".diffthis(branch)
-- end
-- vim.keymap.set('n', '<leader>hD', function() require"gitsigns".diffthis("~") end)
-- vim.keymap.set('n', '<leader>hm', function() require"gitsigns".diffthis("main")end)
-- vim.keymap.set('n', '<leader>hM', diffThisBranch)

-- d = {
--   name = "Debug",
--   C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
--   U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
--   b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--   c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--   d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--   e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
--   g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--   h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
--   S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
--   i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--   o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--   p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
--   q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--   s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--   t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--   x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
--   u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
-- },
