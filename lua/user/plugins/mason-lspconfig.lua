-- overrides `require("mason-lspconfig").setup(...)`
local my_ensure_installed = {
  -- "arduino_language_server", -- written in 'go'
  -- "asm_lsp", -- written in 'rust'
  -- "ccls",
  -- "fortls", -- written in 'python'
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
  "marksman",
  "prosemd_lsp",
  -- "python-lsp-server",
  "sumneko_lua",
  -- "pyright"
  -- "zk", -- link not found (404 error)
}

if vim.fn.executable "clang" == 1 then table.insert(my_ensure_installed, "clangd") end -- requires a reasonably new version of glibc
if vim.fn.executable "neocmakelsp" ~= 1 and vim.fn.executable "cmake" == 1 then
  table.insert(my_ensure_installed, "cmake")
end
-- if vim.fn.executable "julia" then table.insert(my_ensure_installed, "julials") end
if vim.fn.executable "node" == 1 and vim.fn.executable "bash" == 1 then table.insert(my_ensure_installed, "bashls") end
if vim.fn.executable "node" == 1 then table.insert(my_ensure_installed, "vimls") end
if vim.fn.executable "python3" == 1 then table.insert(my_ensure_installed, "pylsp") end
-- if vim.fn.executable "r" then table.insert(my_ensure_installed, "r_language_server") end
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  -- table.insert(my_ensure_installed, "rust_analyzer")
  table.insert(my_ensure_installed, "taplo")
  table.insert(my_ensure_installed, "texlab")
end
if vim.fn.executable "tsc" == 1 then table.insert(my_ensure_installed, "yamlls") end
if vim.fn.executable "tsc" and vim.fn.executable "perl" == 1 then table.insert(my_ensure_installed, "perlnavigator") end
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" == 1 then
  table.insert(my_ensure_installed, "rust_analyzer")
end

return {
  -- automatic_installation = true,
  ensure_installed = my_ensure_installed,
}
