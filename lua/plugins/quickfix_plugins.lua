-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "stevearc/quicker.nvim", -- Improved UI and workflow for the Neovim quickfix
    event = "VeryLazy",
    specs = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<Leader>xq"] = { function() require("quicker").toggle { focus = true } end, desc = "Toggle quickfix" },
              ["<Leader>xl"] = {
                function() require("quicker").toggle { focus = true, loclist = true } end,
                desc = "Toggle loclist",
              },
            },
          },
        },
      },
    },
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {
      keys = {
        {
          ">",
          function() require("quicker").expand { before = 2, after = 2, add_to_existing = true } end,
          desc = "Expand quickfix context",
        },
        {
          "<",
          function() require("quicker").collapse() end,
          desc = "Collapse quickfix context",
        },
      },
    },
  },
  -- {
  --   "yorickpeterse/nvim-pqf", -- Prettier quickfix/location list for Neovim
  --   -- event = { "QuickFixCmdPre", "QuickFixCmdPost" },
  --   -- lazy = false,
  --   event = { "VeryLazy" },
  --   config = function()
  --     require("pqf").setup {
  --       signs = {
  --         error = "E",
  --         warning = "W",
  --         info = "I",
  --         hint = "H",
  --       },
  --       show_multiple_lines = true,
  --     }
  --   end,
  -- },
  -- {
  --   "kevinhwang91/nvim-bqf", -- Better quickfix window in Neovim, polish old quickfix window.
  --   enable = false,
  --   ft = "qf",
  --   opts = {
  --     preview = { auto_preview = false },
  --     func_map = {
  --       split = "-",
  --       vsplit = "|",
  --     },
  --   },
  -- },
}
