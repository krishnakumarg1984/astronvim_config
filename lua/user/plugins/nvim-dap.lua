return function()
  -- 💀 Adjust the path to your executable
  local cmd = "/home/krishnakumar/sw_src/scripts_and_archives_for_installing/codelldb/adapter/codelldb"

  local dap = require "dap"

  dap.adapters = {
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
      handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
        stdout:close()
        stderr:close()
        handle:close()
        if code ~= 0 then
          print("codelldb exited with code", code)
        end
      end)
      if not handle then
        vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
        stdout:close()
        stderr:close()
        return
      end
      vim.notify("codelldb started. pid=" .. pid_or_err)
      stderr:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(function()
            require("dap.repl").append(chunk)
          end)
        end
      end)
      local adapter = {
        type = "server",
        host = "127.0.0.1",
        port = port,
      }
      -- 💀
      -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
      -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
      vim.defer_fn(function()
        on_adapter(adapter)
      end, 500)
    end,
    python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    },
    cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/krishnakumar/sw_src/scripts_and_archives_for_installing/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
      -- name = "cpptools",
      options = {
        detached = false,
      },
    },
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
        if code ~= 0 then
          print("dlv exited with code", code)
        end
      end)
      assert(handle, "Error running dlv: " .. tostring(pid_or_err))
      stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(function()
            require("dap.repl").append(chunk)
          end)
        end
      end)
      -- Wait for delve to start
      vim.defer_fn(function()
        callback { type = "server", host = "127.0.0.1", port = port }
      end, 100)
    end,
  }
  dap.configurations = {
    python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
      },
    },
    cpp = {
      {
        -- name = "Launch file",
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        -- type = "codelldb",
        request = "launch",
        MIMode = "gdb",
        -- miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        -- stopOnEntry = true,
        -- stopOnEntry = false,
        -- args = {},
        -- runInTerminal = true,
        -- setupCommands = {
        --   {
        --     text = "-enable-pretty-printing",
        --     description = "enable pretty printing",
        --     ignoreFailures = false,
        --   },
        -- },
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
  dap.configurations.rust = dap.configurations.cpp
  local function start_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
  end
  local function terminate_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
  end
  dap.listeners.after.event_initialized["dapui"] = start_session
  dap.listeners.before.event_terminated["dapui"] = terminate_session
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end
