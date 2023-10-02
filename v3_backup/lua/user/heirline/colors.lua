-- add new colors that can be used by heirline
return function(hl)
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  -- use helper function to get highlight group properties
  local comment_fg = get_hlgroup("Comment").fg
  hl.git_branch_fg = comment_fg
  hl.git_added = comment_fg
  hl.git_changed = comment_fg
  hl.git_removed = comment_fg
  hl.blank_bg = get_hlgroup("Folded").fg
  hl.file_info_bg = get_hlgroup("Visual").bg
  hl.nav_icon_bg = get_hlgroup("String").fg
  hl.nav_fg = hl.nav_icon_bg
  -- hl.folder_icon_bg = get_hlgroup("Error").fg
  hl.folder_icon_bg = "#aaaaaa"
  -- hl.file_info_modified_bg = "#EBEEEE"
  hl.file_info_modified_bg = "#efc0e0"
  hl.file_info_modified_fg = "#000000"
  return hl
end

-- add new colors that can be used by heirline
-- return {
--   -- background and foreground of modified file
--   -- blank_bg = "#5c6370",
--   -- buffer_bg = "#16161E",
--   -- file_info_bg = "#3e4452",
--   -- file_info_modified_bg = "#5f27d8",
--   -- file_info_modified_bg = "#efcfff",
--   -- folder_icon_bg = "#a86357",
--   -- folder_icon_bg = "#ec5f67",
--   -- tabline_bg = "none",
--   -- blank_bg = "#545c7e",
--   -- file_info_bg = "#3b4261",
--   -- file_info_modified_bg = "#EBEEEE",
--   -- file_info_modified_fg = "#1e222a",
--   -- folder_icon_bg = "#aaaaaa",
--   -- nav_icon_bg = "#89b06d",
-- }
