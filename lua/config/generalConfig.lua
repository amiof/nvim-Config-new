-- for change unused variable color
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.api.nvim_set_hl(0, "@lsp.type.unused", { fg = "#5c6370", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#5c6370", italic = true })

-----end for change unused variable color
---
---
------------change icon for DapBreakpoint
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "bug", linehl = "", numhl = "" })
vim.cmd("highlight bug guifg=#ff0000")
vim.fn.sign_define("DapStopped", { text = " ", texthl = "arrow", linehl = "", numhl = "" })
vim.cmd("highlight arrow guifg=#ffff00")
require('transparent').clear_prefix('BufferLine')
--for laggy move
vim.o.lazyredraw = true


------------end change icon for DapBreakpoint

