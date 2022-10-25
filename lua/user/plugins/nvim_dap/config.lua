local codelldb_cmdhandle = io.popen 'find -L $HOME/.local/share/nvim/mason/bin -name "codelldb" -type f -print0'
---@diagnostic disable-next-line: unused-local, need-check-nil
local codelldb_cmd = codelldb_cmdhandle:read "*all" --  .. ' --params {"showDisassembly" : "never"}'

local cpptools_cmdhandle = io.popen 'find -L $HOME/.local/share/nvim/mason/bin -name "OpenDebugAD7" -type f -print0'
---@diagnostic disable-next-line: unused-local, need-check-nil
local cpptools_cmd = cpptools_cmdhandle:read "*all"

local dap = require "dap"

-- To tell Neovim if it should launch a debug adapter or connect to one, and if so, how, you need to configure them via the `dap.adapters` table.
-- The key of the `dap.adapters` table is an arbitrary name that debug adapters are looked up by when using a dap-configuration.
--`dap.adapters.<name>` is set to a `Adapter`.
dap.adapters = {
  cppdbg = {
    id = "cppdbg",
    type = "executable", -- indicate that nvim-dap must launch the debug adapter. If type is "executable", nvim-dap will spawn the given process and communicate with it using stdio. If type is "server", indicate that nvim-dap can connect to an already-running debug adapter via TCP.
    command = cpptools_cmd,
    -- command = os.getenv "HOME" .. "/sw_src/scripts_and_archives_for_installing/cpptools/extension/debugAdapters/bin/OpenDebugAD7", -- command to invoke
    -- name = "cpptools",
    -- options = {
    --   detached = false, -- defaults to true. Spawn the debug adapter process in a detached state.
    -- },
  },
  codelldb = function(on_adapter)
    -- This asks the system for a free port
    local tcp = vim.loop.new_tcp()
    tcp:bind("127.0.0.1", 0)
    local port = tcp:getsockname().port
    tcp:shutdown()
    tcp:close()

    -- Start codelldb with the port
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local opts = {
      stdio = { nil, stdout, stderr },
      args = { "--port", tostring(port) },
      detached = true,
    }
    local handle
    local pid_or_err
    handle, pid_or_err = vim.loop.spawn(codelldb_cmd, opts, function(code)
      stdout:close()
      stderr:close()
      handle:close()
      if code ~= 0 then print("codelldb exited with code", code) end
    end)
    if not handle then
      vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
      stdout:close()
      stderr:close()
      return
    end
    vim.notify("\rcodelldb started. pid=" .. pid_or_err)
    stderr:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then vim.schedule(function() require("dap.repl").append(chunk) end) end
    end)
    local adapter = {
      type = "server",
      host = "127.0.0.1",
      port = port,
    }
    -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
    -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
    vim.defer_fn(function() on_adapter(adapter) end, 500)
  end,
  ---@diagnostic disable-next-line: unused-local
  go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle, pid_or_err, port = nil, nil, 38697
    local opts = {
      stdio = { nil, stdout },
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then print("Delve has exited with code: ", code) end
    end)
    assert(handle, "Error running Delve: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then vim.schedule(function() require("dap.repl").append(chunk) end) end
    end)
    -- Wait for delve to start
    vim.defer_fn(function() callback { type = "server", host = "127.0.0.1", port = port } end, 100)
  end,
  nlua = {
    function(callback, config) callback { type = "server", host = config.host, port = config.port } end,
  },
  python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  },
}

