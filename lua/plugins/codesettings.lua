if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "mrjones2014/codesettings.nvim",
  opts = {
    live_reload = true,
  },
  specs = {
    {
      "AstroNvim/astrolsp",
      ---@type AstroLSPOpts
      opts = {
        handlers = {
          ["*"] = function(server)
            vim.lsp.config(server, {
              before_init = require("astrocore").patch_func(
                vim.lsp.config[server].before_init,
                function(orig, params, config)
                  require("codesettings").with_local_settings(config.name, config)
                  return orig(params, config)
                end
              ),
            })
            vim.lsp.enable(server)
          end,
        },
      },
    },
  },
}
