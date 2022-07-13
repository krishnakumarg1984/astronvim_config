local dap, dapui = require "dap", require "dapui"
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = { -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    -- expand = { "<CR>", "<LeftMouse>" },
    open = "o",
    -- remove = "d",
    remove = { "d", "x" },
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has "nvim-0.7", -- Expand lines larger than the window (Requires >= 0.7)
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position.
  -- It can be an Int or a Float.
  -- Integer specifies height/width directly (i.e. 20 lines/columns) while Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = { -- Elements can be strings or table with id and size keys.
        { id = "breakpoints", size = 0.30 }, -- Match this value
        { id = "scopes", size = 0.20 },
        { id = "stacks", size = 0.20 },
        { id = "watches", size = 0.30 },
      },
      size = 0.25,
      position = "left",
    },
    {
      elements = {
        -- "repl", -- The REPL provided by nvim-dap.
        "console", -- The console window used by nvim-dap for the integrated terminal.
      },
      size = 0.30, -- With this value
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", --  Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
}

-- add listeners to auto open DAP UI
-- use the DAP listener to display the UI when a debug session starts and close it when the session exits
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- local function start_session(_, _)
--   local info_string = string.format("%s", dap.session().config.program)
--   vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
-- end
-- local function terminate_session(_, _)
--   local info_string = string.format("%s", dap.session().config.program)
--   vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
-- end
-- dap.listeners.after.event_initialized["dapui_config"] = start_session
-- dap.listeners.before.event_terminated["dapui_config"] = terminate_session
