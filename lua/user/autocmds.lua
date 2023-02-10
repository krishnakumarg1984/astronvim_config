-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- highlightyank (((

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "Search", timeout = 650 } end,
})

-- )))

-- autohidetabline (((

-- create an augroup to easily manage autocommands
vim.api.nvim_create_augroup("autohidetabline", { clear = true })
-- create a new autocmd on the "User" event
vim.api.nvim_create_autocmd("User", {
  desc = "Hide tabline when only one buffer and one tab", -- nice description
  -- triggered when vim.t.bufs is updated
  pattern = "AstroBufsUpdated", -- the pattern si the name of our User autocommand events
  group = "autohidetabline", -- add the autocmd to the newly created augroup
  callback = function()
    -- if there is more than one buffer in the tab, show the tabline
    -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
    local new_showtabline = #vim.t.bufs > 1 and 2 or 1
    -- check if the new value is the same as the current value
    if new_showtabline ~= vim.opt.showtabline:get() then
      -- if it is different, then set the new `showtabline` value
      vim.opt.showtabline = new_showtabline
    end
  end,
})

-- )))
