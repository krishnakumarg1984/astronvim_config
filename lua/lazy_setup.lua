require("lazy").setup({
  {
    "AstroNvim/AstroNvim", -- AstroNvim is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins
    -- version = "^4", -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = "\\", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = "\\", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  defaults = { lazy = true },
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrodark", "habamax" } },
  ui = { backdrop = 100 },
  diff = { cmd = "diffview.nvim" },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
