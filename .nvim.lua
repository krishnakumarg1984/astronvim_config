-- vim: foldmethod=marker:foldlevel=0:

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

local utils = require "astronvim.utils"

-- local diagcspell = false
-- if vim.fn.executable "cspell" == 1 then diagcspell = diagnostics.cspell end
null_ls.register {
  -- code_actions.cspell,
  -- diagnostics.actionlint,
  -- diagnostics.codespell.with {
  --   extra_args = { "--ignore-words=.dialect.utf-8.add" },
  -- },
  -- diagnostics.cppcheck,
  -- diagnostics.cspell,
  -- diagnostics.ltrs,
  -- diagnostics.editorconfig_checker,
  -- diagnostics.flake8,
  -- diagnostics.gitlint,
  -- diagnostics.hadolint,
  -- diagnostics.jsonlint,
  -- diagnostics.luacheck,
  -- diagnostics.misspell,
  -- diagnostics.mypy,
  -- diagnostics.proselint,
  -- diagnostics.pylint,
  -- diagnostics.shellcheck,
  -- diagnostics.textlint,
  -- diagnostics.vale,
  -- diagnostics.vacuum, -- problematic
  -- diagnostics.vint,
  -- diagnostics.vulture,
  -- diagnostics.yamllint,
  -- formatting.black,
  -- formatting.cbfmt,
  -- formatting.clang_format,
  -- formatting.cmake_format,
  -- formatting.codespell,
  -- formatting.fixjson,
  -- formatting.rome, -- uses tabs by default
  -- formatting.shfmt,
  formatting.stylua.with {
    condition = function(utils) return utils.root_has_file { "stylua.toml", ".stylua.toml" } end,
  },
  -- formatting.yamlfmt,
  -- null_ls.builtins.code_actions.gitrebase,
  -- null_ls.builtins.code_actions.shellcheck,
  -- null_ls.builtins.hover.dictionary,
}

-- Other project-specific 'diagnostic-linters' and 'formatters' to consider {{{
-- diagnostics.actionlint,
-- diagnostics.ansiblelint,
-- diagnostics.checkmake,
-- diagnostics.chktex,
-- diagnostics.codespell,
-- diagnostics.flake8,
-- diagnostics.gitlint,
-- diagnostics.hadolint,
-- diagnostics.markdownlint,
-- diagnostics.mlint,
-- diagnostics.mypy,
-- diagnostics.proselint,
-- diagnostics.pydocstyle.with { extra_args = { "--config=$ROOT/setup.cfg" } },
-- diagnostics.pylama,
-- diagnostics.pylint,
-- diagnostics.pyproject_flake8,
-- diagnostics.revive.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.rstcheck,
-- diagnostics.selene,
-- diagnostics.semgrep,
-- diagnostics.shellcheck.with { diagnostics_format = "[#{c}] #{m} (#{s})" },
-- diagnostics.sqlfluff,
-- diagnostics.staticcheck.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.stylint,
-- diagnostics.textlint,
-- diagnostics.vale,
-- diagnostics.vint,
-- diagnostics.vulture, -- usually not available in path
-- diagnostics.write_good,
-- diagnostics.yamllint,
-- formatting.asmformat,
-- formatting.bibclean,
-- formatting.brittany,
-- formatting.format_r, -- needs the 'R' command to be in $PATH
-- formatting.fprettify,
-- formatting.goformat,
-- formatting.goimports,
-- formatting.latexindent,
-- formatting.mdformat,
-- formatting.perltidy,
-- formatting.reorder_python_imports,
-- formatting.rustfmt,
-- formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
-- formatting.sqlfluff,
-- formatting.standardrb,
-- formatting.styler, -- needs the 'R' command to be in $PATH
-- formatting.taplo,
-- formatting.textlint,
-- }}}
