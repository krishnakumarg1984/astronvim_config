if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    dashboard = { enabled = false },
    indent = { enabled = false },
    notifier = { timeout = 1000 },
    gitbrowse = {
      config = function(opts)
        table.insert(opts.remote_patterns, 1, { "^ssh://git%.mehalter%.com/(.*)", "https://code.mehalter.com/%1" })
      end,
      url_patterns = {
        ["code%.mehalter%.com"] = {
          branch = "/src/branch/{branch}",
          file = "/src/branch/{branch}/{file}#L{line_start}-L{line_end}",
          permalink = "/src/commit/{commit}/{file}#L{line_start}-L{line_end}",
          commit = "/commit/{commit}",
        },
      },
    },
    picker = {
      win = {
        preview = { wo = { number = false, relativenumber = false, signcolumn = "no", foldcolumn = "0" } },
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>i"] = {
              function()
                local image = require "snacks.image"
                image.doc.hover_close()
                image.hover()
                vim.api.nvim_create_autocmd("CursorMoved", {
                  once = true,
                  group = vim.api.nvim_create_augroup("snacks_image_cleanup", { clear = true }),
                  callback = function() image.doc.hover_close() end,
                })
              end,
              desc = "Hover image",
            },
            ["<Leader>gI"] = { function() require("snacks").gh.issue() end, desc = "GitHub Issues" },
            ["<Leader>gP"] = { function() require("snacks").gh.pr() end, desc = "GitHub Pull Requests" },
          },
        },
      },
    },
  },
}
