local M = {}

function M.add_null_ls_sources(new_sources)
  local null_ls_config = require("core.utils").user_plugin_opts("plugins.null-ls", {})
  vim.list_extend(null_ls_config.sources, new_sources)
  require("null-ls").setup(null_ls_config)
end

return M
