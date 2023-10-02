-- https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/lsp.lua
return {
  plugins = {
    -- If this plugin does not work try running MyPy from the
    -- command line first
    pylsp_mypy = {
      enabled = true,
      live_mode = true,
    },
  },
}
