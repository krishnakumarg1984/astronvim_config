local neotest = require "neotest"
vim.keymap.set("n", "<leader>Ta", "neotest.run.attach()<CR>", { desc = "Attach" })
vim.keymap.set("n", "<leader>Td", function() neotest.run.run { strategy = "dap" } end, { desc = "Debug test" })
vim.keymap.set("n", "<leader>Tl", function() neotest.run.run_last() end, { desc = "Re-test last" })
vim.keymap.set(
  "n",
  "<leader>TL",
  function() neotest.run.run_last { strategy = "dap" } end,
  { desc = "Debug last test" }
)
vim.keymap.set("n", "<leader>Tm", function() neotest.summary.run_marked() end, { desc = "Test marked" })
vim.keymap.set(
  "n",
  "<leader>TN",
  function() neotest.jump.prev { status = "failed" } end,
  { desc = "Goto prev failed test" }
)
vim.keymap.set(
  "n",
  "<leader>Tn",
  function() neotest.jump.next { status = "failed" } end,
  { desc = "Goto next failed test" }
)
vim.keymap.set(
  "n",
  "<leader>TO",
  function() neotest.output.open { enter = true, short = true } end,
  { desc = "Open test output (short)" }
)
vim.keymap.set("n", "<leader>To", function() neotest.output.open { enter = true } end, { desc = "Open test output" })
vim.keymap.set("n", "<leader>Tp", function() neotest.summary.toggle() end, { desc = "Toggle summary" })
vim.keymap.set("n", "<leader>Tr", function() neotest.run.run(vim.fn.expand "%") end, { desc = "Test file" })
vim.keymap.set("n", "<leader>Ts", function()
  for _, adapter_id in ipairs(neotest.run.adapters()) do
    neotest.run.run { suite = true, adapter = adapter_id }
  end
end, { desc = "Test suite" })
vim.keymap.set("n", "<leader>Tt", function() neotest.run.run() end, { desc = "Test nearest" })

neotest.setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = true, console = "integratedTerminal" },
    },
  },
}
