local null_ls = require "null-ls"
local sources = {
  -- insert any manual sources you want here
  -- null_ls.builtins.formatting.clang_format,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client)
    if vim.bo.filetype == "cpp" then client.offset_encoding = "utf-32" end
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
}
