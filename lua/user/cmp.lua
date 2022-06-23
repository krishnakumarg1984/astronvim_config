-- Source priorities of 'cmp'

-- modify here the priorities of default cmp sources
-- higher value == higher priority
-- The value can also be set to a boolean for disabling default sources:
-- false == disabled
-- true == 1000
return {
  source_priority = {
    luasnip = 1000,
    git = 900,
    nvim_lsp = 750,
    nvim_lsp_signature_help = 700,
    pandoc_references = 600,
    buffer = 500,
    path = 250,
    emoji = 200,
    dictionary = 150,
  },
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
