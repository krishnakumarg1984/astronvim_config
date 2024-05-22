-- vim: foldmethod=marker:foldlevel=0:

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local tools_to_run = {}
local astrocore = require "astrocore"
if vim.fn.executable "alex" == 1 then astrocore.list_insert_unique(tools_to_run, { diagnostics.alex }) end
if vim.fn.executable "biome" == 1 then astrocore.list_insert_unique(tools_to_run, { formatting.biome }) end
if vim.fn.executable "codespell" == 1 then
  astrocore.list_insert_unique(tools_to_run, { diagnostics.codespell, formatting.codespell })
end
if vim.fn.executable "gitlint" == 1 then astrocore.list_insert_unique(tools_to_run, { diagnostics.gitlint }) end
if vim.fn.executable "markdownlint-cli2" == 1 then
  astrocore.list_insert_unique(tools_to_run, { diagnostics.markdownlint_cli2 })
end
if vim.fn.executable "proselint" == 1 then astrocore.list_insert_unique(tools_to_run, { code_actions.proselint }) end
if vim.fn.executable "selene" == 1 then astrocore.list_insert_unique(tools_to_run, { diagnostics.selene }) end
if vim.fn.executable "textlint" == 1 then astrocore.list_insert_unique(tools_to_run, { diagnostics.textlint }) end
if vim.fn.executable "mdformat" == 1 then astrocore.list_insert_unique(tools_to_run, { formatting.mdformat }) end
if vim.fn.executable "stylua" == 1 then astrocore.list_insert_unique(tools_to_run, { formatting.stylua }) end
if vim.fn.executable "yamlfix" == 1 then astrocore.list_insert_unique(tools_to_run, { formatting.yamlfix }) end

null_ls.register(tools_to_run)

-- Other project-specific 'diagnostic-linters' and 'formatters' to consider {{{
-- code_actions.cspell, -- https://github.com/davidmh/cspell.nvim
-- diagnostics.actionlint,
-- diagnostics.ansiblelint,
-- diagnostics.checkmake,
-- diagnostics.chktex,
-- diagnostics.cppcheck,
-- diagnostics.cspell, -- https://github.com/davidmh/cspell.nvim
-- diagnostics.editorconfig_checker,
-- diagnostics.flake8,
-- diagnostics.hadolint,
-- diagnostics.jsonlint,
-- diagnostics.ltrs,
-- diagnostics.markdownlint,
-- diagnostics.misspell,
-- diagnostics.mlint,
-- diagnostics.mypy,
-- diagnostics.proselint,
-- diagnostics.pydocstyle.with { extra_args = { "--config=$ROOT/setup.cfg" } },
-- diagnostics.pylama,
-- diagnostics.pylint,
-- diagnostics.pyproject_flake8,
-- diagnostics.revive.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.rstcheck,
-- diagnostics.semgrep,
-- diagnostics.shellcheck.with { diagnostics_format = "[#{c}] #{m} (#{s})" },
-- diagnostics.sqlfluff,
-- diagnostics.staticcheck.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.stylint,
-- diagnostics.vale,
-- diagnostics.vint,
-- diagnostics.vulture,
-- diagnostics.write_good,
-- diagnostics.yamllint,
-- formatting.asmformat,
-- formatting.bibclean,
-- formatting.brittany,
-- formatting.cbfmt,
-- formatting.clang_format,
-- formatting.cmake_format,
-- formatting.fixjson,
-- formatting.format_r, -- needs the 'R' command to be in $PATH
-- formatting.fprettify,
-- formatting.goformat,
-- formatting.goimports,
-- formatting.latexindent,
-- formatting.markdownlint,
-- formatting.perltidy,
-- formatting.reorder_python_imports,
-- formatting.rustfmt,
-- formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
-- formatting.sqlfluff,
-- formatting.standardrb,
-- formatting.styler, -- needs the 'R' command to be in $PATH
-- formatting.taplo,
-- formatting.textlint,
-- null_ls.builtins.code_actions.gitrebase,
-- null_ls.builtins.code_actions.shellcheck,
-- null_ls.builtins.hover.dictionary,
-- }}}
