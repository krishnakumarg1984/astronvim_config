-- local has_run = False
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local null_ls = require "null-ls"
-- require("null-ls").get_sources()

-- null_ls.setup()

if not local_vimrc_has_run then
  null_ls.disable {}
  null_ls.reset_sources()
  null_ls.register(formatting.stylua.with {
    condition = function(utils)
      return utils.root_has_file { "stylua.toml", ".stylua.toml" }
    end,
    -- formatting.asmformat,
    -- formatting.bibclean,
    -- formatting.black,
    -- formatting.brittany,
    -- formatting.clang_format,
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
    -- formatting.stylua.with {
    --   condition = function(utils)
    --     return utils.root_has_file { "stylua.toml", ".stylua.toml" }
    --   end,
    -- },
    -- formatting.taplo,
    -- diagnostics.actionlint,
    -- diagnostics.ansiblelint,
    -- diagnostics.checkmake,
    -- diagnostics.chktex,
    -- diagnostics.codespell,
    -- diagnostics.cppcheck,
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
    null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.hover.dictionary,
  })
  null_ls.enable {}
end
local_vimrc_has_run = 1
