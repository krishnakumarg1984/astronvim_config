return {
  {
    "jghauser/mkdir.nvim", -- This neovim plugin creates missing folders on save
    event = "BufWritePre",
  },
  {
    "luckasRanarison/nvim-devdocs",
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsOpenCurrent",
      "DevdocsOpenCurrentFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
    opts = {
      dir_path = vim.fn.stdpath "data" .. "/devdocs", -- installation directory
      telescope = {}, -- passed to the telescope picker
      telescope_alt = { -- when searching globally without preview
        layout_config = {
          width = 75,
        },
      },
      float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        height = 25,
        width = 100,
        border = "rounded",
      },
      -- wrap = false, -- text wrap
      wrap = true, -- text wrap
      previewer_cmd = "glow", -- for example: "glow"
      -- previewer_cmd = function()
      --   if vim.fn.executable "glow" == 1 then
      --     return "glow"
      --   else
      --     -- print "glow not found"
      --     return nil
      --   end
      -- end,
      cmd_args = { "-s", "dark", "-w", "80" },
      picker_cmd = true,
      picker_cmd_args = { "-p" },
      ensure_installed = { "bash", "c", "cpp", "cmake-3.26", "python-3.11" }, -- get automatically installed
    },
  },
}
