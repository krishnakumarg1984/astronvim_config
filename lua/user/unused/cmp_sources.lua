M = {}

M.buffer_source = {
  name = "buffer",
  option = {
    get_bufnrs = function()
      local bufs = {}
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        bufs[vim.api.nvim_win_get_buf(win)] = true
      end
      return vim.tbl_keys(bufs)
    end,
  },
}

return M
