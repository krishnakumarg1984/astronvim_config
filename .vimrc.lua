-- local has_run = False
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local null_ls = require "null-ls"
-- require("null-ls").get_sources()

-- null_ls.setup()

if not has_run then
  null_ls.disable {}
  null_ls.reset_sources()
  null_ls.register(formatting.stylua.with {
    condition = function(utils)
      return utils.root_has_file { "stylua.toml", ".stylua.toml" }
    end,
  })
  null_ls.enable {}
end
has_run = 1

-- null_ls.reset_sources()
