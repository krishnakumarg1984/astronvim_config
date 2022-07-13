local codelldb_cmdhandle = io.popen 'find -L $HOME/.vscode/extensions -name "codelldb" -type f -print0'
---@diagnostic disable-next-line: unused-local, need-check-nil
local codelldb_cmd = codelldb_cmdhandle:read "*all" --  .. ' --params {"showDisassembly" : "never"}'

local cpptools_cmdhandle = io.popen 'find -L $HOME/.vscode/extensions -name "OpenDebugAD7" -type f -print0'
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
  python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  },
  ---@diagnostic disable-next-line: unused-local
  go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = { nil, stdout },
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then print("dlv exited with code", code) end
    end)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then vim.schedule(function() require("dap.repl").append(chunk) end) end
    end)
    -- Wait for delve to start
    vim.defer_fn(function() callback { type = "server", host = "127.0.0.1", port = port } end, 100)
  end,
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
      args = { "-x", "hah" },
      -- args = { "--params", "{'showDisassembly' : 'never'}" },
      -- showDisassembly = never,
      -- terminal = "external", -- console (default) for Debug Console, integrated for VSCode integrated terminal, external for a new terminal window
    },
    {
      name = "Debug program (with cpptools)", -- A user-readable name for the configuration
      type = "cppdbg", -- Which debug adapter to use.
      request = "launch", -- "Launch" indicates that the debug adapter should launch the application being debugged. Either `attach` or `launch`.
      program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      externalConsole = false,
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
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
  python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function() return "python" end,
    },
  },
  go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}",
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
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "DiagnosticWarn" })

-- If you're using the integrated terminal, you can configure the command that is used to create a split window:

-- dap.defaults.fallback.terminal_win_cmd = '20vsplit new'

-- Be default `dap` opens the integrated terminal but keeps focus on the current
-- buffer. If you rather have focus to be shifted to the terminal when it opens
-- you can configure:

-- dap.defaults.fallback.focus_terminal = true

-- https://github.com/David-Kunz/vim/blob/master/init.lua
-- vim.keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
-- vim.keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
