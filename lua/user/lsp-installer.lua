-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- local function make_server_ready()
lsp_installer.on_server_ready(function(server)
  if server.name == "clangd" then
    -- NOTE: Workaround for "warning: multiple different client offset_encodings detected for buffer, this is not supported yet".
    -- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997226723
    -- https://github.com/mars90226/dotvim/commit/8469adf6c750d4c38a96cbd2434802adaec9d728
    opts.capabilities.offsetEncoding = { "utf-16" }
    opts.capabilities.memoryUsageProvider = true
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  -- "bashls", -- requires nodejs
  "c",
  -- "clangd", -- requires a reasonably new version of glibc
  "cmake",
  -- "dockerls",  -- requires nodejs
  -- "dotls", -- requires nodejs
  "esbonio",
  "fortls",
  -- "ltex", -- slow to install on remote systems
  "opencl_ls",
  -- "pyright", -- requires nodejs
  "sumneko_lua",
  "texlab",
  -- "vimls", -- requires nodejs
  -- "yamlls", -- requires nodejs
  "zk",
  -- "ansiblels",
}

-- setup the LS
-- make_server_ready() -- LSP mappings

-- install the LS
for _, server in ipairs(servers) do
  install_server(server)
end
