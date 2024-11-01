-- plugins table and opts table are the two arguments in the below lazy setup call
require("lazy").setup({
  -- { import = "community" },
  { import = "base" },
  { import = "plugins" },
} --[[@as LazySpec]], {
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
  -- Configure any other `lazy.nvim` configuration options here
  diff = { cmd = "terminal_git" },
  -- diff = { cmd = "diffview.nvim" },
  install = { colorscheme = { "catppuccin", "astrodark", "habamax", "kanagawa" } },
  -- install = { colorscheme = { "astrotheme", "habamax" } },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
  ui = { backdrop = 100 },
} --[[@as LazyConfig]])
