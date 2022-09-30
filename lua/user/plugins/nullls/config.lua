local null_ls = require "null-ls"
local sources = {
  -- insert any manual sources you want here
  -- null_ls.builtins.formatting.clang_format,
}

null_ls.setup {
  sources = sources,
}
