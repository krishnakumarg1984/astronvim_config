return {
  window = {
    -- border = "none",
    -- margin = { -10, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    -- margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 3, max = 14 }, -- min and max height of the columns
    width = { min = 10, max = 50 }, -- min and max width of the columns
  },
  plugins = {
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
    },
  },
}
