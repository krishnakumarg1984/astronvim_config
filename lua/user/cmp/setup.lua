-- Source priorities of 'cmp'

return {
  setup = function()
    local cmp = require "cmp"
    local user_source = astronvim.get_user_cmp_source
    local git_sources = cmp.config.sources(
      { user_source "git" },
      { user_source(require("user.cmp_sources").buffer_source) }
    )
    return {
      filetype = {
        gitcommit = { sources = git_sources },
        NeogitCommitMessage = { sources = git_sources },
        -- lua = {
        --   sources = {
        --     user_source "lsp",
        --   },
        -- },
      },
      -- cmd = {
      --   [":"] = {
      --     mapping = cmp.mapping.preset.cmdline(),
      --     sources = cmp.config.sources({
      --       user_source "path",
      --     }, {
      --       user_source "cmd",
      --     }),
      --   },
      -- },
    }
  end,
}
