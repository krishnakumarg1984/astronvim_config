---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = function()
    local get_icon = require("astroui").get_icon

    ---@type trouble.Config
    return {
      keys = {
        ["<ESC>"] = "close",
        ["q"] = "close",
        ["<C-E>"] = "close",
      },
      icons = {
        indent = {
          fold_open = get_icon "FoldOpened",
          fold_closed = get_icon "FoldClosed",
        },
        folder_closed = get_icon "FolderClosed",
        folder_open = get_icon "FolderOpen",
      },
    }
  end,
  specs = {
    { "lewis6991/gitsigns.nvim", optional = true, opts = { trouble = true } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps, prefix = opts.mappings, "<Leader>x"
        maps.n[prefix .. "L"] = { "<Cmd>Trouble loclist toggle focus=true<CR>", desc = "Location List (Trouble)" }
        maps.n[prefix .. "Q"] = { "<Cmd>Trouble qflist toggle focus=true<CR>", desc = "Quickfix List (Trouble)" }
        maps.n[prefix .. "x"] = { "<Cmd>Trouble diagnostics toggle focus=true<CR>", desc = "Diagnostics (Trouble)" }
        maps.n[prefix .. "X"] =
          { "<Cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" }

        if require("astrocore").is_available "todo-comments.nvim" then
          maps.n[prefix .. "t"] =
            { "<Cmd>Trouble todo toggle focus=true filter.buf=0<CR>", desc = "Todo buffer (Trouble)" }
          maps.n[prefix .. "T"] = { "<Cmd>Trouble todo toggle focus=true<CR>", desc = "Todo (Trouble)" }
        end
      end,
    },
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.bottom then opts.bottom = {} end
        table.insert(opts.bottom, "Trouble")
      end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { lsp_trouble = true } },
    },
  },
}
