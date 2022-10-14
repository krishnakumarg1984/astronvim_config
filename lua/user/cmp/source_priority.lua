-- CMP Source Priorities
-- modify here the priorities of default cmp sources
-- higher value == higher priority
-- The value can also be set to a boolean for disabling default sources:
-- false == disabled
-- true == 1000
return {
  nvim_lsp = 1000,
  git = 900,
  luasnip = 750,
  nvim_lsp_signature_help = 700,
  pandoc_references = 600,
  -- latex_symbols = 700,
  buffer = 500,
  path = 250,
  emoji = 200,
  dictionary = 150,
}
