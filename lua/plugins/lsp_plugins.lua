-- vim: iskeyword-=-
-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
    keys = { { "<leader>ln", "<leader>ln", desc = "Toggle inline diag" } },
    config = function()
      local lsp_lines = require "lsp_lines"
      lsp_lines.setup()
      vim.keymap.set("", "<leader>ln", lsp_lines.toggle, { desc = "Toggle inline diagnostics" })
    end,
  },
  {
    "yorickpeterse/nvim-dd", --  Deferring of NeoVim diagnostics
    event = { "User AstroLspSetup" },
    opts = { timeout = 2500 },
  },
  {
    "kosayoda/nvim-lightbulb", -- VSCode bulb for neovim's built-in LSP.
    -- event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("nvim-lightbulb").setup {
        -- sign = { enabled = false },
        -- virtual_text = { enabled = true },
        autocmd = { enabled = true },
      }
    end,
  },
  -- {
  --   "ray-x/lsp_signature.nvim", -- LSP signature hint as you type
  --   event = "BufRead",
  --   config = function()
  --     local signature_config = {
  --       -- log_path = vim.fn.expand "$HOME" .. "/tmp/sig.log",
  --       hi_parameter = "Visual",
  --       -- hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlighted
  --       debug = true,
  --       hint_enable = false,
  --       -- handler_opts = { border = "single" },
  --       fix_pos = true,
  --       -- floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
  --       floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  --       -- floating_window_off_x = 75, -- adjust float windows x position.
  --       -- floating_window_off_y = -10, -- adjust float windows y position.
  --       max_width = 80,
  --       max_height = 10, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  --       toggle_key = "<A-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  --       doc_lines = 5,
  --       zindex = 50, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
  --       -- transparency = 90, -- disabled by default, allow floating win transparent value 1~100
  --     }
  --     require("lsp_signature").setup(signature_config)
  --   end,
  -- },
}
