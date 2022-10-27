return {
  -- control auto formatting on save
  -- format_on_save = {
  --   enabled = true, -- enable or disable format on save globally
  --   allow_filetypes = { -- enable format on save for specified filetypes only
  --     -- "go",
  --   },
  --   disable_filetypes = { -- disable format on save for specified filetypes
  --     -- "python",
  --   },
  -- },
  -- if vim.tbl_contains({ "ccls", "clangd", "jsonls", "pylsp", "taplo" }, client.name) then
  --   astronvim.lsp.disable_formatting(client)
  -- end

  disabled = { -- disable formatting capabilities for the listed language servers
    "sumneko_lua",
  },
  -- timeout_ms = 1000, -- default format timeout
  -- filter = function(client) -- fully override the default formatting function
  --   -- only enable null-ls for javascript files
  --   if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
  --
  --   -- enable all other clients
  --   return true
  -- end,
}

-- https://discord.com/channels/939594913560031363/939857762043695165/1030512874428301352
-- @abalmos @krishnakumar I just pushed a new feature to AstroNvim nightly that adds <leader>uf to toggle auto formatting if it is enabled as well as new fields in lsp.formatting table to disable it on specific filetypes
-- https://discord.com/channels/939594913560031363/939857762043695165/1030514633775255683
-- like you want to disable a specific project from auto formatting?
-- in your vimrc.lua file that gets loaded you just need to set vim.g.autoformat_enabled = false
-- that will stop the auto formatter from running on start up
-- But to  note, lsp.formatting.format_on_save needs to be enabled for this variable to do anything (this is described in the docs and in the user_example)
-- or you can just disable it all together
-- but if you do vim.g.autoformat_enabled = false you still have the option once you are running AstroNvim to do <leader>uf to toggle the auto formatting on and then back off
-- autoformat_enabled variable just controls the toggling startup value when the auto formatter is enabled
-- Just pushed the new doc changes to the nightly section of the docs
-- it will take a few minutes to build and deploy, but should be up soon
-- https://astronvim.github.io/Recipes/advanced_lsp
--
-- it will be here
