vim.keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
vim.keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
vim.keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
vim.keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
vim.keymap.set("n", "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
vim.keymap.set("n", "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
vim.keymap.set("n", "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
vim.keymap.set("n", "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
vim.keymap.set("n", "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })
vim.keymap.set("n", "<leader>bd", "<Cmd>BufferLineSortByDirectory<CR>", { desc = "Sort bufferline by directory" })
vim.keymap.set("n", "<leader>be", "<Cmd>BufferLineSortByExtension<CR>", { desc = "Sort bufferline by extension" })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePick<CR>", { desc = "Choose buffer (interactive)" })
vim.keymap.set("n", "<leader>bC", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close (interactive)" })
vim.keymap.set("n", "<leader>bM", "<Cmd>BufferLineMovePrev<CR>", { desc = "Reorder (move left)" })
vim.keymap.set("n", "<leader>bm", "<Cmd>BufferLineMoveNext<CR>", { desc = "Reorder (move right)" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer (toggle)" })
return {
  options = {
    -- numbers = "ordinal",
    -- close_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
    diagnostics = "nvim_lsp",
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then return "" end
      local icon = level:match "error" and " " or " "
      return " " .. icon .. count
      -- local s = " "
      -- for e, n in pairs(diagnostics_dict) do
      --   local sym = e == "error" and " "
      --   or (e == "warning" and " " or "" )
      --   s = s .. n .. sym
      -- end
      -- return s
    end,
    -- groups = {
    --   options = {
    --     toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    --   },
    --   items = {
    --     {
    --       name = "Tests", -- Mandatory
    --       highlight = {gui = "underline", guisp = "blue"}, -- Optional
    --       priority = 2, -- determines where it will appear relative to other groups (Optional)
    --       icon = "", -- Optional
    --       matcher = function(buf) -- Mandatory
    --         return buf.name:match('%_test') or buf.name:match('%_spec')
    --       end,
    --     },
    --     {
    --       name = "Docs",
    --       highlight = {gui = "undercurl", guisp = "green"},
    --       auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
    --       matcher = function(buf)
    --         return buf.name:match('%.md') or buf.name:match('%.txt')
    --       end,
    --       separator = { -- Optional
    --         style = require('bufferline.groups').separator.tab
    --       },
    --     }
    --   }
    -- },
    offsets = {
      {
        filetype = "neo-tree",
        text = " File Explorer",
        -- highlight = "Directory",
        highlight = "NeoTreeNormalNC",
        text_align = "left",
        padding = 1,
      },
    },
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then table.insert(result, { text = "  " .. error, guifg = "#EC5241" }) end

        if warning ~= 0 then table.insert(result, { text = "  " .. warning, guifg = "#EFB839" }) end

        if hint ~= 0 then table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" }) end

        if info ~= 0 then table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" }) end
        return result
      end,
    },
    themable = true,
  },
}
