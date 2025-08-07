vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.leader = "space"

require("config.lazy")
require("core.mapping")
require("core.option")
require("config.masonConfig")
require("core.dianoticMapping")
require("core.telescopeMapping")
require("lsp.lspConfig")
require("config.colorscheme")
require("config.whichkey-config")
require("config.generalConfig")



-----add snippets
local ls = require("luasnip")
-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- Load custom javascript
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/typescript" } }
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/rust" } }
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/python" } }
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/vue" } }
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/angular" } }
ls.filetype_extend("all", { "_" })



-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- require("lazy").setup("plugins")
--
--
--
--
-- -- Set unnamedplus to use Wayland clipboard
-- vim.opt.clipboard:append { 'unnamedplus' }
--
-- -- Ensure clipboard provider is set
-- vim.g.clipboard = {
--   name = 'wl-clipboard (Wayland)',
--   copy = {
--     ['+'] = 'wl-copy --foreground --type text/plain',
--     ['*'] = 'wl-copy --foreground --primary --type text/plain',
--   },
--   paste = {
--     ['+'] = 'wl-paste --no-newline',
--     ['*'] = 'wl-paste --no-newline --primary',
--   },
--   cache_enabled = true,
-- }
--
--
--
--
