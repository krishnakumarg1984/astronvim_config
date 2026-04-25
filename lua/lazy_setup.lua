require("lazy").setup({
  { import = "base" }, -- The AstroNvim plugin along with its leader-key opts
  -- { import = "community" }, -- 1) Either a file named lua/community.lua (this!) or 2) lua files in `lua/community/`
  { import = "plugins" }, -- Either 1) a file named lua/plugins.lua or 2) lua files in `lua/plugins/` (this!)
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  defaults = { lazy = true },
  diff = { cmd = "terminal_git" },
  -- try to load one of these colorschemes when starting an installation during startup
  install = { colorscheme = { "catppuccin", "astrodark", "habamax" } },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        -- "matchit",
        -- "matchparen",
        -- "tutor",
      },
    },
  },
  ui = { backdrop = 100 }, -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
  -- dev = {   -- When true, a local plugin directory will be used instead. See config.dev
  --   ---@param plugin LazyPlugin
  --   path = function(plugin)
  --     local dir = plugin.url:match "^https://(.*)%.git$"
  --     return dir and vim.env.GIT_PATH and vim.env.GIT_PATH .. "/" .. dir or "~/projects/" .. plugin.name
  --   end,
  --   patterns = {
  --     -- "AstroNvim", -- local AstroNvim
  --   },
  -- },
} --[[@as LazyConfig]])
