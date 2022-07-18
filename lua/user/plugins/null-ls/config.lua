local null_ls = require "null-ls"
-- local formatter_install = require "format-installer"
local sources = {
  -- insert any manual sources you want here
  -- null_ls.builtins.formatting.clang_format,
}
-- for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
--   local config = { command = formatter.cmd }
--   table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
-- end

null_ls.setup {
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
}
