vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.number = true         -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.scrolloff = 8         -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.wrap = false          -- display lines as one long line
vim.opt.cursorline = true     -- highlight the current line
vim.opt.cursorcolumn = true
vim.opt.undofile = true       -- enable persistent undo
vim.opt.splitbelow = true     -- force all horizontal splits to go below current window
vim.opt.splitright = true     -- force all vertical splits to go to the right of current window
vim.opt.signcolumn = "yes"    -- always show the sign column otherwise it would shift the text each time
vim.opt.termguicolors = true  -- set term gui colors (most terminals support this)
vim.opt.hidden = true         -- required to keep multiple buffers and open multiple buffers
vim.opt.showmode = true       -- we don't need to see things like -- INSERT -- anymore
vim.opt.termbidi = true
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.opt.foldlevel = 1
vim.opt.arabicshape = true
-- vim.opt.arabic = true
vim.opt.fileencoding = "utf-8" -- the encoding written to a file


--------fold for better fold in ufo dont need
vim.opt.fillchars = { fold = "=",eob = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 2

----------------all config of vim
vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
-- vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
-- vim.opt.completeopt = { "menuone", "noselect" }
-- vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
-- vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
-- vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
-- vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
-- vim.opt.hlsearch = true -- highlight all matches on previous search pattern
-- vim.opt.ignorecase = true -- ignore case in search patterns
-- vim.opt.mouse = "a" -- allow the mouse to be used in neovim
-- vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 2 -- always show tabs
-- vim.opt.smartcase = true -- smart case
-- vim.opt.smartindent = true -- make indenting smarter again
-- vim.opt.splitbelow = true -- force all horizontal splits to go below current window
-- vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.title = true -- set the title of window to the value of the titlestring
-- vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
-- vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
-- vim.opt.undofile = true -- enable persistent undo
-- vim.opt.updatetime = 300 -- faster completion
-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
-- vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
-- vim.opt.tabstop = 2 -- insert 2 spaces for a tab
-- vim.opt.cursorline = true -- highlight the current line
-- vim.opt.number = true -- set numbered lines
-- vim.opt.relativenumber = false -- set relative numbered lines
-- vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
-- vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
-- vim.opt.wrap = false -- display lines as one long line 
-- vim.opt.spell = false
-- vim.opt.spelllang = "en"
-- vim.opt.scrolloff = 8 -- is one of my fav
-- vim.opt.sidescrolloff = 8
--
--
--
--code spell--------------------------------
-- vim.o.spellfile = vim.o.runtimepath .. "/spell/en.utf-8.add"
-- vim.env.SPELLHOME = vim.fn.stdpath("data") .. "/spell"
--
--
----------------------------
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.spelloptions="camel"
-----------------end code spell----------------------
vim.opt.autowrite = true           -- Enable auto write
vim.opt.clipboard = "unnamedplus"  -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 3           -- Hide * markup for bold and italic
vim.opt.confirm = true             -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true          -- Enable highlighting of the current line
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true      -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.laststatus = 0
vim.opt.list = false            -- Show some invisible characters (tabs...
-- vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true          -- Print line number
-- vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10         -- Maximum number of entries in a popup
vim.opt.relativenumber = true  -- Relative line numbers
-- vim.opt.scrolloff = 4 -- Lines of context
--
vim.opt.breakindent = true
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true    -- Round indent
vim.opt.shiftwidth = 2       -- Size of an indent
vim.opt.shortmess:append { W = true, I = true, c = true }
vim.opt.showmode = false     -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8    -- Columns of context
vim.opt.signcolumn = "yes"   -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true     -- Don't ignore case with capitals
vim.opt.smartindent = true   -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true    -- Put new windows below current
vim.opt.splitright = true    -- Put new windows right of current
vim.opt.tabstop = 2          -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
-- vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
-- vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5                -- Minimum window width
vim.opt.wrap = false                   -- Disable line wrap
if vim.fn.has("nvim-0.9.0") == 1 then
    vim.opt.splitkeep = "screen"
    vim.opt.shortmess:append { C = true }
end
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

