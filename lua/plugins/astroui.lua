-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "astrodark",
    colorscheme = "kanagawa",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    -- highlights = {
    --   init = { -- this table overrides highlights in all themes
    --     -- Normal = { bg = "#000000" },
    --   },
    --   astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
    --     -- Normal = { bg = "#000000" },
    --   },
    -- },
    highlights = {
      init = function(colors_name)
        local get_hlgroup = require("astroui").get_hlgroup

        -- Global Highlights --
        local highlights = {
          CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
          GitSignsCurrentLineBlame = { fg = get_hlgroup("NonText").fg, italic = true }, -- italicize git blame virtual text
          -- HighlightURL = { underline = true }, -- always underline URLs
          -- OctoEditable = { fg = "NONE", bg = "NONE" }, -- use treesitter for octo.nvim highlighting
          ZenBg = { link = "Normal" }, -- Set zen-mode background to Normal mode
        }

        -- NvChad like Telescope Theme --
        -- if not colors_name:match "^catppuccin.*" then
        --   local normal = get_hlgroup "Normal"
        --   local fg, bg = normal.fg, normal.bg
        --   local bg_alt = get_hlgroup("Visual").bg
        --   local green = get_hlgroup("String").fg
        --   local red = get_hlgroup("Error").fg
        --   highlights.TelescopeBorder = { fg = bg_alt, bg = bg }
        --   highlights.TelescopeNormal = { bg = bg }
        --   highlights.TelescopePreviewBorder = { fg = bg, bg = bg }
        --   highlights.TelescopePreviewNormal = { bg = bg }
        --   highlights.TelescopePreviewTitle = { fg = bg, bg = green }
        --   highlights.TelescopePromptBorder = { fg = bg_alt, bg = bg_alt }
        --   highlights.TelescopePromptNormal = { fg = fg, bg = bg_alt }
        --   highlights.TelescopePromptPrefix = { fg = red, bg = bg_alt }
        --   highlights.TelescopePromptTitle = { fg = bg, bg = red }
        --   highlights.TelescopeResultsBorder = { fg = bg, bg = bg }
        --   highlights.TelescopeResultsNormal = { bg = bg }
        --   highlights.TelescopeResultsTitle = { fg = bg, bg = bg }
        -- end

        return highlights
      end,
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}