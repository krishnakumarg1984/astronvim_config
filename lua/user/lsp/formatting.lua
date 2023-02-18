-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

return {
  -- control auto formatting on save
  -- format_on_save = {
  --   enabled = true, -- enable or disable format on save globally
  -- If you have allow_filetypes it will take presidence over ignore_filetypes. So please only use one of these options at a time
  --   allow_filetypes = { -- enable format on save for specified filetypes only
  --     -- "go",
  --   },
  --   ignore_filetypes = { -- disable format on save for specified filetypes
  --     -- "python",
  --   },
  -- },
  -- a client listed in the disabled list will always be disabled and then all other clients will then be passed into the filter function
  disabled = { -- disable formatting capabilities for the listed language servers
    "clangd",
    "cmake",
    "jsonls",
    "neocmakelsp",
    "pylsp",
    "lua_ls",
    "taplo",
  },
  -- filter = function(client) -- fully override the default formatting function
  --   -- only enable null-ls for javascript files
  --   -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
  --   if vim.bo.filetype == "cmake" then return client.name == "null-ls" end

  --   -- enable all other clients
  --   return true
  -- end,
  -- timeout_ms = 1000, -- default format timeout
}

-- Some notes on project-specific auto formatting (((

-- https://discord.com/channels/939594913560031363/939857762043695165/1030514633775255683
-- like you want to disable a specific project from auto formatting?
-- in your vimrc.lua file that gets loaded you just need to set vim.g.autoformat_enabled = false
-- that will stop the auto formatter from running on start up
-- But to  note, lsp.formatting.format_on_save needs to be enabled for this variable to do anything (this is described in the docs and in the user_example)
-- or you can just disable it all together
-- but if you do vim.g.autoformat_enabled = false you still have the option once you are running AstroNvim to do <leader>uf to toggle the auto formatting on and then back off
-- autoformat_enabled variable just controls the toggling startup value when the auto formatter is enabled

-- )))
