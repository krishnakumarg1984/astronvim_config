local function yaml_ft(path, bufnr)
  -- get content of buffer as string
  local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  if type(content) == "table" then content = table.concat(content, "\n") end

  -- check if file is in roles, tasks, or handlers folder
  local path_regex = vim.regex "(ansible\\|group_vars\\|handlers\\|host_vars\\|playbooks\\|roles\\|vars\\|tasks)/"
  if path_regex and path_regex:match_str(path) then return "yaml.ansible" end

  -- check for known ansible playbook text and if found, return yaml.ansible
  local regex = vim.regex "hosts:\\|tasks:"
  if regex and regex:match_str(content) then return "yaml.ansible" end

  -- return yaml if nothing else
  return "yaml"
end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local utils = require "astrocommunity"
      return require("astrocore").extend_tbl(opts, {
        filetypes = {
          extension = {
            yml = utils.merge_filetype("yaml", vim.tbl_get(opts, "filetypes", "extension", "yml"), yaml_ft),
            yaml = utils.merge_filetype("yaml", vim.tbl_get(opts, "filetypes", "extension", "yaml"), yaml_ft),
          },
        },
      })
    end,
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ansiblels" })
  --   end,
  -- },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
  { "mfussenegger/nvim-ansible", ft = { "yaml", "yaml.ansible" } },
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = {
  --       ["yaml.ansible"] = { "prettier", stop_after_first = true },
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   optional = true,
  --   opts = {
  --     linters_by_ft = {
  --       ansible = { "ansible_lint" },
  --     },
  --   },
  -- },
}
