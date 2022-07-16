local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then return end
local colorizer_opts = {
  { "*" },
  {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = false, -- "Name" codes like Blue
    RRGGBBAA = false, -- #RRGGBBAA hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = false, -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "virtualtext", -- Set the display mode
  },
}
colorizer.setup(colorizer_opts[1], colorizer_opts[2])
