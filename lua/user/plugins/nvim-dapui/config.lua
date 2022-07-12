local dap, dapui = require "dap", require "dapui"
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = "<cr>",
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  floating = {
    border = "rounded",
    mappings = {
      close = { "q", "<esc>" },
    },
  },
  windows = { indent = 1 },
  layouts = {
    {
      elements = {
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
        "repl",
        "console",
      },
      size = 0.30, -- With this value
      position = "bottom",
    },
  },
}
-- add listeners to auto open DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
