-- Modify which-key registration (Use this with mappings table)
return {
  -- first key is the mode, n == normal mode
  n = {
    -- second key is the prefix, <leader> prefixes
    ["<leader>"] = {
      -- which-key registration table for normal mode, leader prefix
      a = { name = "Code outline" },
      b = { name = "Buffers" },
      C = { name = "Crates (Rust)" },
      -- d = {
      --   name = "Debug",
      --   E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      --   e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      --   f = { "<Cmd>Telescope dap frames<cr>", "Frames" },
      --   G = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      --   -- g = { ":lua require'dap'.goto_()", "Goto line (skip rest)" },
      --   -- set_breakpoint({condition}, {hit_condition}, {log_message})
      --   -- goto_({line})
      --   h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      --   -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      --   -- i = { function() require("dap").step_into() end, "Step Into", },
      --   L = {
      --     function() require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end,
      --     "Lop point message (debug)",
      --   },
      --   l = { function() require("dap").run_last() end, "Run last debugged" },
      --   m = { "<Cmd>Telescope dap commands<cr>", "Debug commands" },
      --   n = { "<Cmd>Telescope dap configurations<cr>", "Debug configurations" },
      --   -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      --   -- o = { function() require("dap").step_over() end, "Step Over", },
      --   p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      --   q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      --   -- q = { function() require("dap").close() end, "Close debug session", },
      --   Q = { function() require("dap").terminate() end, "Terminate debug session" },
      --   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      --   -- r = { function() require("dap").repl.toggle() end, "Debug REPL Toggle", },
      --   R = { function() require("dap").repl.open() end, "Debug REPL Open" },
      --   S = {
      --     "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>",
      --     "Scopes (floating centered)",
      --   },
      --   -- s = { "<cmd>lua require'dap.ui.widgets'.scopes<cr>", "Scopes" },
      --   s = { function() require("dapui").float_element "scopes" end, "Scopes (debug-ui)" },
      --   T = { function() require("dapui").float_element "stacks" end, "Threads (debug-ui)" },
      --   t = { function() require("dapui").float_element "console" end, "Console (Floating)" },
      --   u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      --   -- u = { function() require("dapui").toggle() end, "Toggle Debugger UI", },
      --   v = { "<Cmd>Telescope dap variables<cr>", "Variables" },
      --   w = { function() require("dapui").float_element "watches" end, "Watches (debug-ui)" },
      --   -- x = { function() require("dap.ui.widgets").hover() end, "Inspect (debug-ui)", },
      --   -- v = { ":DapVirtualTextToggle<cr>", "Virtual Text" },
      -- },
      e = { "<cmd>Neotree action=show toggle=true<CR>", "File explorer" },
      f = {
        name = "File/Buffer",
        ["H"] = { "<cmd>Telescope search_history<CR>", "Buffer grep history" },
        ["o"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
      },
      g = {
        B = { "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer" },
        -- b = branches, -- astronvim default
        C = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
        -- c = commits, -- astronvim default
        D = { "<cmd>DiffviewOpen<cr>", "Git Diff (interactive)" },
        -- d = diffs, -- astronvim default
        f = { "<cmd>Telescope git_files<cr>", "Open file in repo" },
        -- g = lazygit, -- astronvim default
        g = nil, -- disable lazygit
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
        s = { "<cmd>Telescope git_status<cr>", "Status (Telescope)" },
        S = { "<cmd>Neotree git_status<cr>", "Status (Neotree)" },
        t = { "<cmd>Telescope git_stash<cr>", "Stash all changes" },
        T = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle deleted" },
        -- u = Undo stage hunk, -- astronvim default
        U = { function() astronvim.toggle_term_cmd "gitui" end, "GitUI" },
      },
      l = {
        name = "Intellisense (LSP)",
        j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        -- q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
        t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        Y = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols" },
        y = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Dynamic workspace symbols" },
      },
      -- N = { "<cmd>lua require('nabla').popup()<CR>", "Scientific preview" },
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
      r = { name = "Rust/Cargo", b = { name = "build" } },
      s = {
        name = "Search/Set",
        a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
        -- b = { "<cmd>Telescope builtin<cr>", "Builtins" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        B = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in current buffer" },
        C = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
        d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find (buffer)" },
        G = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
        -- g = { "<cmd>Telescope grep_string<cr>", "Search cursor word" },
        H = { "<cmd>Telescope command_history<cr>", "Command history" },
        i = { "<cmd>Telescope symbols<cr>", "Icons (emojis/symbols)" },
        j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
        l = { "<cmd>Telescope loclist<cr>", "Location list" },
        L = { "<cmd>Telescope reloader<cr>", "Reloader" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        P = { "<cmd>Telescope spell_suggest<cr>", "Spell suggest" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        Q = { "<cmd>Telescope quickfix<cr>", "Quickfix history" },
        R = { "<cmd>Telescope resume<cr>", "Resume last" },
        s = { "<cmd>Telescope treesitter<cr>", "Outline symbols" },
        S = { "<cmd>Telescope luasnip<cr>", "Code snippets" },
        t = { "<cmd>Telescope tags<cr>", "Tags in project" },
        T = { "<cmd>Telescope tagstack<cr>", "Tagstack" },
        v = { "<cmd>Telescope vim_options<cr>", "Vim options" },
        y = { "<cmd>Telescope filetypes<cr>", "Choose filetype" },
      },
      T = {
        name = "Unit Tests",
      },
      t = {
        -- l = lazygit -- astronvim default
        l = nil, -- disable lazygit
        g = { function() astronvim.toggle_term_cmd "gitui" end, "GitUI" },
      },
      v = { name = "VimTeX" },
      x = { name = "Diagnostics" },
    },
    ["g"] = {
      a = { name = "Textcase plugin operations" },
    },
  },
  v = {
    ["leader"] = {
      d = {
        name = "Debug",
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      },
      v = { name = "VimTeX" },
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
