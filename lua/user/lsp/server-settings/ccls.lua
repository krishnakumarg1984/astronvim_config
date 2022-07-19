local nilfunc = function(...)
  return nil
end

return {
  filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
  -- offset_encoding = "utf-8",
  handlers = {
    ["textDocument/publishDiagnostics"] = nilfunc,
    ["textDocument/signatureHelp"] = nilfunc,
  },
}
