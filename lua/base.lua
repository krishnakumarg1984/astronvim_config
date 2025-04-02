---@type LazySpec
return {
  {
    "AstroNvim/AstroNvim", -- an aesthetic & feature-rich neovim config (extensible & easy to use)
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = "\\", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = "\\", -- This ensures the localleader key must be configured before Lazy is set up
      -- icons_enabled = true, -- Default is true. Set false to disable icons (if nerd font isn't available)
      -- pin_plugins = nil, -- boolean. whether to pin plugins or not, if `nil` then will pin if version is set.
      -- update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
}
