if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui", -- UI Configuration Engine built for AstroNvim
  ---@type AstroUIOpts
  opts = {
    -- colorscheme = "astrodark", -- change colorscheme
    -- colorscheme = "catppuccin",
    -- colorscheme = "kanagawa-wave",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = { -- set highlights for all themes
      -- use a function override to let us use lua to retrieve colors from highlight group there is no default table so we don't need to put a parameter for this function
      init = function(colors_name)
        local get_hlgroup = require("astroui").get_hlgroup

        -- Global Highlights --
        local highlights = {
          CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
          GitSignsCurrentLineBlame = { fg = get_hlgroup("NonText").fg, italic = true }, -- italicize git blame virtual text
          ZenBg = { link = "Normal" }, -- Set zen-mode background to Normal mode
        }

        -- Custom Telescope Theme (default for all colorschemes except catppuccin)
        if not colors_name:match "^catppuccin.*" then
          local normal = get_hlgroup "Normal"
          local fg, bg = normal.fg, normal.bg
          local bg_alt = get_hlgroup("Visual").bg
          local green = get_hlgroup("String").fg
          -- local red = get_hlgroup("Error").fg
          -- local red = get_hlgroup("Error").fg
          -- local nontext = get_hlgroup "NonText"
          highlights.TelescopeBorder = { fg = bg_alt, bg = bg }
          highlights.TelescopeNormal = { bg = bg }
          highlights.TelescopePreviewBorder = { fg = bg, bg = bg }
          highlights.TelescopePreviewNormal = { bg = bg }
          -- highlights.TelescopePreviewTitle = { fg = bg, bg = green }
          highlights.TelescopePreviewTitle = { fg = fg, bg = bg_alt }
          -- highlights.TelescopePromptBorder = { fg = bg_alt, bg = bg_alt }
          -- highlights.TelescopePromptNormal = { fg = fg, bg = bg_alt }
          -- highlights.TelescopePromptPrefix = { fg = red, bg = bg_alt }
          -- highlights.TelescopePromptTitle = { fg = bg, bg = red }
          highlights.TelescopePromptTitle = { fg = bg, bg = fg }
          -- highlights.TelescopeResultsBorder = { fg = bg, bg = bg }
          highlights.TelescopeResultsNormal = { bg = bg }
          -- highlights.TelescopeResultsTitle = { fg = bg, bg = bg }
          highlights.TelescopeResultsTitle = { fg = bg, bg = green }
        end

        return highlights
      end,
    },
    -- highlights = {
    --   init = { -- this table overrides highlights in all themes
    --     Normal = { bg = "#000000" },
    --   },
    --   astrodark = { -- a table of overrides/changes when applying the astrotheme theme
    --     Normal = { bg = "#000000" },
    --   },
    -- },
    -- icons = { -- Icons can be configured throughout the interface
    --   -- configure the loading of the lsp in the status line
    --   LSPLoading1 = "⠋",
    --   LSPLoading2 = "⠙",
    --   LSPLoading3 = "⠹",
    --   LSPLoading4 = "⠸",
    --   LSPLoading5 = "⠼",
    --   LSPLoading6 = "⠴",
    --   LSPLoading7 = "⠦",
    --   LSPLoading8 = "⠧",
    --   LSPLoading9 = "⠇",
    --   LSPLoading10 = "⠏",
    -- },
  },
}
