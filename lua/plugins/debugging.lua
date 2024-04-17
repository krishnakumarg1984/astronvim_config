return {
  {
    "sakhnik/nvim-gdb", -- Neovim thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB
    -- keys = { "" },
    cmd = {
      "Gdb",
      "GdbBreak",
      "GdbBreakpointClearAll",
      "GdbBreakpointToggle",
      "GdbContinue",
      "GdbCreateWatch",
      "GdbDebugStop",
      "GdbEvalRange",
      "GdbEvalWord",
      "GdbFinish",
      "GdbFrame",
      "GdbFrameDown",
      "GdbFrameUp",
      "GdbInterrupt",
      "GdbLopenBacktrace",
      "GdbLopenBreakpoints",
      "GdbNext",
      "GdbOver",
      "GdbPrev",
      "GdbRun",
      "GdbStart",
      "GdbStartBashDB",
      "GdbStartLLDB",
      "GdbStartPDB",
      "GdbStartRR",
      "GdbStep",
      "GdbUntil",
    },
    config = function()
      vim.g.nvimgdb_disable_start_keymaps = true
    end,
  },
}