-- The keys of `dap.configurations` are filetypes
dap.configurations = { -- "launch configurations"
  cpp = {
    {
      name = "Debug program (with codelldb)", -- Launch configuration name.
      type = "codelldb",
      request = "launch", -- either 'launch' or 'attach'
      program = function() -- Path to the debuggee executable
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false, -- Whether to stop debuggee immediately after launching.
      -- args = { "--params", "{'showDisassembly' : 'never'}" },
      showDisassembly = "never",
      -- terminal = "external", -- console (default) for Debug Console, integrated for VSCode integrated terminal, external for a new terminal window
      terminal = "integrated",
      console = "integratedTerminal",
    },
    {
      name = "Debug program (with cpptools)", -- A user-readable name for the configuration
      type = "cppdbg", -- Which debug adapter to use.
      request = "launch", -- "Launch" indicates that the debug adapter should launch the application being debugged. Either `attach` or `launch`.
      program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      showDisplayString = true,
      MIMode = "gdb",
      -- miDebuggerPath = "/usr/local/bin/prime-debug",
      externalConsole = false,
      setupCommands = {
        { text = "-enable-pretty-printing", description = "enable pretty printing", ignoreFailures = true },
      },
    },
    {
      name = "Launch vscode-gdb on Nvidia",
      type = "cppdbg",
      request = "launch",
      program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
      -- externalConsole = true,
      -- visualizerFile = vim.env.XDG_DATA_HOME .. "/debug-adapters/natvis/concurrency.natvis",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      showDisplayString = true,
      MIMode = "gdb",
      miDebuggerPath = "/usr/local/bin/prime-debug",
      setupCommands = {
        { text = "-enable-pretty-printing", description = "enable pretty printing", ignoreFailures = true },
      },
    },
    -- {
    --   name = "Attach to gdbserver :1234",
    --   type = "cppdbg",
    --   request = "launch",
    --   MIMode = "gdb",
    --   miDebuggerServerAddress = "localhost:1234",
    --   miDebuggerPath = "/usr/bin/gdb",
    --   cwd = "${workspaceFolder}",
    --   program = function()
    --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    --   end,
    --   externalConsole = false,
    --   setupCommands = {
    --     {
    --       text = "-enable-pretty-printing",
    --       description = "enable pretty printing",
    --       ignoreFailures = false,
    --     },
    --   },
    -- },
  },
  go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      showLog = true,
      program = "${file}",
      -- console = "externalTerminal",
      dlvToolPath = vim.fn.exepath "dlv",
    },
    {
      type = "go",
      name = "Debug test current file", -- configuration for debugging test files
      request = "launch",
      showLog = true,
      mode = "test",
      program = "${file}",
      dlvToolPath = vim.fn.exepath "dlv",
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  },
  lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
      host = function()
        local value = vim.fn.input "Host [127.0.0.1]: "
        if value ~= "" then return value end
        return "127.0.0.1"
      end,
      port = function()
        local val = tonumber(vim.fn.input("Port: ", "54321"))
        assert(val, "Please provide a port number")
        return val
      end,
    },
  },
  python = {
    {
      type = "python",
      request = "launch",
      name = "Debug current file (only user code)",
      -- program = "${file}",
      program = "${workspaceFolder}/${file}",
      pythonPath = function() return "python" end,
      console = "integratedTerminal",
      autoReload = { enable = true },
      justMyCode = true,
    },
    {
      type = "python",
      request = "launch",
      name = "Debug current file (also external/library code)",
      -- program = "${file}",
      program = "${workspaceFolder}/${file}",
      pythonPath = function() return "python" end,
      console = "integratedTerminal",
      autoReload = { enable = true },
      justMyCode = false,
    },
  },
}

-- Dap signs are now defined by AstroNVim. See here: https://github.com/AstroNvim/AstroNvim/commit/f61e63f90a22d0a45cb652f3cfa8076bb6144c9a
-- -- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
-- -- vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
-- vim.fn.sign_define(
--   "DapBreakpointCondition",
--   { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
-- )
-- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "LspDiagnosticsSignError" })
-- -- vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
-- vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DapLogPoint", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
-- -- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "LspDiagnosticsSignError" })
-- -- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
-- -- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "LspDiagnosticsSignHint" })
-- -- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "DiagnosticWarn" })
-- -- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "LspDiagnosticsSignInformation", linehl = "DiagnosticUnderlineInfo", numhl = "LspDiagnosticsSignInformation" })

-- If you're using the integrated terminal, you can configure the command that is used to create a split window:

-- dap.defaults.fallback.terminal_win_cmd = "20vsplit new"

-- Be default `dap` opens the integrated terminal but keeps focus on the current
-- buffer. If you rather have focus to be shifted to the terminal when it opens
-- you can configure:

-- dap.defaults.fallback.focus_terminal = true

-- If you want to use the `externalTerminal` you need to setup the terminal which should be launched by nvim-dap:

-- https://github.com/David-Kunz/vim/blob/master/init.lua
-- vim.keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
-- vim.keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)

-- nvim-dap keymaps (((

vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", { silent = true })
-- vim.keymap.set("n", "<F6>", "<Cmd>lua require'dap'.pause()<CR>", { silent = true })
-- vim.keymap.set("n", "<F7>", "<Cmd>lua require'dapui'.float_element('console')<CR>", { silent = true }) -- conflicts with vimtex's { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
-- vim.keymap.set("n", "<F8>", "<Cmd>lua require'dap'.run_to_cursor()<CR>", { silent = true }) -- conflicts with vimtex's (Add `\left ... \right)` modifiers to surrounding delimiters with `<F8>`)
-- -- ["<F9>" ,  "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", silent = true },
vim.keymap.set("n", "<leader>dg", "<Cmd>lua require'dap'.goto_(", { silent = true })
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", { silent = true })

-- )))
