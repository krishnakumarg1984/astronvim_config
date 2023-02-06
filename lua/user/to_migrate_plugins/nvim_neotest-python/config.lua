local neotest = require "neotest"

neotest.setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = true, console = "integratedTerminal" },
    },
  },
}
