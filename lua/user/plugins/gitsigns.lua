return {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    -- delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map({ "n", "v", "x" }, "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    map(
      { "n", "v", "x" },
      "<leader>g<s-l>",
      "<cmd>Gitsigns toggle_current_line_blame<cr>",
      { desc = "Toggle current line blame" }
    )
    map({ "n", "v", "x" }, "<leader>g<s-r>", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

    map("n", "<leader>g<s-b>", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
    map("n", "<leader>g<s-t>", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

    -- map("n", "<leader>hD", function() gs.diffthis "~" end)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}
