return function()
  -- get highlights from highlight groups
  local get_hlgroup = require("core.utils").get_hlgroup
  local normal = get_hlgroup "Normal"
  local fg, bg = normal.fg, normal.bg
  local bg_alt = get_hlgroup("Visual").bg
  local green = get_hlgroup("String").fg
  local red = get_hlgroup("Error").fg
  return {
    HighlightURL = { underline = true },
    TelescopeBorder = { fg = bg_alt, bg = bg },
    TelescopeNormal = { bg = bg },
    TelescopePreviewBorder = { fg = bg, bg = bg },
    TelescopePreviewNormal = { bg = bg },
    TelescopePreviewTitle = { fg = bg, bg = green },
    -- -- TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
    -- -- TelescopePromptNormal = { fg = fg, bg = bg_alt },
    -- -- TelescopePromptPrefix = { fg = red, bg = bg_alt },
    -- -- TelescopePromptTitle = { fg = bg, bg = red },
    TelescopePromptTitle = { fg = bg, bg = fg },
    TelescopeResultsBorder = { fg = bg, bg = bg },
    TelescopeResultsNormal = { bg = bg },
    -- -- TelescopeResultsTitle = { fg = bg, bg = green },
    TelescopeResultsTitle = { fg = bg, bg = green },
  }
end
