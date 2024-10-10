---@type LazySpec
return {
  {
    "AstroNvim/AstroNvim", -- AstroNvim is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins
    branch = "v5",
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = "\\", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = "\\", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  -- { "AstroNvim/astrocommunity" },
  -- { import = "astrocommunity.pack.lua" },
}
