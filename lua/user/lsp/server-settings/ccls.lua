---@diagnostic disable-next-line: different-requires
local nilfunc = function(...) return nil end

return {
  filetypes = { "c", "cpp", "cuda", "objc", "objcpp", "opencl" },
  -- offset_encoding = "utf-8",
  handlers = {
    ["textDocument/publishDiagnostics"] = nilfunc,
    ["textDocument/signatureHelp"] = nilfunc,
  },
}
