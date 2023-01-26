-- vim: ft=lua:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

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
  },
}
