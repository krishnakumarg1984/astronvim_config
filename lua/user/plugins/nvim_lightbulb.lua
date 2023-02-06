return {
  "kosayoda/nvim-lightbulb", -- VSCode bulb for neovim's built-in LSP.
  event = { "CursorHold", "CursorHoldI" },
  config = function()
    require("nvim-lightbulb").setup {
      sign = { enabled = false },
      virtual_text = { enabled = true },
      autocmd = { enabled = true },
    }
  end,
}
