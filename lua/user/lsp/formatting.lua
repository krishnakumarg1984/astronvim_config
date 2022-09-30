return {
  disabled = { "sumneko_lua" },
  filter = function(client)
    -- only enable null-ls for javascript files
    if vim.bo.filetype == "javascript" then
      return client.name == "null-ls"
    end

    -- enable all other clients
    return true
  end,
}
