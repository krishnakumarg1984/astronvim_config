return {
  disabled = { -- disable formatting capabilities for the listed clients
    -- "sumneko_lua",
  },
  filter = function(client) -- fully override the default formatting function
    -- only enable null-ls for javascript files
    if vim.bo.filetype == "javascript" then return client.name == "null-ls" end

    -- enable all other clients
    return true
  end,
}
