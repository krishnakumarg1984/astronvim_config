local my_custom_lsp_servers = {}

if vim.fn.executable "neocmakelsp" == 1 and vim.fn.executable "cmake" == 1 then
  table.insert(my_custom_lsp_servers, "neocmake")
end

return my_custom_lsp_servers
