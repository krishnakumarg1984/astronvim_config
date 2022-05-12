vim.g.null_ls_disable = false

-- vim.fn.pretty_print(vim.fn.expand "%:t")

-- You can just add more entries to that table and then recall the setup you can also do this in your .vimrc.lua
-- local file require("core.utils").user_plugin_opts("plugins.null-ls", { debug = false })
-- with the new PR and get the config table that you made in the user file set that to a variable and just edit it

-- mehalter — Yesterday at 4:25 PM
-- @krishnakumar I think what you want is this

-- local null_ls = require("null-ls")
-- local null_ls_config = require("core.utils").user_plugin_opts("plugins.null-ls", {})
-- vim.list_extend(null_ls_config.sources, {
--   null_ls.builtins.formatting.stylua,
--   -- add more sources here
-- })
-- null_ls.setup(null_ls_config)

-- if you plan on doing this a lot. Then I would probably recommend putting a helper function in your user/ folder in like user/utils.lua that looks like this:
--
-- local M = {}
--
-- function M.add_null_ls_sources(new_sources)
--   local null_ls_config = require("core.utils").user_plugin_opts("plugins.null-ls", {})
--   vim.list_extend(null_ls_config.sources, new_sources)
--   require("null-ls").setup(null_ls_config)
-- end
--
-- return M

-- then in your .vimrc.lua local config file you could do this
-- require("user.utils").add_null_ls_sources({
--   null_ls.formatting.stylua
--   -- add more sources here
-- })

-- you'll have to debug that add_null_ls_sources function
-- it might be unhappy with that vim.lis_extend call
-- looks like a null table is showing up somewhere
