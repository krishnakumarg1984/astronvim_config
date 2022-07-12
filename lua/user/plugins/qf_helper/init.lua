return {
  event = { "QuickFixCmdPre", "QuickFixCmdPost" },
  cmd = {
    "QNext", -- Go to next quickfix or loclist entry, choosing based on which is non-empty and which is open. Uses prefer_loclist option to tiebreak.
    "QNext!", -- Go to next quickfix or loclist entry, choosing based on which is non-empty and which is open. Uses prefer_loclist option to tiebreak.
    "QPrev", -- Go to previous quickfix or loclist entry, choosing based on which is non-empty and which is open. Uses prefer_loclist option to tiebreak.
    "QPrev!", -- Go to previous quickfix or loclist entry, choosing based on which is non-empty and which is open. Uses prefer_loclist option to tiebreak.
    "QFNext", -- Same as cnext, but wraps at the end of the list
    "QFNext!", -- Same as cnext, but wraps at the end of the list
    "QFPrev", -- Same as cprev, but wraps at the beginning of the list
    "QFPrev!", -- Same as cprev, but wraps at the beginning of the list
    "LLNext", -- Same as lnext, but wraps at the end of the list
    "LLNext!", -- Same as lnext, but wraps at the end of the list
    "LLPrev", -- Same as lprev, but wraps at the beginning of the list
    "LLPrev!", -- Same as lprev, but wraps at the beginning of the list
    "QFOpen", -- Same as copen, but dynamically sizes the window. With [!] cursor stays in current window.
    "QFOpen!", -- Same as copen, but dynamically sizes the window. With [!] cursor stays in current window.
    "LLOpen", -- Same as lopen, but dynamically sizes the window. With [!] cursor stays in current window.
    "LLOpen!", -- Same as lopen, but dynamically sizes the window. With [!] cursor stays in current window.
    "QFToggle", -- Open or close the quickfix window. With [!] cursor stays in current window.
    "QFToggle!", -- Open or close the quickfix window. With [!] cursor stays in current window.
    "LLToggle", -- Open or close the loclist window. With [!] cursor stays in current window.
    "LLToggle!", -- Open or close the loclist window. With [!] cursor stays in current window.
    "Keep", -- (In qf buffer) Keep the item or range of items, remove the rest
    "Reject", -- (In qf buffer) Remove the item or range of items
  },
  config = function() require "user.plugins.qf_helper.config" end,
}
