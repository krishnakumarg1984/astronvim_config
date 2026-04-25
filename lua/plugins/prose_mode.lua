if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prose_keymaps = {
  n = {
    ["z+"] = { "[s1z=", desc = "Fix spelling with top correction" },
  },
  ia = {
    ["--"] = "–",
    ["---"] = "—",
  },
}

local configure_prose_mode = function(new_state)
  if new_state == nil then
    vim.b.prose_mode = not vim.b.prose_mode
  else
    if vim.b.prose_mode == new_state then return end
    vim.b.prose_mode = new_state
  end
  if vim.b.prose_mode then
    vim.cmd.Pencil()
    require("astrocore").set_mappings(prose_keymaps, { buffer = true })
  else
    vim.cmd.NoPencil()
    for mode, maps in pairs(prose_keymaps) do
      for lhs, _ in pairs(maps) do
        vim.keymap.del(mode, lhs, { buffer = true })
      end
    end
  end
end

return {
  {
    "preservim/vim-pencil",
    cmd = {
      "Pencil",
      "NoPencil",
      "PencilOff",
      "TogglePencil",
      "PencilToggle",
      "SoftPencil",
      "PencilSoft",
      "HardPencil",
      "PencilHard",
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      commands = {
        ProseMode = {
          function()
            configure_prose_mode(true)
            vim.notify "Prose mode enabled"
          end,
        },
        ProseModeOff = {
          function()
            configure_prose_mode(false)
            vim.notify "Prose mode disabled"
          end,
          nargs = "?",
          complete = "buffer",
        },
        ProseModeToggle = {
          function()
            configure_prose_mode()
            vim.notify("Prose mode " .. (vim.b.prose_mode and "enabled" or "disabled"))
          end,
          nargs = "?",
          complete = "buffer",
        },
      },
      autocmds = {
        auto_capitalization = {
          {
            event = "InsertCharPre",
            callback = function(args)
              if
                -- word processing mode enabled locally or globally
                vim.b.prose_mode
                -- within a normal file buffer
                and require("astrocore.buffer").is_valid(args.buf)
                -- detected as a capitalization point
                and vim.fn.search([[\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#]], "bcnw") ~= 0
              then
                vim.v.char = string.upper(vim.v.char)
              end
            end,
          },
        },
      },
    },
  },
}
