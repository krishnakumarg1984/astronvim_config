-- https://raw.githubusercontent.com/lucax88x/configs/master/dotfiles/.config/nvim/lua/lt/lsp/servers/jsonls.lua

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas {
        select = {
          "package.json",
          ".eslintrc",
          "GitHub Action",
          "prettierrc.json",
        },
      },
      validate = { enable = true },
    },
  },
}
