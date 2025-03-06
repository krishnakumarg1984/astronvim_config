require("lazy").setup({
  { import = "base" }, -- "${astronvim_user_root}/lua/base.lua" file
  { import = "plugins" }, -- "${astronvim_user_root}/lua/plugins" directory
  { import = "community" }, -- "${astronvim_user_root}/lua/community" directory
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  dev = {
    ---@param plugin LazyPlugin
    path = function(plugin)
      local dir = plugin.url:match "^https://(.*)%.git$"
      return dir and vim.env.GIT_PATH and vim.env.GIT_PATH .. "/" .. dir or "~/projects/" .. plugin.name
    end,
    patterns = {
      -- "AstroNvim", -- local AstroNvim
    },
  },
  defaults = { lazy = true },
  diff = { cmd = "terminal_git" },
  -- install = { colorscheme = { "catppuccin", "astrotheme", "habamax", "kanagawa", "kanagawa-wave" } },
  install = { colorscheme = { "catppuccin", "astrodark", "habamax", "kanagawa", "kanagawa-wave" } },
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
  ui = { backdrop = 100 },
} --[[@as LazyConfig]])
