-- vim: nofoldenable:
-- override the heirline setup call
return function(config)
  -- the first element of the configuration table is the statusline
  config[1] = {
    -- default highlight for the entire statusline
    hl = { fg = "fg", bg = "bg" },
    -- each element following is a component in astronvim.status module

    -- add the vim mode component
    astronvim.status.component.mode {
      -- enable mode text with padding as well as an icon before it
      mode_text = { pad_text = "center", icon = { kind = "VimIcon", padding = { right = 0, left = 0 } } },
      -- define the highlight color for the text
      hl = { fg = "bg" },
      -- surround the component with a separators
      surround = {
        -- it's a left element, so use the left separator
        separator = "left",
        -- set the color of the surrounding based on the current mode using astronvim.status module
        -- color = function() return { main = astronvim.status.hl.mode_bg(), right = "blank_bg" } end,
        color = function() return { main = astronvim.status.hl.mode_bg(), right = "file_info_bg" } end,
      },
    },
    -- we want an empty space here so we can use the component builder to make a new section with just an empty string
    -- astronvim.status.component.builder {
    --   { provider = "" },
    --   -- define the surrounding separator and colors to be used inside of the component
    --   -- and the color to the right of the separated out section
    --   surround = { separator = "left", color = { main = "blank_bg", right = "blank_bg" } },
    --   -- surround = { separator = "none", color = { main = "blank_bg", right = "file_info_bg" } },
    -- },
    -- add a section for the currently opened file information
    astronvim.status.component.file_info {
      -- enable the file_icon and disable the highlighting based on filetype
      filename = false,
      file_modified = false,
      file_icon = { highlight = false, padding = { left = 0 } },
      -- file_icon = { padding = { left = 0 } },
      -- add padding
      padding = { right = 0 },
      -- define the section separator
      -- surround = { separator = "left", condition = false },
      -- surround = { separator = "left", color = { left = "blank_bg", main = "blank_bg" } },
      surround = { separator = "left", color = { left = "file_info_bg", main = "file_info_bg" }, condition = false },
    },
    -- add a component for the current git branch if it exists and use no separator for the sections
    astronvim.status.component.git_branch { surround = { separator = "none" } },
    -- add a component for the current git diff if it exists and use no separator for the sections
    astronvim.status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
    -- fill the rest of the statusline
    -- the elements after this will appear in the middle of the statusline
    astronvim.status.component.fill(),
    -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
    astronvim.status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
    -- fill the rest of the statusline
    -- the elements after this will appear on the right of the statusline
    astronvim.status.component.fill(),
    -- add a component for the current diagnostics if it exists and use the right separator for the section
    astronvim.status.component.diagnostics { surround = { separator = "right" } },
    -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
    astronvim.status.component.lsp { lsp_progress = true, surround = { separator = "right" } },
    -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
    -- all of the children of this table will be treated together as a single component
    {
      -- define a simple component where the provider is just a folder icon
      astronvim.status.component.builder {
        -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
        { provider = astronvim.get_icon "FolderClosed" },
        -- add padding after icon
        padding = { right = 1 },
        -- set the foreground color to be used for the icon
        hl = { fg = "bg" },
        -- use the right separator and define the background color
        surround = { separator = "right", color = "folder_icon_bg" },
      },
      -- add a file information component and only show the current working directory name
      astronvim.status.component.file_info {
        -- we only want filename to be used and we can change the fname
        -- function to get the current working directory name
        filename = { fname = function() return vim.fn.getcwd() end, padding = { left = 1 } },
        -- filename = false,
        -- disable all other elements of the file_info component
        file_icon = false,
        file_modified = false,
        file_read_only = false,
        -- use no separator for this part but define a background color
        surround = { separator = "none", color = "file_info_bg" },
      },
    },
    -- the final component of the NvChad statusline is the navigation section
    -- this is very similar to the previous current working directory section with the icon
    { -- make nav section with icon border
      -- define a custom component with just a file icon
      astronvim.status.component.builder {
        { provider = astronvim.get_icon "DefaultFile" },
        -- add padding after icon
        padding = { right = 1 },
        -- set the icon foreground
        hl = { fg = "bg" },
        -- use the right separator and define the background color
        -- as well as the color to the left of the separator
        surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
      },
      -- add a navigation component and just display the percentage of progress in the file
      astronvim.status.component.nav {
        -- add some padding for the percentage provider
        percentage = { padding = { left = 1, right = 1 } },
        -- disable all other providers
        ruler = { pad_ruler = { line = 4, char = 2 } }, -- false,
        scrollbar = false,
        -- define the foreground color
        hl = { fg = "nav_icon_bg" },
        -- use no separator and define the background color
        surround = { separator = "none", color = "file_info_bg" },
      },
    },
  }

  -- a second element in the heirline setup would override the winbar
  -- by only providing a single element we will only override the statusline
  -- and use the default winbar in AstroNvim

  -- return the final confiuration table
  return config
end

-- return function(config)
--   config[1][9] = astronvim.status.component.nav { ruler = { pad_ruler = { line = 4, char = 2 } } }
--   return config
-- end

-- https://discord.com/channels/939594913560031363/942007419050029086/1029124964311371896
-- this will basically redefin the statusline to our default and add the padding that you want
-- but it will do less abstraction away just in case you ever want to make any changes later on
-- this will add a little bit of time to your startup time
-- so if you are worried about that and aren't planning on changing other stuff in the statusline
-- just go with the first block that's just 2 lines haha

-- return function(config)
--   local statusline = {
--     hl = { fg = "fg", bg = "bg" },
--     astronvim.status.component.mode(),
--     astronvim.status.component.git_branch(),
--     astronvim.status.component.file_info(
--       astronvim.is_available "bufferline.nvim" and { filetype = {}, filename = false, file_modified = false } or nil
--     ),
--     astronvim.status.component.git_diff(),
--     astronvim.status.component.diagnostics(),
--     astronvim.status.component.fill(),
--     astronvim.status.component.lsp(),
--     astronvim.status.component.treesitter(),
--     astronvim.status.component.nav { ruler = { pad_ruler = { line = 4, char = 2 } } },
--     astronvim.status.component.mode { surround = { separator = "right" } },
--   }
--
--   config[1] = statusline
--   return config
-- end
