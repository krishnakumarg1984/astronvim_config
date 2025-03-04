-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "jinh0/eyeliner.nvim", -- Move faster with unique f/F indicators.
    enabled = true,
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  {
    "krishnakumarg1984/readline.nvim", -- Readline motions and deletions in Neovim
    event = { "InsertCharPre", "CmdlineEnter" },
    config = function()
      local readline = require "readline"
      vim.keymap.set("!", "<C-a>", readline.dwim_beginning_of_line)
      vim.keymap.set("!", "<M-f>", readline.forward_word)
      vim.keymap.set("!", "<M-b>", readline.backward_word)
      vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
      vim.keymap.set("!", "<C-e>", readline.end_of_line)
      vim.keymap.set("!", "<M-d>", readline.kill_word)
      vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
      vim.keymap.set("!", "<C-w>", readline.unix_word_rubout)
      vim.keymap.set({ "i" }, "<M-m>", readline.back_to_indentation)
      vim.keymap.set("c", "<C-k>", readline.kill_line)
      vim.keymap.set("!", "<C-u>", readline.dwim_backward_kill_line)
      vim.keymap.set({ "i" }, "<C-f>", "<Right>")
      vim.keymap.set("!", "<C-b>", "<Left>")
    end,
  },
}
