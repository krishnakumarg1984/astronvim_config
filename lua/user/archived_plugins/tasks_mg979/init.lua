return {
  keys = {
    "<Plug>(Tasks-Choose)",
    "<Plug>(Tasks-Choose!)",
    "<Plug>(Tasks-Profile)",
    "<Plug>)(Tasks-FileNext)",
    "<Plug>(Tasks-FileNext)",
  },
  cmd = {
    "Async!",
    "Async",
    "AsyncBuf!",
    "AsyncBuf",
    "AsyncCmd!",
    "AsyncCmd",
    "Compiler!",
    "Compiler",
    "Grep!",
    "Grep",
    "GrepAdd!",
    "GrepAdd",
    "Jobs!",
    "Jobs",
    "LCompiler!",
    "LCompiler",
    "LGrep!",
    "LGrep",
    "LGrepAdd!",
    "LGrepAdd",
    "LMake!",
    "LMake",
    "Make!",
    "Make",
    "Task!",
    "Task",
    "Tasks!",
    "Tasks",
    "TasksOpen",
    "TasksProfile!",
    "TasksProfile",
  },
  vim.keymap.set("n", "<F2>", "<Plug>(Tasks-Choose)", { desc = "Choose tasks" }),
  vim.keymap.set("n", "<S-F2>", "<Plug>(Tasks-Choose)!", { desc = "Choose tasks (stay in buffer)" }),
  vim.keymap.set("n", "<F3>", "<Plug>(Tasks-Profile)", { desc = "Tasks profile" }),
}