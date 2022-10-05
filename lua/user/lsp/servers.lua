-- The names are based on the completion candidates for ':LspInfo'
-- Extend LSP configuration
servers = {
  -- "arduino_language_server", -- written in 'go'
  -- "asm_lsp", -- written in 'rust'
  -- "ccls",
  -- "clangd", -- requires a reasonably new version of glibc
  "cmake", --
  -- "fortls", -- written in 'python'
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
  "marksman",
  "prosemd_lsp",
  -- "python-lsp-server",
  -- "r_language_server", -- needs R in path
  "sumneko_lua",
  -- "pyright"
  -- "taplo", -- problematic with rust/cargo installs
  -- "zk", -- link not found (404 error)
}

if vim.fn.executable "python3" == 1 then table.insert(servers, "pylsp") end

return servers
