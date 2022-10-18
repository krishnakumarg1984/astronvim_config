-- The names are based on the completion candidates for ':LspInstall'
-- Extend LSP configuration
servers = {
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

if vim.fn.executable "clang" == 1 then table.insert(servers, "clangd") end -- requires a reasonably new version of glibc
if vim.fn.executable "cmake" == 1 then table.insert(servers, "cmake") end
-- if vim.fn.executable "julia" then table.insert(servers, "julials") end
if vim.fn.executable "node" == 1 and vim.fn.executable "bash" == 1 then table.insert(servers, "bashls") end
if vim.fn.executable "node" == 1 then table.insert(servers, "vimls") end
if vim.fn.executable "python3" == 1 then table.insert(servers, "pylsp") end
-- if vim.fn.executable "r" then table.insert(servers, "r_language_server") end
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  table.insert(servers, "rust_analyzer")
  table.insert(servers, "taplo")
  table.insert(servers, "texlab")
end
if vim.fn.executable "tsc" == 1 then table.insert(servers, "yamlls") end
if vim.fn.executable "tsc" and vim.fn.executable "perl" == 1 then table.insert(servers, "perlnavigator") end

return servers
