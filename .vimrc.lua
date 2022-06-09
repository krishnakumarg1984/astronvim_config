-- vim: foldmethod=marker:foldlevel=0:
-- local has_run = False
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local null_ls = require "null-ls"

-- null_ls.setup()

if not local_vimrc_has_run then
  -- list of globally installed sources in $PATH (not those installed with ':FInstall')
  null_ls.register {
    formatting.stylua.with {
      condition = function(utils)
        return utils.root_has_file { "stylua.toml", ".stylua.toml" }
      end,
    },
    -- formatting.black,
    formatting.clang_format,
    diagnostics.cppcheck,
    null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.hover.dictionary,
  }
  null_ls.enable {}
end
local_vimrc_has_run = 1 -- silly workaround to stop local '.vimrc.lua' from being loaded twice due to a bug in the "klen/config-local.nvim" plugin

-- Other project-specific 'diagnostic-linters' and 'formatters' to consider {{{
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
-- diagnostics.actionlint,
-- diagnostics.ansiblelint,
-- diagnostics.checkmake,
-- diagnostics.chktex,
-- diagnostics.codespell,
-- diagnostics.cspell,  -- requires 'npm'
-- diagnostics.flake8,
-- diagnostics.gitlint,
-- diagnostics.hadolint,
-- diagnostics.jsonlint,
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
-- }}}
