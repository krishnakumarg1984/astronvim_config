return {
  {
    "nvim-neotest/neotest", --  An extensible framework for interacting with tests within NeoVim.
    lazy = false,
    dependencies = {
      "rouge8/neotest-rust", --  Neotest adapter for Rust, using cargo-nextest.
      ft = "rust",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-rust" {
            args = { "--no-capture" },
            dap_adapter = "lldb",
          },
        },
      }
    end,
    vim.keymap.set(
      "n",
      "<leader>za",
      function() require("neotest").run.attach() end,
      { desc = "Attach to the nearest test" }
    ),
    vim.keymap.set(
      "n",
      "<leader>zd",
      function() require("neotest").run.run { strategy = "dap" } end,
      { desc = "Debug nearest test" }
    ),
    vim.keymap.set(
      "n",
      "<leader>zf",
      function() require("neotest").run.run(vim.fn.expand "%") end,
      { desc = "Run all tests in current file" }
    ),
    vim.keymap.set("n", "<leader>zk", function() require("neotest").run.stop() end, { desc = "Stop the nearest test" }),
    vim.keymap.set("n", "<leader>zn", function() require("neotest").run.run() end, { desc = "Run nearest test" }),
    vim.keymap.set(
      "n",
      "<leader>zo",
      function() require("neotest").output.open { short = true } end,
      { desc = "Open test output window" }
    ),
    vim.keymap.set(
      "n",
      "<leader>zp",
      function() require("neotest").output_panel.toggle() end,
      { desc = "Test output panel (toggle)" }
    ),
    vim.keymap.set(
      "n",
      "<leader>zs",
      function() require("neotest").summary.toggle() end,
      { desc = "Summary of tests (toggle)" }
    ),
    vim.keymap.set(
      "n",
      "]n",
      function() require("neotest").jump.next { status = "failed" } end,
      { desc = "Next failed test" }
    ),
    vim.keymap.set(
      "n",
      "[n",
      function() require("neotest").jump.prev { status = "failed" } end,
      { desc = "Prev failed test" }
    ),
  },
}
