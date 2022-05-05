-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, nvim_window = pcall(require, "nvim-window")
if not status_ok then
  return
end

vim.cmd [[
map <silent> <M-w> :lua require('nvim-window').pick()<CR>
]]

-- local opts_remapsilent = { noremap = false, silent = true }
-- local keymap = vim.api.nvim_set_keymap -- Shorten function name
-- keymap("n", "<M-w>", "nvim_window.pick()<CR>", opts_remapsilent)
