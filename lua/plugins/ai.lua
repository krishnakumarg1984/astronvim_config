return {
  -- {
  --   "monkoose/neocodeium",
  --   cmd = "NeoCodeium",
  --   -- event = "VeryLazy",
  --   config = function()
  --     local neocodeium = require "neocodeium"
  --     neocodeium.setup()
  --   end,
  --   dependencies = {
  --     {
  --       "AstroNvim/astrocore",
  --       opts = function(_, opts)
  --         local maps = opts.mappings
  --         maps.n["<Leader>u!"] =
  --           { function() require("neocodeium.commands").toggle() end, desc = "Toggle AI assistant" }
  --         maps.n["<S-CR>"] = { function() require("neocodeium").chat() end }
  --         maps.i["<S-]>"] = { function() require("neocodeium").cycle_or_complete() end }
  --         maps.i["<S-\\>"] = maps.i["<M-]>"]
  --         maps.i["<S-[>"] = { function() require("neocodeium").cycle_or_complete(-1) end }
  --         maps.i["<S-CR>"] = { function() require("neocodeium").accept() end }
  --         maps.i["<S-BS>"] = { function() require("neocodeium").clear() end }
  --
  --         opts.autocmds.codeium = {
  --           {
  --             event = "User",
  --             pattern = "NeoCodeiumCompletionDisplayed",
  --             callback = function() require("cmp").abort() end,
  --           },
  --         }
  --       end,
  --     },
  --   },
  -- },
}